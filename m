Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 055835EB156
	for <lists+linux-x25@lfdr.de>; Mon, 26 Sep 2022 21:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbiIZTbE (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Mon, 26 Sep 2022 15:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiIZTbD (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Mon, 26 Sep 2022 15:31:03 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CD580531
        for <linux-x25@vger.kernel.org>; Mon, 26 Sep 2022 12:31:02 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id c17-20020a4aa4d1000000b0047653e7c5f3so1276721oom.1
        for <linux-x25@vger.kernel.org>; Mon, 26 Sep 2022 12:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=rA5xeXD0TyjUhjvsrx6ejmOzOVqFLC9Uf1Of+5mK/os=;
        b=q1Fcg2Hb4LvoKqu4pMmHkk9FWdIXq8k6TKvB/304rz7Ast8aN60MweBP0RiHUdXQdd
         MPPE/eq0Ge3Wz+hnqHTukuZe+2LoQSeyzzrldU//jGGOh2jgNHGfxBSbgBtb1Qy3D7XS
         5TR4RKdGDBkE92U7luJ8HQdfqbtCeeW7QKxr2sBWCmh3jsylmLwr8JGNZsY5C2TqVg69
         OL9n7ZXgamLenPN5uaTXbxBsxUJW+8VRLvWTYEcyW5FiU0cbOP/ZQWNIAwEk/y1aIDAp
         qsG6PZje1J8w4RA9DYhyfZbDyxhlsZsBpcmNnjzdHdGzX0YvbJNPNubcVsPWc672a/BI
         dE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rA5xeXD0TyjUhjvsrx6ejmOzOVqFLC9Uf1Of+5mK/os=;
        b=xN8lMjyfyr0NmzMmw1GUp55WnYlYdrSdcQD66kW0jY/Zdj5U/2y0ZGpBVgEEL1VPeQ
         KEVEqVAZfzXTpnkR4yYwOlEA1Js7MUcGBSF1et8OGhTS6oJLCAUJSFO8CZbE6RbBEAmE
         eyP6ZAizUT39DEl3lZmNJvEt+cjTfPFwjphAgvJ80psXU3VFyoQIEalGIDYk0A1Gmy4M
         CUh5aASf21jwF/U3LMjoxyjpSBzdp3Tvan8+d/bx5Ese2ktDu5zK4jkdm/e5omdgrPkg
         MiOXorgH4/a+brd0AfAqujkv4+7FCACi1C+DgDvMREixfi1F08IAyHcfiY2a9MkvJmF3
         UITw==
X-Gm-Message-State: ACrzQf2li0NEW77lluInDAHraQBHiSlOUtT8utcNX/xJq9Cf09aOSxH2
        cgTiIK747y/IFgyXBlfNLKpkkRUNtdaYrEtgBAM=
X-Google-Smtp-Source: AMsMyM7V+UDdY/RC9U7Piet4qS2mnncGXcp0X61yySD1/a3D9TQeYEex4zDo2CQ8xzCu5YwzlyFTH7NC4jdtk8jAkFo=
X-Received: by 2002:a4a:bc90:0:b0:475:67a4:2bb7 with SMTP id
 m16-20020a4abc90000000b0047567a42bb7mr9233819oop.20.1664220661924; Mon, 26
 Sep 2022 12:31:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:7253:b0:c7:f373:780 with HTTP; Mon, 26 Sep 2022
 12:31:01 -0700 (PDT)
Reply-To: pointerscott009@gmail.com
From:   Aminuind Aabawa <aminuindabawa00@gmail.com>
Date:   Mon, 26 Sep 2022 20:31:01 +0100
Message-ID: <CAP_Jfyq1Ni=v=Zz=8r_Eaf_PghYr3c8VO14TeZJp6_CPKOcr7A@mail.gmail.com>
Subject: =?UTF-8?Q?Bussines_offer_Gesch=C3=A4ftsangebot=2E?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:c43 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [pointerscott009[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [aminuindabawa00[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [aminuindabawa00[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

--=20
Hello, Do you have a projects that need urgent loan??
Granting out loans today in 10,000 / 500 Million to Interested
Investors, Companies & Private Individuals.
Revert back if you interested.


Hallo, haben Sie Projekte, die dringend einen Kredit ben=C3=B6tigen?
Vergeben Sie heute Kredite in H=C3=B6he von 10.000 / 500 Millionen an
interessierte Investoren, Unternehmen und Privatpersonen. Kommen Sie
zur=C3=BCck, wenn Sie interessiert sind.
