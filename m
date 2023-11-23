Return-Path: <linux-x25+bounces-1-lists+linux-x25=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA937F5771
	for <lists+linux-x25@lfdr.de>; Thu, 23 Nov 2023 05:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A27961C20BFF
	for <lists+linux-x25@lfdr.de>; Thu, 23 Nov 2023 04:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09E01388
	for <lists+linux-x25@lfdr.de>; Thu, 23 Nov 2023 04:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pFj5yS58"
X-Original-To: linux-x25@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DAA17E2
	for <linux-x25@vger.kernel.org>; Thu, 23 Nov 2023 02:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AC7C433C7;
	Thu, 23 Nov 2023 02:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700707359;
	bh=rRbIXqjq8DKBA6vW+7glleky65j8TQodsqrm6IeWtY0=;
	h=Date:From:To:Subject:From;
	b=pFj5yS58sT011v/juRepKSguK9fd/BeOmGMtl1Jx7WfHNYpqUyNnj19/aLVbHBImx
	 JAnMDNZSuFJ7a7axhS3D1bGhQfEJkSPajmV0IkaAcHI1Ez00SHW6Gkm/ActWumP5Tr
	 7ZsFSDi+2X+LeYYzarNwL/MKnnZK7Hf6ScBgKuV4=
Date: Wed, 22 Nov 2023 21:42:38 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-x25@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231122-expert-sly-ermine-38f5ad@nitro>
Precedence: bulk
X-Mailing-List: linux-x25@vger.kernel.org
List-Id: <linux-x25.vger.kernel.org>
List-Subscribe: <mailto:linux-x25+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-x25+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to the new vger infrastructure. No action is
required on your part and there should be no change in how you interact with
this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K

