Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A40F51F274
	for <lists+linux-x25@lfdr.de>; Mon,  9 May 2022 03:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233066AbiEIBdl (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Sun, 8 May 2022 21:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236001AbiEIBBq (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Sun, 8 May 2022 21:01:46 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD1D0BE09
        for <linux-x25@vger.kernel.org>; Sun,  8 May 2022 17:57:52 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id b18so21255562lfv.9
        for <linux-x25@vger.kernel.org>; Sun, 08 May 2022 17:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uk2GCo4tzO2z68A4aXi5qgjOdRQLhbqgNbxwMMvi8jk=;
        b=Nql1Yjsic1g62x+3t7bP9sHcXY0u/gU5tmXaF5KQZzfGTru2e4lVe0MtlZA0k3imjr
         YJxXKkTCdME5QT1vex+PZQooBQh5O0iISkVhcWdtmTb504b90IqPn944ijh9S2yR++u1
         IQ1fIJlmWrCDlpWRNr+iMvB8UtpS7SN/swZmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uk2GCo4tzO2z68A4aXi5qgjOdRQLhbqgNbxwMMvi8jk=;
        b=S/OjRFjfhgZm2q+m3pcwvqpQE0Nnz5SZ+ZT+Baw8f6AtVXjK7DeGCnVGK7iNgHAz6I
         /MMvRpepN2gskfauikejgjOdhZ7pZpUPxTxMCsh+lzuYOOkl1WGLRHT5HGZ4eZqnA+F9
         4o7zzzfahcFKax+LmTPPMVLH34eQuu/k9dm7hm0saFBHYOXweybgWwzAcUxZZrAOhWsI
         xc9e37L/lqskevlK3bSy9DSKk4DbSfWvYsgKySd3Scqf+QpTjGbGqfPxoXrBPrm/6NA3
         G2ZncnN2juz35+9OcjX9gzx8foxEFJzrdBoOIfkRSAwy/tfdWjXft4szspLX/BDCST+z
         m36A==
X-Gm-Message-State: AOAM530WD8PvR3OvZD8nomE4KObEhfuBAbo+VFvbMfoVVXPBQSpImttU
        m+T4lf834y1BuHyWy6tcWVKcJx4LLZuSd5EfF8p4Mw==
X-Google-Smtp-Source: ABdhPJxYBGZN3P6DUr9QO720p7L7DYzFc6NRLCCRB9YrdPE8dAs6b+kSAN+4GFnljqurF4eRVhDm4HNiVEwm+vNJoIs=
X-Received: by 2002:a05:6512:220d:b0:473:9ee1:660d with SMTP id
 h13-20020a056512220d00b004739ee1660dmr11065115lfu.326.1652057870802; Sun, 08
 May 2022 17:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220508214500.60446-1-colin.i.king@gmail.com>
In-Reply-To: <20220508214500.60446-1-colin.i.king@gmail.com>
From:   Ozgur <ozgurk@ieee.org>
Date:   Mon, 9 May 2022 04:57:40 +0400
Message-ID: <CAADfD8wApw_v+uDTijY1K89WRJ_f7tkHmz=6LR086yMjEU4mWQ@mail.gmail.com>
Subject: Re: [PATCH] x25: remove redundant pointer dev
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Martin Schiller <ms@dev.tdt.de>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-x25@vger.kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

On Mon, May 9, 2022 at 1:45 AM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> Pointer dev is being assigned a value that is never used, the assignment
> and the variable are redundant and can be removed. Also replace null check
> with the preferred !ptr idiom.
>

Hello,

*dev pointer is device assign global linked list and shouldnt be
touched by the driver so *dev wont get any value right?
Also seems to use this while network interface is initializing because
some activation information and stats information is also kept here,
for example, open *dev will call when ifconfig is called from.

route, link, forward these inital activate and move all values with
net_device *dev?

Regards

> Cleans up clang scan warning:
> net/x25/x25_proc.c:94:26: warning: Although the value stored to 'dev' is
> used in the enclosing expression, the value is never actually read
> from 'dev' [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  net/x25/x25_proc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/net/x25/x25_proc.c b/net/x25/x25_proc.c
> index 3bddcbdf2e40..91a2aade3960 100644
> --- a/net/x25/x25_proc.c
> +++ b/net/x25/x25_proc.c
> @@ -79,7 +79,6 @@ static int x25_seq_socket_show(struct seq_file *seq, void *v)
>  {
>         struct sock *s;
>         struct x25_sock *x25;
> -       struct net_device *dev;
>         const char *devname;
>
>         if (v == SEQ_START_TOKEN) {
> @@ -91,7 +90,7 @@ static int x25_seq_socket_show(struct seq_file *seq, void *v)
>         s = sk_entry(v);
>         x25 = x25_sk(s);
>
> -       if (!x25->neighbour || (dev = x25->neighbour->dev) == NULL)
> +       if (!x25->neighbour || !x25->neighbour->dev)
>                 devname = "???";
>         else
>                 devname = x25->neighbour->dev->name;
> --
> 2.35.1
>
