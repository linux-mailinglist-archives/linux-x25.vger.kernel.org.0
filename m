Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD19A5BB430
	for <lists+linux-x25@lfdr.de>; Fri, 16 Sep 2022 23:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbiIPV6y (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Fri, 16 Sep 2022 17:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbiIPV6x (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Fri, 16 Sep 2022 17:58:53 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24C3BB918
        for <linux-x25@vger.kernel.org>; Fri, 16 Sep 2022 14:58:51 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id d64-20020a17090a6f4600b00202ce056566so1005475pjk.4
        for <linux-x25@vger.kernel.org>; Fri, 16 Sep 2022 14:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=worldwidemarketdata.com; s=google;
        h=importance:thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:to:from
         :from:to:cc:subject:date;
        bh=DUuJ2mgsOAAJCWASlsTejJyFk9U3fgBCbX5rANAlE+c=;
        b=aRrW0G1HU4K2Fa1aMYxo4ELtCriE2z47Lvl+4rG0yOnPe7kNpYsC0sYnTZa82ZaBnW
         goaGH5+msnqenlEA1qrAVStPtHm+FhE9+ZMM8hgYsAhB8Qc44vCdF406eOxONSWI57Dn
         2XKHIJZXljXJrGrdbEGNgVH9B0kS0jOin0/R8VvkodcW0X5cFcTUA+aHRxfpCqFL1AbY
         wAHy0x8ul4qWMSzU1awRdpHjEMailQ5Sk1RyxZYAJ3462RktRMGJHlqcrAv91E0BbZn8
         xBsLW8O8WLELjF6UpAM+Kwa39+XH5vVS9wRdNLoMyOcKGsNEsN5wpv9N+7ENywwH+jxi
         2D0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=importance:thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=DUuJ2mgsOAAJCWASlsTejJyFk9U3fgBCbX5rANAlE+c=;
        b=gYksXYNt1jEgttUIK4wFh9agk0B9l98bHl2d1CX6uW+Cwijm5KK+e0PqjB1Jt8MJwr
         stX9rUlQR52HlunfZruxIhEIAWrZUUPClt0Gb7tl54PIuGNNuu8e/Z5E+2Zxg2tP8vqI
         4hyMpZncVBmlZFcMOMrBS6BqQEsFo3gEFrInsz+9/ZVLNp7ucP1fyEQ69LlFoYSeMt2D
         okBr/p5xjNB+zkzux292PNCRY+h2sLYCREauUMemCdWCBZpbCdMF91CEEmQVTwcK5JJ5
         JnkM41mHqHSyqbKNCZMGmv997nsFcBFYlnNP3J4NFkpkBdaY2Hsz8pIXe6pf4UIC88gf
         ccMg==
X-Gm-Message-State: ACrzQf2v30FW2WYVi2QON5080ckQMkRtYVjzihPwnNEz0mR8dDVUGlYf
        dd/bopaRm6wJ+iKdu2EU+wjUTg==
X-Google-Smtp-Source: AMsMyM7AmMLF+1VxEJ5YXKpWHIFW43eTF3cAw9YhsE6hFNmVESaHz9Enw4GFqeOaSA7e5ylIl68Bxw==
X-Received: by 2002:a17:902:7602:b0:172:a064:4a2f with SMTP id k2-20020a170902760200b00172a0644a2fmr1833956pll.56.1663365531358;
        Fri, 16 Sep 2022 14:58:51 -0700 (PDT)
Received: from DESKTOPR3SMN2M ([49.207.231.67])
        by smtp.gmail.com with ESMTPSA id p18-20020a170902e75200b0017849a2b56asm8967053plf.46.2022.09.16.14.58.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Sep 2022 14:58:50 -0700 (PDT)
From:   "Olivia Adam" <olivia@worldwidemarketdata.com>
To:     "'Olivia Adam'" <olivia@worldwidemarketdata.com>
References: 
In-Reply-To: 
Subject: RE: IBC Attendees Email List
Date:   Fri, 16 Sep 2022 16:53:24 -0500
Message-ID: <75c101d8ca17$80397f60$80ac7e20$@worldwidemarketdata.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook 14.0
Content-Language: en-us
Thread-Index: AdjKFbRgtn5b3SFKQ/2/HzocAapEcQAAMPMgAAAADxAAAAAKEAAAAAdwAAAACNAAAAAIoAAAAAhAAAAACNAAAAAIYAAAAAgAAAAACNAAAAAIYAAAAAgwAAAACPAAAAAJkAAAAAdgAAAADCAAAAALUAAAAAmwAAAACbAAAAAM4AAAAAmwAAAAC+AAAAAJcA==
Importance: High
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

Hi,

I hope you're doing great and staying healthy!

Would you be interested in acquiring IBC Attendees Data List 2022?

List contains: Company Name, Contact Name, First Name, Middle Name, Last
Name, Title, Address, Street, City, Zip code, State, Country, Telephone,
Email address and more,

No of Contacts:- 35,028
Cost: $ 1,881

Looking forward for your response,

Kind Regards,
Olivia Adam
Marketing Coordinator


