Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13B06660B2D
	for <lists+linux-x25@lfdr.de>; Sat,  7 Jan 2023 02:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjAGBDe (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Fri, 6 Jan 2023 20:03:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbjAGBDd (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Fri, 6 Jan 2023 20:03:33 -0500
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE58C8463E
        for <linux-x25@vger.kernel.org>; Fri,  6 Jan 2023 17:03:30 -0800 (PST)
Received: by mail-oo1-xc41.google.com with SMTP id 187-20020a4a09c4000000b004d8f3cb09f5so912239ooa.6
        for <linux-x25@vger.kernel.org>; Fri, 06 Jan 2023 17:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C56Q+YV0i1VwzqpPgsaApjf/2tDIDNvnJyLhwVpmM08=;
        b=VGUmEMTQw2QsK16ws/gGUjfmqMr5beHGL02XjUOYSma4PTDn21KJ8eyG94/KyBlls3
         jCa+WHbDNv4VI0X1t4AqunlpGGFoEjq9sffORpq7V4ik8D+P6/LItDmRPT/PEgxgSNKV
         D6uJPIgAWt3tmPWS9IezKQyUzbimrMVWK+C4TqX7x6ihiXHdwthOeJhEwPNjdjkyvlTI
         WjOYGbZ79lxIjKNOrLWrVqSgKNtI+ipmWmZRYbJozcxUbTKaierRdKhdFc1gFtBlKnjD
         n+YPYyVWRSHpJ/nMKIAX4TiSoKXQ30ccaUjef4i2BQHWXs2sMz1x5pQLGzFEvGhbcLGk
         Pfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C56Q+YV0i1VwzqpPgsaApjf/2tDIDNvnJyLhwVpmM08=;
        b=ZYynugRzRvl6Wrwdr8xLDAs4owDcC4sH5SxoZ5OioW7ogilg2yLkDDHeTWVF3DbAew
         yoE5R7Q/WLaxpnO3LdLqwKliwxkzVqekEIsUOYlzbpU9j98q1Gd14sXScfkUlxNpT3PS
         HSWDcLp712mnnyAT31nlXSdH5C3qvClyfhRAXfotZYfDG2lP61pN6bN8TmkjLc4+t9jT
         1R8Z6rKAw1YoX/suLHgZ9DufXxnomjygxJa1QtLc/oct4hX+hz46WXIwpRLhZjNNKINx
         5JmAWR/TVnDpqw4ankVZPvTvRUs2edA26/e6I1nW4xL4aK6pH4HcwpNmtSH/So5vfJcC
         xSgg==
X-Gm-Message-State: AFqh2krUwVbsK45TAKCpAdMFJ0W1jrLpNUQlSQLMLq+vjNGNYSG0sviY
        SDypwPjYW0Ts0r1/D3hZt0vdPfdD8/dFycdkN9802V8Gl58=
X-Google-Smtp-Source: AMrXdXtS2yx0seUEnEoCe0TQXbOkI63ubAWlUIISRG6so3ONPrDu1tgccTdfYqa/MHduEL5IhTtuuK25lmFZLnf7JzA=
X-Received: by 2002:a4a:9791:0:b0:49f:95ed:bdcd with SMTP id
 w17-20020a4a9791000000b0049f95edbdcdmr2549395ooi.68.1673053410219; Fri, 06
 Jan 2023 17:03:30 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6808:2387:0:0:0:0 with HTTP; Fri, 6 Jan 2023 17:03:29
 -0800 (PST)
Reply-To: jamesaissy13@gmail.com
From:   James AISSY <samueltia200@gmail.com>
Date:   Fri, 6 Jan 2023 17:03:29 -0800
Message-ID: <CAOD2y7kiQ9uFLXnHUu6+1wBi_05ROuFbRYGRAjufmJCtqp36GA@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

Hello My Dear,

I hope this message finds you in good Health.

My name is Mr. James AISSY. I am looking for a partner who is willing to
team up with me for potential investment opportunities. I shall provide the
FUND for the investment, and upon your acknowledgment of receiving this
Message I will therefore enlighten you with the Full Details of my
investment proposal.

I'm awaiting your Response.

My regards,
Mr. James AISSY.
