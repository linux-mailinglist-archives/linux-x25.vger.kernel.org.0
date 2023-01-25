Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 124F267B0AC
	for <lists+linux-x25@lfdr.de>; Wed, 25 Jan 2023 12:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235535AbjAYLJK (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Wed, 25 Jan 2023 06:09:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234911AbjAYLIo (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Wed, 25 Jan 2023 06:08:44 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E5974EFF
        for <linux-x25@vger.kernel.org>; Wed, 25 Jan 2023 03:08:43 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id y3-20020a17090a390300b00229add7bb36so1640717pjb.4
        for <linux-x25@vger.kernel.org>; Wed, 25 Jan 2023 03:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theori.io; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p1TZ9HgFaUKxGS7c+lLSxsI3P/cyPJN6ga8wsZCYuGY=;
        b=RqurFXTSNH1gTEosFbblzxWowqr1IVNJgjVZWBR+k+2ptzeUtGV8DfzWd4Z/wd2Zjl
         4dbmqWQciRUyE5DdwECInD4DtG52J1ip6ycrE4nKizPm3Z0jmjzOt6z984niv8kWskFb
         qJxy7WDLQ43ZkAjzYpgWmFkEGaDSx/GShBcMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1TZ9HgFaUKxGS7c+lLSxsI3P/cyPJN6ga8wsZCYuGY=;
        b=JsRuIlZndCkOpzy/1DOsI2jkMdUSG7dkqVMztJt7CDz4Lva9cw0SurstCzUPa7I41t
         Ch8KEg26TgDhXHzso0OuDmvbeh/BXJBwkGQ1N/BhRdp97Vf6gG9tzn73PhVWDrGfIjdd
         rkgtZd7VLJKOlyPx1C753BOg7Jq46I1BJqNkJ6JuNWtSmXabcKtERJWXEmRZyU6uOQ61
         EpC14QTnBQ+hEQ5Lfo3mvaIb+zRzlQ6/BvSKus39W0P9aXNyY2/1M1ghaRaCWQOq3y3X
         F6Yznzjw8QQuMEfV3vzXPl86JlTt8K7/ExU1diyGCph54oRdrxdxmY9TN/byoFfWQnPK
         XBEA==
X-Gm-Message-State: AFqh2kqqEAt1H04mzCeeCwTnUrj8j3+on4MKUPzLpa3R2UkLTrlGK4++
        wAWNSSc34r25rtyvq/IrSEx1Yg==
X-Google-Smtp-Source: AMrXdXvmeDWUgmAe8r/0jNtSomPn1ELkUhmgwqGY9Sq8MnDE/IJKwtX93wF1nwDeAc4QEzIo0aCimg==
X-Received: by 2002:a17:902:bd07:b0:194:9331:3d79 with SMTP id p7-20020a170902bd0700b0019493313d79mr32118890pls.32.1674644922650;
        Wed, 25 Jan 2023 03:08:42 -0800 (PST)
Received: from ubuntu ([39.115.108.115])
        by smtp.gmail.com with ESMTPSA id jc11-20020a17090325cb00b00189c62eac37sm3384683plb.32.2023.01.25.03.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 03:08:42 -0800 (PST)
Date:   Wed, 25 Jan 2023 03:08:37 -0800
From:   Hyunwoo Kim <v4bel@theori.io>
To:     patchwork-bot+netdevbpf@kernel.org
Cc:     ms@dev.tdt.de, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, v4bel@theori.io,
        imv4bel@gmail.com, linux-x25@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v2] net/x25: Fix to not accept on connected socket
Message-ID: <20230125110837.GA134263@ubuntu>
References: <20230123194323.GA116515@ubuntu>
 <167464081679.8627.16186557969987796753.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167464081679.8627.16186557969987796753.git-patchwork-notify@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

Dear,

This patch's description is incorrect and should not be applied.

Newly submitted corrected v3 patch:
https://lore.kernel.org/all/20230125110514.GA134174@ubuntu/


Regards,
Hyunwoo Kim
