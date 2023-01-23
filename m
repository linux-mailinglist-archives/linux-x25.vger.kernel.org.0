Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF806786A8
	for <lists+linux-x25@lfdr.de>; Mon, 23 Jan 2023 20:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbjAWTnc (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Mon, 23 Jan 2023 14:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbjAWTn3 (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Mon, 23 Jan 2023 14:43:29 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A0A27D6E
        for <linux-x25@vger.kernel.org>; Mon, 23 Jan 2023 11:43:28 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id jm10so12459287plb.13
        for <linux-x25@vger.kernel.org>; Mon, 23 Jan 2023 11:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theori.io; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zNk47sVvopA8jolI6ev1FyVna1awVNacTBUWQUXG894=;
        b=Dt95o176ZUHFDD2KI5sxqakI2dsdPzkYBhx+O5Vn2QwZywfEdwe7J1Ip2/dD8yxDD7
         Vhu2pfJS7mli+sYSbm094NZYnXUScznqDhiC8ArtxOl/uQwJRM8TVCgqLMUWnX+6BGyp
         UmhOYvCHDPPARRSoQhltwATxFEuDjHo6wzdEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zNk47sVvopA8jolI6ev1FyVna1awVNacTBUWQUXG894=;
        b=1GlACGHqwzNhE6swq2ryUJdWosewJF0OtNkSBAIfUbtHQVQ14N+LCe0BxQzuPNinI/
         vM9WQNHjcYQ4BSDM2XkwB0z9UWXT+XN1fN5N8jyzOYarYli3bBxCg4L0uzLP8Tad4h8F
         PjwUEDBrkoGFZ3rzc/VJgpc2piFvi1QEmAXt5xLFAhNjY3WP9Vpb55JkyioMk5YPXF+u
         PrVnQHvTrrEtme1MgYc8PrENdPe427iQaUi+HudVu2zV9sU948L13/LHFB3fp6rMuanp
         TuTpxIMNJiDhaMQdQmIOrZ0j2hfSZRhM9yUvjK/QjUI+04o7EJI7TuDYoQVjinxuMrXY
         3oJQ==
X-Gm-Message-State: AFqh2krUSfw0DDU9W8C32xe6frtUD2mhtz6yfPTcRqVmobnTpge5T7Qs
        EXmfIAiaUluypEESXnCp7vmVOw==
X-Google-Smtp-Source: AMrXdXv0Tq/sTANqOjHNZ1Z5HIjqVsvVODWvn7KfHeDS0i6WItlHDxnPAR466VuGJY5h9TR4LBfddg==
X-Received: by 2002:a17:903:28e:b0:193:335a:98ac with SMTP id j14-20020a170903028e00b00193335a98acmr29410598plr.68.1674503007978;
        Mon, 23 Jan 2023 11:43:27 -0800 (PST)
Received: from ubuntu ([39.115.108.115])
        by smtp.gmail.com with ESMTPSA id jh9-20020a170903328900b0019472226769sm55978plb.251.2023.01.23.11.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 11:43:27 -0800 (PST)
Date:   Mon, 23 Jan 2023 11:43:23 -0800
From:   Hyunwoo Kim <v4bel@theori.io>
To:     ms@dev.tdt.de, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     v4bel@theori.io, imv4bel@gmail.com, linux-x25@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH v2] net/x25: Fix to not accept on connected socket
Message-ID: <20230123194323.GA116515@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

When listen() and accept() are called on an x25 socket
that connect() succeeds, accept() succeeds immediately.
This is because x25_connect() queues the skb to
sk->sk_receive_queue, and x25_accept() dequeues it.

This creates a child socket with the sk of the parent
x25 socket, which can cause confusion.

Fix x25_listen() to return -EINVAL if the socket has
already been successfully connect()ed to avoid this issue.

Signed-off-by: Hyunwoo Kim <v4bel@theori.io>
---
 net/x25/af_x25.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/x25/af_x25.c b/net/x25/af_x25.c
index 3b55502b2965..5c7ad301d742 100644
--- a/net/x25/af_x25.c
+++ b/net/x25/af_x25.c
@@ -482,6 +482,12 @@ static int x25_listen(struct socket *sock, int backlog)
 	int rc = -EOPNOTSUPP;
 
 	lock_sock(sk);
+	if (sock->state != SS_UNCONNECTED) {
+		rc = -EINVAL;
+		release_sock(sk);
+		return rc;
+	}
+
 	if (sk->sk_state != TCP_LISTEN) {
 		memset(&x25_sk(sk)->dest_addr, 0, X25_ADDR_LEN);
 		sk->sk_max_ack_backlog = backlog;
-- 
2.25.1

