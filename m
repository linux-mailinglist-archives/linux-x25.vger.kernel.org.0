Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF49496F60
	for <lists+linux-x25@lfdr.de>; Sun, 23 Jan 2022 02:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235177AbiAWBRJ (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Sat, 22 Jan 2022 20:17:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235171AbiAWBRH (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Sat, 22 Jan 2022 20:17:07 -0500
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3535C06173B
        for <linux-x25@vger.kernel.org>; Sat, 22 Jan 2022 17:17:06 -0800 (PST)
Received: by mail-yb1-xb42.google.com with SMTP id c10so39527666ybb.2
        for <linux-x25@vger.kernel.org>; Sat, 22 Jan 2022 17:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=JBo39Y+I2aAWyqSG6abXc/K7m8aUzAhFEBypnl/Snzg=;
        b=EfR3s4pvzarQwgnnq6/1cMMYmco6BVDGE42Rj7WVU206GrOqwKj/Wgb8rrYNv/Ii1Q
         X/oPCzYgGlO5o3sgkYngwmBpDhnR2YE/IZPUiUA69U5jfMH5+kB55Z7eNIPsUuBuiyFD
         kkvtV+zBJQGPc6RatYwlPTHbMBdXm/uKwQgHwdtUoYO0THMA42fLLIpm3+hk6b205MmW
         FK/d1cZv1oSmayvrMZ+pTXJEJbVzm4yea1ejiTrrNrUomLPSx5vhR3W5NJLtaaRDZMIa
         vs+QEnaU9dCnenMlTnByO7AqW7O5R1YsjzrKmZRmh0vBO+TS8h4Cd05o7EVBg62LMV+f
         kAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=JBo39Y+I2aAWyqSG6abXc/K7m8aUzAhFEBypnl/Snzg=;
        b=u1AIlLTwUV4ftM2CJiIgBH+DwwsVrMDRsYq/98MOPq72sEX2PlPX5jgTMCd9EV0jVK
         ustIcyT4GU6jOdt3OZda4VkV6F1bbwXRVxj016WVKBdPM5M0u6rUyBuucGgghsQ6Fncx
         ExwFWNpypgrpDYvh05ejCNTgMoLN5vupJ9RL/d6UDmHmoGtuQ5gokVxqR3l80NNwJ5tT
         fG60vmhpz1Bs5ApNe1eALb9af3TVI07Lz+PdGShVP7OQCBkKOo8DxRp0/5IlZ0Igb13m
         MWuJYfUyVOj0yYXVTWg44UbPHOLf6Yd4F9hXJxsl07gViztk+b35D5x9uw7hhmy/eaJj
         VNeA==
X-Gm-Message-State: AOAM531x5pR423EH89Prc70QmzVFOODtQkVlGLRtg6uKRr57xFQ1IWqm
        4pFpB3rAzoZMsnbxJxAehkpLE4eBj1CVLZ6lJz0=
X-Google-Smtp-Source: ABdhPJxDw3nQ9LwfF+7EKCsYMLsjVM4WCFCVowzpcIz/VnA0GcRZi9m35FYB6bcqjJv8/IzewAsBgWsnBk5NhKEYFDA=
X-Received: by 2002:a05:6902:1508:: with SMTP id q8mr12411298ybu.117.1642900625955;
 Sat, 22 Jan 2022 17:17:05 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6918:1258:b0:91:3309:cfcb with HTTP; Sat, 22 Jan 2022
 17:17:05 -0800 (PST)
Reply-To: huiman43@hotmail.com
From:   Yi Hiuman <dc547886@gmail.com>
Date:   Sat, 22 Jan 2022 17:17:05 -0800
Message-ID: <CAOa+6iAiaymMx8qq1bZcRTEUqi+vd-x-SyBbhid_HVEYUxdn8g@mail.gmail.com>
Subject: =?UTF-8?Q?Ich_habe_einen_Gesch=C3=A4ftsvorschlag_f=C3=BCr_Sie_=2F_I_have?=
        =?UTF-8?Q?_a_business_proposal_for_you?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

Hallo,

Ich bin Herr Yi Huiman, ehemaliger Vorsitzender der Industrial and
Commercial Bank of China (ICBC) und derzeitige China Securities
Regulatory Commission (CSRC). Ich habe einen Gesch=C3=A4ftsvorschlag, von
dem wir beide profitieren werden. Ich suche einen seri=C3=B6sen Partner, um
eine Transaktion im Wert von 45.275.000,00 USD anzuvertrauen. Kann ich
mich auf dich verlassen? Bitte kontaktieren Sie mich f=C3=BCr weitere
Informationen =C3=BCber meine pers=C3=B6nliche E-Mail-Adresse:
huiman43@hotmail.com

Yi Hiuman



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


Hello,

I'm Mr. Yi Huiman, former chairman of the Industrial and Commercial
Bank of China (ICBC) and current China Securities Regulatory
Commission (CSRC).. I have a business proposal that will benefit both
of us. I am looking for a serious partner to entrust a transaction
worth $45,275,000.00 USD. Can i rely on you? Please contact me for
more information via my personal email address: huiman43@hotmail.com

Yi Hiuman
