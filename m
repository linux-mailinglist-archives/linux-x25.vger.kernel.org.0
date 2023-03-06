Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6DAE6ABC11
	for <lists+linux-x25@lfdr.de>; Mon,  6 Mar 2023 11:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbjCFKZO (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Mon, 6 Mar 2023 05:25:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbjCFKZM (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Mon, 6 Mar 2023 05:25:12 -0500
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807E421A2D
        for <linux-x25@vger.kernel.org>; Mon,  6 Mar 2023 02:25:09 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id x1so6049056uav.9
        for <linux-x25@vger.kernel.org>; Mon, 06 Mar 2023 02:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678098308;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vh7FN/ulAdnmY8O0LKz7bqpIFk4oOSQ9iCZ8VQ/AkNo=;
        b=XLGWJIk9ngr+DzzO288LuvJaM4tXJNvPNwQ2aS9Ags44qiVmrxsinzlSTI373SWvQL
         +6SgUcT0EwDOIVN2f57batbL6WGkZ2VjHiZD2U0ZfoB3ufKNwLox0AmmmOFBlt9HJ6RH
         OS5dvcaELSOGwrw7xfZFJ2NbgVH7MQKiyCspd7sI5fG3WOcHvbeWf9pH0zYeQabOYzn3
         yw9gnSfWn+YHaL2P9olrtireCVfXlHXeG4tpX1ltR43P7LxaSqE8ArqnuABg3RgkQyVT
         NPOLZ1x9kR7oCsOGhR6lezPY8aiclxT9jA/o8x8OVtbG9/bfL0WUzRZuLJI8IqemKCfK
         Id5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098308;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vh7FN/ulAdnmY8O0LKz7bqpIFk4oOSQ9iCZ8VQ/AkNo=;
        b=XyOcaOdXRTHUXJ3rJtZsL7/u4NHxj9J7GKdVHLG1rE6Dkmx9pmCzH+K0ESYucXTJOj
         9Pv4VZP5PONucPIK3XuCQcM4FtfBmQt1C0zveA4kWdsfcKO877FYsPMQlOQe9f71IEax
         GnMB5Y4A4o+7XHGLYYWRhVTTHNjDs08QG8EDeg66G/caUBcgQ10DZAQxX0CVlutkRTzF
         DO9sucSZw7rX0It/k+e+5nHX1qonkaWcZqSfjtTIIHvBAfXm3U87cgK8ZJ9hUxKmDqls
         vdRwsB5Y9cJH3+B2srFmZUsL2hTmWauL61k8CccvaD/R4SzrltdEH3aHIYtYzq2uOIKJ
         Nptw==
X-Gm-Message-State: AO0yUKWsca7wlePCZftHM/HM4Zg7C00s6j7dVGxslaE27K0bN2Zs6/0j
        mNiEnD0k8BAGXjfmsJMzfXufi42hgR/4+tsBe1I=
X-Google-Smtp-Source: AK7set+HbxOG8fRWYdSd2Spe8YgeAHrZJbrwpyn/MCNLktCdTFpedrqR91TU0+OXtW6ZaqP/6B7py4FyO7omWVyWxwo=
X-Received: by 2002:a1f:1752:0:b0:401:f65:99c2 with SMTP id
 79-20020a1f1752000000b004010f6599c2mr6566336vkx.3.1678098308425; Mon, 06 Mar
 2023 02:25:08 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:ce6f:0:b0:3ae:930b:3e70 with HTTP; Mon, 6 Mar 2023
 02:25:08 -0800 (PST)
Reply-To: madis.scarl@terlera.it
From:   "Ms Eve from U.N" <denisagotou@gmail.com>
Date:   Mon, 6 Mar 2023 11:25:08 +0100
Message-ID: <CAD6bNBj=acZn6jpkuAhuMAxbq=prud3DvWJUd6YsqM0swBt35Q@mail.gmail.com>
Subject: Re: Claim of Fund:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_SCAM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:930 listed in]
        [list.dnswl.org]
        *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8772]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [denisagotou[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.0 HK_SCAM No description available.
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

Hello Good Morning,
This is to bring to your notice that all our efforts to contact you
through this your email ID failed Please Kindly contact Barrister.
Steven Mike { mbarrsteven@gmail.com } on his private email for the
claim of your compensation entitlement

Note: You have to pay for the delivery fee.
Yours Sincerely
Mrs EVE LEWIS
