Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD4C784E9B
	for <lists+linux-x25@lfdr.de>; Wed, 23 Aug 2023 04:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbjHWCRc (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Tue, 22 Aug 2023 22:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbjHWCRb (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Tue, 22 Aug 2023 22:17:31 -0400
X-Greylist: delayed 906 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 19:17:29 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B44E185
        for <linux-x25@vger.kernel.org>; Tue, 22 Aug 2023 19:17:28 -0700 (PDT)
X-AuditID: cb7c291e-06dff70000002aeb-55-64e553c5e730
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id A4.42.10987.6C355E46; Wed, 23 Aug 2023 05:33:10 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=lqsUitSeT1wdwRiRe7DYSaONGBwELjeiwVRlptpTHls6FM5gj5aNfpaaWMY+iesfg
          Vs9fI2tF0eAl3wzYcDXD65zKGoB8GBRVgLCfGdTRVfIDz40wlAisgsV+kHhFDt9jj
          pG74b7SSBytNiwFbmEEjuLH9dkgKiTP34kwg6c0so=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=WHtDYGOcyLtIYOG/18Vza2QfiLJKVNn0mmQ41cTI2W03OxEDpmwNM4v+GMrh4cvB+
          Ubly2KCSZVZaYD++EJ2gnSNqA0HzYtrBlGb5o8M1iwvlpQWRe+GImgqErDoWr+Oqa
          nPK2mJR26xHua3MJVdgFkwyAxH5YISiNdaF/cXNAs=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:09 +0500
Message-ID: <A4.42.10987.6C355E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-x25@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:23 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsVyyUKGW/dY8NMUg5al/BYH9s5ndGD0+LxJ
        LoAxissmJTUnsyy1SN8ugStjyboLLAW7mSva+hexNDA+Zupi5OSQEDCR+NTdx9zFyMUhJLCH
        SeLF7KcsIA6LwGpmidfd81ghnIfMEnMuvmQDaRESaGaUOH/UDMTmFbCW2DT/ESuIzSygJ3Fj
        6hQ2iLigxMmZT1gg4toSyxa+BlrBAWSrSXztKgEJCwuISXyatowdxBYRkJWY1rwRzGYT0JdY
        8bWZEcRmEVCVeHxwNwvEWimJjVfWs01g5J+FZNssJNtmIdk2C2HbAkaWVYwSxZW5icBQSzbR
        S87PLU4sKdbLSy3RK8jexAgMw9M1mnI7GJdeSjzEKMDBqMTD+3PdkxQh1sQyoK5DjBIczEoi
        vNLfH6YI8aYkVlalFuXHF5XmpBYfYpTmYFES57UVepYsJJCeWJKanZpakFoEk2Xi4JRqYNxn
        fUj+pPvCS8ExzKvz/W4En8hlO1Opt2lv4UQlgwJLkUCvJBXZNR+XPqmXMHlc/iimK+9B+PJv
        Z9Ut5ucF/7mhcWi308OLUy6prJSoiShn/3zKLc17c4xvTf/BCa3mKklfN2kd2b3p7qTu+r+q
        V0SOb3iyr69ob//7afrHfx6TEiyIXNvLulGJpTgj0VCLuag4EQByoMHJPwIAAA==
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

