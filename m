Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34D965B06A7
	for <lists+linux-x25@lfdr.de>; Wed,  7 Sep 2022 16:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbiIGObw (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Wed, 7 Sep 2022 10:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbiIGOba (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Wed, 7 Sep 2022 10:31:30 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632EC895C0
        for <linux-x25@vger.kernel.org>; Wed,  7 Sep 2022 07:31:16 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id r17so3416387ejy.9
        for <linux-x25@vger.kernel.org>; Wed, 07 Sep 2022 07:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=UTPjlhWN0j/3cl0uibj9IdU3K9tIHCNTd74bAPWV+BQ=;
        b=boA3graP4wtJe8cwRxkMJy5rso3t9xyj4fxUFsG0Fez1aWDY0C6gZpYPvm/Hxa5tX5
         Zk+XDE4h4sSr3Kc7gAmKt5OJ7AP3AEEipJ5m7D7tQ5BTHkXWMmIdiC/g3MqGg04yG8Wz
         mFTYUlKwIYoLI0bvi9Q3MSV1athb174l2Ms/7z+L0TzD2CQLBWt0bOa5Jg9CBAeygplA
         zqROn488xUY/B608ffA8/XOsolF390gA0UeCbMrgWX87LxLuf34XOCHn+1VgcYnMY7Sr
         klavsMj/u/K0iLTegE+9syCXTdcAl7jimLLfNxQJoiGWtjh15Idxzz9bfpV/1Jhy4Wly
         oLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=UTPjlhWN0j/3cl0uibj9IdU3K9tIHCNTd74bAPWV+BQ=;
        b=fwOGdPTaK6I689we2mnjL5hl9gKAxG9yd6wRgPc5bv4jknex3dDCvrzdaLAfSdwaY+
         PFKmYQ+ZkErt6cRkDJDHXmqYYUMd7vajR+l3Lpr1DC4cjgyRbRzCQMue3TrhTPlsR3g9
         uCWFlmnyDP6+HmhjCewPUOgyG5kR77xkR07HgdOtEHLERqQ4N14zQHqVZ0g5Wm5lU207
         l5xIC7TrPQW7U1X5GqEuRQ5BkbD0+3Wm3R9nO6SuHk/vhTfVdLvU4p4ryl5aQ2b7d9lz
         Dlbi2IORMn3BnCzBo99T1fTlNoaR+Q05kL9GSVbj0cUtjpYi6fA0wj9+85I++b6IQg43
         2V3w==
X-Gm-Message-State: ACgBeo2BbkcB0CZa6l901UbosJZgN8gh8LhoVJOLwptqISPAFRY7kI4+
        n98ts7KX61xpZRr3ziFO4NiczxS25KZODtFcses=
X-Google-Smtp-Source: AA6agR7OKiKkSx+MbdKnn4tKaQhdmVzFj2krU0Vhk4MjDetoGwDDBbw+8TT3Fj+g2bgbPAiBcK/73KQpnrd5Cpv4s3c=
X-Received: by 2002:a17:907:75ec:b0:741:484b:3ca4 with SMTP id
 jz12-20020a17090775ec00b00741484b3ca4mr2508106ejc.316.1662561074796; Wed, 07
 Sep 2022 07:31:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:3fc4:0:0:0:0:0 with HTTP; Wed, 7 Sep 2022 07:31:14 -0700 (PDT)
Reply-To: lumar.casey@outlook.com
From:   LUMAR CASEY <miriankushrat@gmail.com>
Date:   Wed, 7 Sep 2022 16:31:14 +0200
Message-ID: <CAO4StN0fh9iLpvL71MAvphxmFm4ur7+Op=qm5oJuhdRZZPJ3cA@mail.gmail.com>
Subject: ATTENTION/PROPOSAL
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=ADVANCE_FEE_4_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY,UPPERCASE_75_100 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:642 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5049]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [miriankushrat[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 UPPERCASE_75_100 message body is 75-100% uppercase
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 ADVANCE_FEE_4_NEW_MONEY Advance Fee fraud and lots of money
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

ATTENTION

BUSINESS PARTNER,

I AM LUMAR CASEY WORKING WITH AN INSURANCE FINANCIAL INSTITUTE, WITH
MY POSITION AND PRIVILEGES I WAS ABLE TO SOURCE OUT AN OVER DUE
PAYMENT OF 12.8 MILLION POUNDS THAT IS NOW SECURED WITH A SHIPPING
DIPLOMATIC OUTLET.

I AM SEEKING YOUR PARTNERSHIP TO RECEIVE THIS CONSIGNMENT AS AS MY
PARTNER TO INVEST THIS FUND INTO A PROSPEROUS INVESTMENT VENTURE IN
YOUR COUNTRY.

I AWAIT YOUR REPLY TO ENABLE US PROCEED WITH THIS BUSINESS PARTNERSHIP TOGETHER.

REGARDS,

LUMAR CASEY
