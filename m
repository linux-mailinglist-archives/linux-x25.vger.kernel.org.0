Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8423568F22
	for <lists+linux-x25@lfdr.de>; Wed,  6 Jul 2022 18:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232575AbiGFQ2k (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Wed, 6 Jul 2022 12:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233111AbiGFQ2j (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Wed, 6 Jul 2022 12:28:39 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59B017064
        for <linux-x25@vger.kernel.org>; Wed,  6 Jul 2022 09:28:37 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id n12-20020a9d64cc000000b00616ebd87fc4so12174334otl.7
        for <linux-x25@vger.kernel.org>; Wed, 06 Jul 2022 09:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=bbwPYyXk0YRlFhGQHejkUfXxW7dOJfpipmYal3hbQfe43UNtveHHMX1PEyMkCsnZp1
         7tfnwNyPODJE2HuHQ0TI+NCgMP6LfG+WiEECCiggOLad5TW8XOj5RS6VM5PZYRBnfX8S
         DckBW1LmCdNSMPjV7sWGEr8mGl+wo9NdQewgr8N0lCwOjxEv7zJEkAZlrbfzp235O8Z/
         KD/FoLwpIM1UHUC2WIR3h22Dv2L6Teejz9CJuV2bUvBm3EW8Msqe18UroIwvf1HJWaY+
         +TuNE9aP85fvbvPZDlCNKTIYJfhcJg+Gqd6FSbm6DFJXUXizSDd/Tf/Doc++EDyNOv+B
         ta1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=aJjUazdAQGx5fCBhkORaKwCg/niuNCRAyM+erx2rQiGXk3J9Xil47FJ6VRssnESR/O
         ceauX7X3MgLAeHaKQydxCO52xb8XUKg3RUNbGeyPr5ByjjdNZl995OxOk+NsIaD9rePA
         B5V83F9Sr9MwMqpqc2HbMeX2tnY8DOUno49N3Mdkfklr92iGF4xpi2PlybFZp7Tny9B2
         W5d+cUMWGjUL1NvFgEjEXdHaCViub6FJKOsnqW0unvQPAaSCMYD11z0+mDhfrGyh0Sef
         K4c6v9gTn6LEMQwjuUt9Yf3Y3qZZEGm+Xz++fpt0jSR1Bi7G8ogNZNgGe/ihTHT3bMNV
         ZTqw==
X-Gm-Message-State: AJIora9vbBA6aWTV3W91F3G286h+NLqQhrxojITmdj4iydVk7i3UT1fX
        2xC+RqlAkLGSHYenIfLbvhx1WDNrBZVV8qBDjmo=
X-Google-Smtp-Source: AGRyM1tyUDogRabsCOmUYPXchcumat+ZraUl6ktku3CN82x7ANmwj0kJGyDyNa+FHgNXsM5ErEyt5zJUSbtMJydnIYY=
X-Received: by 2002:a05:6830:1d5b:b0:616:de98:2556 with SMTP id
 p27-20020a0568301d5b00b00616de982556mr18852390oth.367.1657124917359; Wed, 06
 Jul 2022 09:28:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:4545:0:0:0:0:0 with HTTP; Wed, 6 Jul 2022 09:28:36 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   Kayla Manthey <avrielharry73@gmail.com>
Date:   Wed, 6 Jul 2022 16:28:36 +0000
Message-ID: <CAFSKFDaGjAhPbMcGZaUcK9GHJ9bAgAkU6eL7LsVuJxHeDV44fA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

LS0gDQrQl9C00YDQsNCy0L4g0LTRgNCw0LPQsA0K0JLQtSDQvNC+0LvQsNC8LCDQtNCw0LvQuCDR
mNCwINC00L7QsdC40LLRgtC1INC80L7RmNCw0YLQsCDQv9GA0LXRgtGF0L7QtNC90LAg0L/QvtGA
0LDQutCwLCDQstC4INCx0LvQsNCz0L7QtNCw0YDQsNC8Lg0K
