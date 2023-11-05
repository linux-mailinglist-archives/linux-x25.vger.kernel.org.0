Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6F927E1728
	for <lists+linux-x25@lfdr.de>; Sun,  5 Nov 2023 23:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjKEWAU (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Sun, 5 Nov 2023 17:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjKEWAT (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Sun, 5 Nov 2023 17:00:19 -0500
X-Greylist: delayed 5190 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Nov 2023 14:00:17 PST
Received: from SMTP-HCRC-200.brggroup.vn (unknown [42.112.212.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376F4DD
        for <linux-x25@vger.kernel.org>; Sun,  5 Nov 2023 14:00:17 -0800 (PST)
Received: from SMTP-HCRC-200.brggroup.vn (localhost [127.0.0.1])
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTP id 90467195CB;
        Mon,  6 Nov 2023 01:58:07 +0700 (+07)
Received: from zimbra.hcrc.vn (unknown [192.168.200.66])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTPS id 88931195C6;
        Mon,  6 Nov 2023 01:58:07 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 262541B8250B;
        Mon,  6 Nov 2023 01:58:09 +0700 (+07)
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id lPV-wmqG8iYK; Mon,  6 Nov 2023 01:58:09 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id E1AC61B8223A;
        Mon,  6 Nov 2023 01:58:08 +0700 (+07)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.hcrc.vn E1AC61B8223A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hcrc.vn;
        s=64D43D38-C7D6-11ED-8EFE-0027945F1BFA; t=1699210688;
        bh=WOZURJ77pkiMUL2pPLC14ifVPRvyTQIBEQmxuN1ezAA=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=rbyTQn1fmMFbIYzQyHVYlmnUJ0fR66kpwNzrjxPROCd65VjIYGhkP8dC7mLYXv7wQ
         D7lk5bRcUjzq3GMNjyl0nCsoHIXvfgb/TopQf9WunenjOzxjEeKeDILa5i5or+9vY0
         mLZhtXg+EBN6Xjj3YogYq70SwXDt5EyNP4Jvs1EvGUx21uPOoHa+7Deq5+iF9M8VmG
         aeEYcw7hQKhO3QpPHNC8ZyWgPcQk09tn5BQQePsZaXgfsBcbBuu8dzIMlexNbg5c27
         oyEQtAzu/sPMTIXO1iniv04D1X2SQ7p3y4hN3YN/4KL4dZoBL9dqyJvKVsFmftepw7
         73ZN7ICLVcXgw==
X-Virus-Scanned: amavisd-new at hcrc.vn
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id l_r58WNqAWZ8; Mon,  6 Nov 2023 01:58:08 +0700 (+07)
Received: from [192.168.1.152] (unknown [51.179.100.52])
        by zimbra.hcrc.vn (Postfix) with ESMTPSA id 700BF1B8253C;
        Mon,  6 Nov 2023 01:58:02 +0700 (+07)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?b?4oKsIDEwMC4wMDAuMDAwPw==?=
To:     Recipients <ch.31hamnghi@hcrc.vn>
From:   ch.31hamnghi@hcrc.vn
Date:   Sun, 05 Nov 2023 19:57:49 +0100
Reply-To: joliushk@gmail.com
Message-Id: <20231105185802.700BF1B8253C@zimbra.hcrc.vn>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

Goededag,
Ik ben mevrouw Joanna Liu en een medewerker van Citi Bank Hong Kong.
Kan ik =E2=82=AC 100.000.000 aan u overmaken? Kan ik je vertrouwen


Ik wacht op jullie reacties
Met vriendelijke groeten
mevrouw Joanna Liu

