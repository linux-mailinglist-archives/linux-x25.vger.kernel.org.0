Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5C02C21E7
	for <lists+linux-x25@lfdr.de>; Tue, 24 Nov 2020 10:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731338AbgKXJk2 (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Tue, 24 Nov 2020 04:40:28 -0500
Received: from mxout70.expurgate.net ([91.198.224.70]:44765 "EHLO
        mxout70.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731615AbgKXJk0 (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Tue, 24 Nov 2020 04:40:26 -0500
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <ms@dev.tdt.de>)
        id 1khUo8-0007Ff-IZ; Tue, 24 Nov 2020 10:40:20 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ms@dev.tdt.de>)
        id 1khUo7-000EPI-TM; Tue, 24 Nov 2020 10:40:19 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id 0997F240041;
        Tue, 24 Nov 2020 10:40:19 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id 805B6240040;
        Tue, 24 Nov 2020 10:40:18 +0100 (CET)
Received: from mschiller01.dev.tdt.de (unknown [10.2.3.20])
        by mail.dev.tdt.de (Postfix) with ESMTPSA id 57C4620115;
        Tue, 24 Nov 2020 10:40:18 +0100 (CET)
From:   Martin Schiller <ms@dev.tdt.de>
To:     andrew.hendry@gmail.com, davem@davemloft.net, kuba@kernel.org,
        xie.he.0141@gmail.com
Cc:     linux-x25@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Schiller <ms@dev.tdt.de>
Subject: [PATCH net-next v6 5/5] net/x25: remove x25_kill_by_device()
Date:   Tue, 24 Nov 2020 10:39:38 +0100
Message-ID: <20201124093938.22012-6-ms@dev.tdt.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201124093938.22012-1-ms@dev.tdt.de>
References: <20201124093938.22012-1-ms@dev.tdt.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
Content-Transfer-Encoding: quoted-printable
X-purgate: clean
X-purgate-type: clean
X-purgate-ID: 151534::1606210820-00019A69-40DEB5D7/0/0
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

Remove obsolete function x25_kill_by_device(). It's not used any more.

Signed-off-by: Martin Schiller <ms@dev.tdt.de>
---
 net/x25/af_x25.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/net/x25/af_x25.c b/net/x25/af_x25.c
index 313a6222ded9..1432a05805ab 100644
--- a/net/x25/af_x25.c
+++ b/net/x25/af_x25.c
@@ -199,22 +199,6 @@ static void x25_remove_socket(struct sock *sk)
 	write_unlock_bh(&x25_list_lock);
 }
=20
-/*
- *	Kill all bound sockets on a dropped device.
- */
-static void x25_kill_by_device(struct net_device *dev)
-{
-	struct sock *s;
-
-	write_lock_bh(&x25_list_lock);
-
-	sk_for_each(s, &x25_list)
-		if (x25_sk(s)->neighbour && x25_sk(s)->neighbour->dev =3D=3D dev)
-			x25_disconnect(s, ENETUNREACH, 0, 0);
-
-	write_unlock_bh(&x25_list_lock);
-}
-
 /*
  *	Handle device status changes.
  */
--=20
2.20.1

