Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A75A2C4ED2
	for <lists+linux-x25@lfdr.de>; Thu, 26 Nov 2020 07:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388137AbgKZGg2 (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Thu, 26 Nov 2020 01:36:28 -0500
Received: from mxout70.expurgate.net ([91.198.224.70]:45683 "EHLO
        mxout70.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731734AbgKZGg2 (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Thu, 26 Nov 2020 01:36:28 -0500
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <ms@dev.tdt.de>)
        id 1kiAtE-0001ZO-7q; Thu, 26 Nov 2020 07:36:24 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ms@dev.tdt.de>)
        id 1kiAtD-000SA3-JF; Thu, 26 Nov 2020 07:36:23 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id 483EB240041;
        Thu, 26 Nov 2020 07:36:23 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id BA8A0240040;
        Thu, 26 Nov 2020 07:36:22 +0100 (CET)
Received: from mschiller01.dev.tdt.de (unknown [10.2.3.20])
        by mail.dev.tdt.de (Postfix) with ESMTPSA id 3A24D200F6;
        Thu, 26 Nov 2020 07:36:17 +0100 (CET)
From:   Martin Schiller <ms@dev.tdt.de>
To:     andrew.hendry@gmail.com, davem@davemloft.net, kuba@kernel.org,
        xie.he.0141@gmail.com
Cc:     linux-x25@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Schiller <ms@dev.tdt.de>
Subject: [PATCH net-next v7 2/5] net/lapb: support netdev events
Date:   Thu, 26 Nov 2020 07:35:54 +0100
Message-ID: <20201126063557.1283-3-ms@dev.tdt.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126063557.1283-1-ms@dev.tdt.de>
References: <20201126063557.1283-1-ms@dev.tdt.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
Content-Transfer-Encoding: quoted-printable
X-purgate-type: clean
X-purgate: clean
X-purgate-ID: 151534::1606372584-000040F5-AE428DF6/0/0
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

This patch allows layer2 (LAPB) to react to netdev events itself and
avoids the detour via layer3 (X.25).

1. Establish layer2 on NETDEV_UP events, if the carrier is already up.

2. Call lapb_disconnect_request() on NETDEV_GOING_DOWN events to signal
   the peer that the connection will go down.
   (Only when the carrier is up.)

3. When a NETDEV_DOWN event occur, clear all queues, enter state
   LAPB_STATE_0 and stop all timers.

4. The NETDEV_CHANGE event makes it possible to handle carrier loss and
   detection.

   In case of Carrier Loss, clear all queues, enter state LAPB_STATE_0
   and stop all timers.

   In case of Carrier Detection, we start timer t1 on a DCE interface,
   and on a DTE interface we change to state LAPB_STATE_1 and start
   sending SABM(E).

Signed-off-by: Martin Schiller <ms@dev.tdt.de>
---
 net/lapb/lapb_iface.c | 82 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 1 deletion(-)

diff --git a/net/lapb/lapb_iface.c b/net/lapb/lapb_iface.c
index 3c03f6512c5f..213ea7abc9ab 100644
--- a/net/lapb/lapb_iface.c
+++ b/net/lapb/lapb_iface.c
@@ -418,14 +418,94 @@ int lapb_data_transmit(struct lapb_cb *lapb, struct=
 sk_buff *skb)
 	return used;
 }
=20
+/* Handle device status changes. */
+static int lapb_device_event(struct notifier_block *this, unsigned long =
event,
+			     void *ptr)
+{
+	struct net_device *dev =3D netdev_notifier_info_to_dev(ptr);
+	struct lapb_cb *lapb;
+
+	if (!net_eq(dev_net(dev), &init_net))
+		return NOTIFY_DONE;
+
+	if (dev->type !=3D ARPHRD_X25)
+		return NOTIFY_DONE;
+
+	lapb =3D lapb_devtostruct(dev);
+	if (!lapb)
+		return NOTIFY_DONE;
+
+	switch (event) {
+	case NETDEV_UP:
+		lapb_dbg(0, "(%p) Interface up: %s\n", dev, dev->name);
+
+		if (netif_carrier_ok(dev)) {
+			lapb_dbg(0, "(%p): Carrier is already up: %s\n", dev,
+				 dev->name);
+			if (lapb->mode & LAPB_DCE) {
+				lapb_start_t1timer(lapb);
+			} else {
+				if (lapb->state =3D=3D LAPB_STATE_0) {
+					lapb->state =3D LAPB_STATE_1;
+					lapb_establish_data_link(lapb);
+				}
+			}
+		}
+		break;
+	case NETDEV_GOING_DOWN:
+		if (netif_carrier_ok(dev))
+			lapb_disconnect_request(dev);
+		break;
+	case NETDEV_DOWN:
+		lapb_dbg(0, "(%p) Interface down: %s\n", dev, dev->name);
+		lapb_dbg(0, "(%p) S%d -> S0\n", dev, lapb->state);
+		lapb_clear_queues(lapb);
+		lapb->state =3D LAPB_STATE_0;
+		lapb->n2count   =3D 0;
+		lapb_stop_t1timer(lapb);
+		lapb_stop_t2timer(lapb);
+		break;
+	case NETDEV_CHANGE:
+		if (netif_carrier_ok(dev)) {
+			lapb_dbg(0, "(%p): Carrier detected: %s\n", dev,
+				 dev->name);
+			if (lapb->mode & LAPB_DCE) {
+				lapb_start_t1timer(lapb);
+			} else {
+				if (lapb->state =3D=3D LAPB_STATE_0) {
+					lapb->state =3D LAPB_STATE_1;
+					lapb_establish_data_link(lapb);
+				}
+			}
+		} else {
+			lapb_dbg(0, "(%p) Carrier lost: %s\n", dev, dev->name);
+			lapb_dbg(0, "(%p) S%d -> S0\n", dev, lapb->state);
+			lapb_clear_queues(lapb);
+			lapb->state =3D LAPB_STATE_0;
+			lapb->n2count   =3D 0;
+			lapb_stop_t1timer(lapb);
+			lapb_stop_t2timer(lapb);
+		}
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block lapb_dev_notifier =3D {
+	.notifier_call =3D lapb_device_event,
+};
+
 static int __init lapb_init(void)
 {
-	return 0;
+	return register_netdevice_notifier(&lapb_dev_notifier);
 }
=20
 static void __exit lapb_exit(void)
 {
 	WARN_ON(!list_empty(&lapb_list));
+
+	unregister_netdevice_notifier(&lapb_dev_notifier);
 }
=20
 MODULE_AUTHOR("Jonathan Naylor <g4klx@g4klx.demon.co.uk>");
--=20
2.20.1

