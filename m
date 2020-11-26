Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B423A2C4ECF
	for <lists+linux-x25@lfdr.de>; Thu, 26 Nov 2020 07:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731824AbgKZGgT (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Thu, 26 Nov 2020 01:36:19 -0500
Received: from mxout70.expurgate.net ([91.198.224.70]:21095 "EHLO
        mxout70.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731734AbgKZGgS (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Thu, 26 Nov 2020 01:36:18 -0500
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <ms@dev.tdt.de>)
        id 1kiAt3-000P2Y-FO; Thu, 26 Nov 2020 07:36:13 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ms@dev.tdt.de>)
        id 1kiAt2-0008w9-Jk; Thu, 26 Nov 2020 07:36:12 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id 5E540240041;
        Thu, 26 Nov 2020 07:36:12 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id D1328240040;
        Thu, 26 Nov 2020 07:36:11 +0100 (CET)
Received: from mschiller01.dev.tdt.de (unknown [10.2.3.20])
        by mail.dev.tdt.de (Postfix) with ESMTPSA id 851E2200F6;
        Thu, 26 Nov 2020 07:36:11 +0100 (CET)
From:   Martin Schiller <ms@dev.tdt.de>
To:     andrew.hendry@gmail.com, davem@davemloft.net, kuba@kernel.org,
        xie.he.0141@gmail.com
Cc:     linux-x25@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Schiller <ms@dev.tdt.de>
Subject: [PATCH net-next v7 1/5] net/x25: handle additional netdev events
Date:   Thu, 26 Nov 2020 07:35:53 +0100
Message-ID: <20201126063557.1283-2-ms@dev.tdt.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126063557.1283-1-ms@dev.tdt.de>
References: <20201126063557.1283-1-ms@dev.tdt.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: 151534::1606372573-00017060-7F0403B2/0/0
X-purgate-type: clean
X-purgate: clean
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

1. Add / remove x25_link_device by NETDEV_REGISTER/UNREGISTER and also
   by NETDEV_POST_TYPE_CHANGE/NETDEV_PRE_TYPE_CHANGE.

   This change is needed so that the x25_neigh struct for an interface
   is already created when it shows up and is kept independently if the
   interface goes UP or DOWN.

   This is used in an upcomming commit, where x25 params of an neighbour
   will get configurable through ioctls.

2. NETDEV_CHANGE event makes it possible to handle carrier loss and
   detection. If carrier is lost, clean up everything related to this
   neighbour by calling x25_link_terminated().

3. Also call x25_link_terminated() for NETDEV_DOWN events and remove the
   call to x25_clear_forward_by_dev() in x25_route_device_down(), as
   this is already called by x25_kill_by_neigh() which gets called by
   x25_link_terminated().

4. Do nothing for NETDEV_UP and NETDEV_GOING_DOWN events, as these will
   be handled in layer 2 (LAPB) and layer3 (X.25) will be informed by
   layer2 when layer2 link is established and layer3 link should be
   initiated.

Signed-off-by: Martin Schiller <ms@dev.tdt.de>
---
 net/x25/af_x25.c    | 22 ++++++++++++++++------
 net/x25/x25_link.c  |  6 +++---
 net/x25/x25_route.c |  3 ---
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/net/x25/af_x25.c b/net/x25/af_x25.c
index 046d3fee66a9..313a6222ded9 100644
--- a/net/x25/af_x25.c
+++ b/net/x25/af_x25.c
@@ -233,21 +233,31 @@ static int x25_device_event(struct notifier_block *=
this, unsigned long event,
 #endif
 	 ) {
 		switch (event) {
-		case NETDEV_UP:
+		case NETDEV_REGISTER:
+		case NETDEV_POST_TYPE_CHANGE:
 			x25_link_device_up(dev);
 			break;
-		case NETDEV_GOING_DOWN:
+		case NETDEV_DOWN:
 			nb =3D x25_get_neigh(dev);
 			if (nb) {
-				x25_terminate_link(nb);
+				x25_link_terminated(nb);
 				x25_neigh_put(nb);
 			}
-			break;
-		case NETDEV_DOWN:
-			x25_kill_by_device(dev);
 			x25_route_device_down(dev);
+			break;
+		case NETDEV_PRE_TYPE_CHANGE:
+		case NETDEV_UNREGISTER:
 			x25_link_device_down(dev);
 			break;
+		case NETDEV_CHANGE:
+			if (!netif_carrier_ok(dev)) {
+				nb =3D x25_get_neigh(dev);
+				if (nb) {
+					x25_link_terminated(nb);
+					x25_neigh_put(nb);
+				}
+			}
+			break;
 		}
 	}
=20
diff --git a/net/x25/x25_link.c b/net/x25/x25_link.c
index fdae054b7dc1..11e868aa625d 100644
--- a/net/x25/x25_link.c
+++ b/net/x25/x25_link.c
@@ -232,6 +232,9 @@ void x25_link_established(struct x25_neigh *nb)
 void x25_link_terminated(struct x25_neigh *nb)
 {
 	nb->state =3D X25_LINK_STATE_0;
+	skb_queue_purge(&nb->queue);
+	x25_stop_t20timer(nb);
+
 	/* Out of order: clear existing virtual calls (X.25 03/93 4.6.3) */
 	x25_kill_by_neigh(nb);
 }
@@ -277,9 +280,6 @@ void x25_link_device_up(struct net_device *dev)
  */
 static void __x25_remove_neigh(struct x25_neigh *nb)
 {
-	skb_queue_purge(&nb->queue);
-	x25_stop_t20timer(nb);
-
 	if (nb->node.next) {
 		list_del(&nb->node);
 		x25_neigh_put(nb);
diff --git a/net/x25/x25_route.c b/net/x25/x25_route.c
index 00e46c9a5280..ec2a39e9b3e6 100644
--- a/net/x25/x25_route.c
+++ b/net/x25/x25_route.c
@@ -115,9 +115,6 @@ void x25_route_device_down(struct net_device *dev)
 			__x25_remove_route(rt);
 	}
 	write_unlock_bh(&x25_route_list_lock);
-
-	/* Remove any related forwarding */
-	x25_clear_forward_by_dev(dev);
 }
=20
 /*
--=20
2.20.1

