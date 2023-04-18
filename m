Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6FC06E58E7
	for <lists+linux-x25@lfdr.de>; Tue, 18 Apr 2023 07:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjDRF7i (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Tue, 18 Apr 2023 01:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjDRF7c (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Tue, 18 Apr 2023 01:59:32 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 307AC2125
        for <linux-x25@vger.kernel.org>; Mon, 17 Apr 2023 22:59:31 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id bz21so5099244ljb.11
        for <linux-x25@vger.kernel.org>; Mon, 17 Apr 2023 22:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681797569; x=1684389569;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQlu0Oc2Q0nPMBCNq5iTPUZpwrRZlsMdPt2zjra8+VI=;
        b=h93ZV8iCnACjT9Rji+sssoi6qBTNUtQ2UX4Z6JhphjwlO0mP6IvefLUdC9/HHPEdzc
         MK5k3eArSOeFghXkzo2gSg9AoDbFuAZK+msa231LeywpuY4PrQKG5tEmDv84Uq/0L62F
         9moX8TsQWHcxVWMubQsJavssOjpaWROCZHeVo6SQmnd1gjtX9kxW/y2+8ZZ5BlddX+sa
         qfTGVBuRTU5F9lqeBp7iUoCnzXRuFhbqlG8s1wLX1jCTc9f7SzpJFgzPfn6ezn/L4fc4
         zSBpG/DWehvbOkgIrsEF5uyEFo1iRxghu86NrvhenIlTajuBQ61kQEyGX8hc9WUZCdwh
         ol6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681797569; x=1684389569;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQlu0Oc2Q0nPMBCNq5iTPUZpwrRZlsMdPt2zjra8+VI=;
        b=TFinP1f22I1O6GoMMumOuoSPVejmg+LFj4/mNzVOc+qyXoaS/9G2subx8hng89DhhJ
         ZlH8aYaLEfDPODjQSK31GWNTGRl7ebMouWVwuRGgKoi8QBJu1wUK8UgANcWb+wmkdlr/
         4T1T+9UPUKKDzMSZ2rGnQkqu98E/V/0T297NGI6lEC3cGH1JtDw/jDoq5wzTE0Yg8hos
         fkY8AM6sV/TopJNg2Z2e+YsgyRsBtAsJyVlCGH94eKZq54+9Z1TiA+K2iQtRO4H5xTwa
         XKOmTp8gIFEKYJfl7ophe7LHhQCZOnUo7mJjet34Wf3sEK2V5/IaRV1wyYtkg9NYdRQw
         3igQ==
X-Gm-Message-State: AAQBX9eZa+kQRfbaD/XGYm6CKslf9c4vdE3iZflFsXF1NSr4r4ikEmWD
        ESFwy95s7i27ImbbSB4vmFtWeFl3WVa8mM0g2Nk4UXt7nmi3cw==
X-Google-Smtp-Source: AKy350bnV2AANFzQljOKJaGQFVn/8imkXjDUIcslYQf4S5+RAKT61mjLdEI4wBIlnDu6vs7eANQIsl8DJ7DmLEQ/06E=
X-Received: by 2002:a2e:8547:0:b0:2a7:6e5a:42c5 with SMTP id
 u7-20020a2e8547000000b002a76e5a42c5mr462145ljj.0.1681797568709; Mon, 17 Apr
 2023 22:59:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab2:2681:0:b0:1b6:840f:9075 with HTTP; Mon, 17 Apr 2023
 22:59:28 -0700 (PDT)
Reply-To: mariamkouame.info@myself.com
From:   Mariam Kouame <mariamkouame1992@gmail.com>
Date:   Mon, 17 Apr 2023 22:59:28 -0700
Message-ID: <CADUz=ah5x0s=mUmSzhKu-bRCGOp_37Fiynd3GkEZuBBaAeAtqQ@mail.gmail.com>
Subject: from mariam kouame
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you. I am looking forward to hearing from you at your earliest
convenience.

Mrs. Mariam Kouame
