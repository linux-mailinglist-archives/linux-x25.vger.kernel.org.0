Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D95E676BC9
	for <lists+linux-x25@lfdr.de>; Sun, 22 Jan 2023 10:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjAVJFh (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Sun, 22 Jan 2023 04:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjAVJFh (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Sun, 22 Jan 2023 04:05:37 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE396EAA
        for <linux-x25@vger.kernel.org>; Sun, 22 Jan 2023 01:05:36 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id v17so8001051oie.5
        for <linux-x25@vger.kernel.org>; Sun, 22 Jan 2023 01:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NK4DjyGQpMqw10x+mS5KkcoMyzskXFHKTg9WGMfZ5sk=;
        b=QjG4bt2fvOg1E8cHu2HdZltpga5a3/c0rkI9iLtZtGf/cMEUI5P98brq4WwCsUSCbA
         b7jTa0JJcW7SbzuDcd9whFm68gAnsgNmscvM+O05UL7+mXtLyD0NBhUYWgV5rvCfI3nE
         GyieAJbqfr/MsYp2r/fd1wlk46ijbDmYgb2/pSSWh4y6ysfz/Cmz9XKFv4uRHoT/r63L
         kT3L92FyJDVI0vw7fE0Tz3g0MWV7uDkm/dsOwSBvsK0HnRTFosn/McO5DSY3og7735yH
         Vmpv8GkeJhq9VXDYGBpys5MzLRsd1EPRrSrhlg30h+Ss0NKzPU1GjC6pU8uk2Ix0qbng
         1NFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NK4DjyGQpMqw10x+mS5KkcoMyzskXFHKTg9WGMfZ5sk=;
        b=PlJtjb7Myxww20VrQcBCbNJblYIEY+HaXcuV4ltlhTkGfLt6KOrnY1S33XBW9hRuX1
         gw0XKBuPhv8SRdir+nuKdbptcs0rJTodz6U4to2AdQ/s+CghrakDjHmjDDsXdmahQ3uy
         IYf+68ISXSLd+xcWqp/9Xfc4SAT3wCM7JDlCZYOdkWL9n9S2mqkdo0VyFMXiWv+AunXg
         jnkanY8nUMwFpKvD2svbIaj6kxFb30dD/4BOcxA926EiZPa0a8xXwys/9x4gk5Rd47y6
         hNsMOdImlslvgh4bfRNPgDfMlJ1BaXUMeA96ax5+IDWQxe2NNzNiZXBdprCDJ442QclC
         D05Q==
X-Gm-Message-State: AFqh2ko5zYUU2pIgQgDXL15A6v3UWkla3pakJ2a672QeAxNuxdAz9tiu
        tp7F0S54jb3nQreDkkV9WaL8RVEajgd07TmO/5U=
X-Google-Smtp-Source: AMrXdXsg3oVEC5KkHHTBdzoQYg6EI5byOOQmuzMouNEIUnCq57NwSv5OKRyZMxl5evwq/VrQkbQq79xbfvo5dYFNClA=
X-Received: by 2002:a05:6808:1688:b0:364:96ed:920e with SMTP id
 bb8-20020a056808168800b0036496ed920emr1140786oib.297.1674378335796; Sun, 22
 Jan 2023 01:05:35 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6839:6807:b0:5cc:4cd2:5e41 with HTTP; Sun, 22 Jan 2023
 01:05:35 -0800 (PST)
Reply-To: charleswjacksonjr32@gmail.com
From:   Charles W Jackson Jr <daharatugabduljalil@gmail.com>
Date:   Sun, 22 Jan 2023 01:05:35 -0800
Message-ID: <CABGy7hk5b_LXqDq5kidKWrwx9z7U0Esh6B+bJc61fMA7Mxpung@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:235 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [charleswjacksonjr32[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [daharatugabduljalil[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

--=20
IHR E-MAIL-KONTO WURDE F=C3=9CR EINE SPENDE IN H=C3=96HE VON 3.500.000,00 U=
SD
F=C3=9CR CHARITY AUSGEW=C3=84HLT. BITTE KONTAKTIEREN SIE UNS F=C3=9CR WEITE=
RE
INFORMATIONEN.
