Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07E546A4AF
	for <lists+linux-x25@lfdr.de>; Mon,  6 Dec 2021 19:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239363AbhLFSiQ (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Mon, 6 Dec 2021 13:38:16 -0500
Received: from mail-bn1nam07hn2221.outbound.protection.outlook.com ([52.100.160.221]:34878
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239007AbhLFSiP (ORCPT <rfc822;linux-x25@vger.kernel.org>);
        Mon, 6 Dec 2021 13:38:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZpDjgDDnNHonPfJ4DAXzVsHAYjgpR2RLVK+4IwDf2hKIG1uJsvo5+OpNEVhJc3AbosI+2R9HsQQXkXtRElR5qIK3wFPe97lxPBBbk1dkWbZE8L0SmP8rEpuKWP7KjNJFgisBgMCFfN/AJnoBgnqFIEzkdZr/sB3jYZ1NozLgsKRddhBBMRGd4JcKid8f02QYyHfVaGXoC7BLv8sRXd/x/DTEYLcoIpYXI9sjvEHDZsD8TO/qC6mjtvqxOxFhAR5jHmVZ1FIw5PTZjboXIPmAC7MAnvmp0bmWRySI6QtLbckI9SrObR3682AU+cPB5a5AsHICy7QRpo4T3QKJEA2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=MiXyvBRLklEqtANT6W6/zJvdQx8fDTbPCeuDVmrHAQ3zDNa30Wp3IbvkhC5bqVBF8/fSWtrmeY7q1yHS0aPxnzqkJ2kOsk9rDOu3G3fIilPRlD0HEqACAVodNETBBIcpTPVeCTkocVHUc4rAnBu4FbDH34kF2yz7qk0M2MnB2hDL6U9ZLD1z3GHaVNha0xibH1MzXWZbfT7JEMXy/CNOw4Kdf/yr1ogDZcXpBUhsesHGHNok0xA2MYY96UxYdBLjtDXyAsTFoO064UbOzLmki+Gp+kypauazX81hS4BpACcju1nC/ryxyyYgy1sOADPSgHQ1xNk589YTH0vm5c6HWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 146.201.107.145) smtp.rcpttodomain=rrcs-208-125-244-67.nys.biz.rr.com
 smtp.mailfrom=msn.com; dmarc=fail (p=none sp=quarantine pct=100) action=none
 header.from=msn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fsu.onmicrosoft.com;
 s=selector2-fsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=MMqo//24mO3/YcBvyqnpCnfQeOCYVGQzr6aBiyElIhvb4vje7v0DXzTc9smu/6cGhmwnFbasuPoaFHcuZZb91eGFekXoFgGIJh8ESa2InYxEXsyUD2ZpxdQvDsiamhnc66GS+5z2Gf0zHSDilnIvewVZZhr6NZGKTnRKb69ohY4=
Received: from MWHPR08CA0040.namprd08.prod.outlook.com (2603:10b6:300:c0::14)
 by DM8P220MB0672.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.14; Mon, 6 Dec 2021 18:34:35 +0000
Received: from MW2NAM04FT053.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:300:c0:cafe::cf) by MWHPR08CA0040.outlook.office365.com
 (2603:10b6:300:c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Mon, 6 Dec 2021 18:34:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 146.201.107.145) smtp.mailfrom=msn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=msn.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 msn.com discourages use of 146.201.107.145 as permitted sender)
Received: from mailrelay03.its.fsu.edu (146.201.107.145) by
 MW2NAM04FT053.mail.protection.outlook.com (10.13.31.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:34:34 +0000
Received: from [10.0.0.200] (ani.stat.fsu.edu [128.186.4.119])
        by mailrelay03.its.fsu.edu (Postfix) with ESMTP id F00749519A;
        Mon,  6 Dec 2021 13:33:57 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re: From Fred!
To:     Recipients <fred128@msn.com>
From:   "Fred Gamba." <fred128@msn.com>
Date:   Mon, 06 Dec 2021 19:33:14 +0100
Reply-To: fred_gamba@yahoo.co.jp
Message-ID: <a391b411-3523-4f41-ae87-297c33175a4c@MW2NAM04FT053.eop-NAM04.prod.protection.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51a54d65-46a5-4eef-f5d0-08d9b8e70d50
X-MS-TrafficTypeDiagnostic: DM8P220MB0672:EE_
X-Microsoft-Antispam-PRVS: <DM8P220MB067277C8401F99AEB8B5E54EEB6D9@DM8P220MB0672.NAMP220.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:146.201.107.145;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:mailrelay03.its.fsu.edu;PTR:mailrelay03.its.fsu.edu;CAT:OSPM;SFS:(4636009)(84050400002)(46966006)(40470700001)(26005)(82310400004)(5660300002)(2860700004)(31686004)(508600001)(8676002)(35950700001)(6666004)(83380400001)(7116003)(40460700001)(70586007)(956004)(7406005)(7366002)(786003)(86362001)(8936002)(31696002)(3480700007)(2906002)(6266002)(316002)(82202003)(47076005)(6200100001)(70206006)(6862004)(356005)(336012)(7416002)(7596003)(9686003)(480584002);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0o4cVhTR0p0c2YvZjVCc29hZW9xeDY0ZFJPNXB5U0c1bmwxWEx6bUZXNjlM?=
 =?utf-8?B?bWhhRnNvTTRxbWRhVlJpMGNBQUtZWmJzd0Z5K1dyZ0dDSkEraFUyQmZyeVU3?=
 =?utf-8?B?cWZnc09aQzVCQzQzUTV5d3lBSHdDZE1nR3NwYnlFMnd6b3ErSWJ0MlN4eFFn?=
 =?utf-8?B?ekFKYzArWjJZTXpKOWhYYUJoRWIyaE81djhrUVdYaFkrazUwTWtva2F1VHhP?=
 =?utf-8?B?alUxaGVLajFlRTRMRGtiVmtnbEQzWXJhSnd2T2NtQmRvMDJyby9yeW1UR2FD?=
 =?utf-8?B?bWNvejdoVmlBQVh2aXFpZDBLQWFlWHV1SDIvUWdRMXMxVVBqNlRHdXhiMUVO?=
 =?utf-8?B?TDVRcmpIS2dYL3kwbDV6TTFmYTJwSmJRUzJycHJxMkszOVpydWJGNG5iaTBm?=
 =?utf-8?B?YzdQSWQ4ZjFFNy9oS0JXRmZqbjQvajVrY3podTBNVGwyWVc3ZlFncnBFa3F0?=
 =?utf-8?B?MVpXZEU1YlV2enhtanJmdHZoRW9GaFZEMndtb2ZERFFRMm05eHB4ZUhpOGpX?=
 =?utf-8?B?VmdzY0UzNm9nMndlcUVLMzM4a0kvdnVlZXpvdytLUXdjS21QWitkVWM2VU9V?=
 =?utf-8?B?Q0lNSlAxck1QZmVudmluQmJHbTJVcUZKeGJkdXBwRzJFMFFLejJ5aXJUMG5E?=
 =?utf-8?B?Z1Z5MmtZTThIQmdybEY1NU5obVFFbGdieWJYdnZ6RXFUL29CUUJhR2FDdEln?=
 =?utf-8?B?VVEvU0ZSQkM0UmdFMStwU2paSDFnNXpFWFNpRTJaRDg5Y1NHaElUUWNGQUNi?=
 =?utf-8?B?WGVYZGk3SGI2eVA1RGFCUHZhZyt5ZFlQTW1PNXlKNXN1UUxxSlJBbXhrbmVC?=
 =?utf-8?B?aXVUMHYvc0loNXFGY09pelVKM0p5aUY0YkxyeW5JeUFYcG1nbHJpd1RPdllP?=
 =?utf-8?B?UUVhWHhPenRnYnZlNW5JaHEzUUVFWFo2YlkxYXEvRThEVVdoZFNTTHM3SzMy?=
 =?utf-8?B?QnJnWkRwMUxDalBvYjVOVWhaL1hYVnZpS3FSZFJMZm1qYkl3RlplM0VjV3Bs?=
 =?utf-8?B?Z1hnS3g5Uy9ZcWNTTlR5OEJmZDRjT3FGRGRGV0JVVHg4QWJmYUlGcXRmK2ZM?=
 =?utf-8?B?S2tQN0tmbURTNVY0NTJUT2tWczVIQm9SNURaRjlTSHBET2dJWmdsUUl5RUNH?=
 =?utf-8?B?QlFOdHhZaGkwcEJwUlZmVFlvVGZHOXRaWVZFOXJNQmlDcFcvdVM5NGZ1aWEx?=
 =?utf-8?B?TGlmenFvU1RqOTJuY29COXh2Y1dtaXVmYTBxV1J2bVFzSkxWZnlmMUgzMFY2?=
 =?utf-8?B?eEZiN2dESW84WGg0Y3Jib05Wb1NFYTRkOCtsVndrTzhJV3lQNG5yYWNmQzNi?=
 =?utf-8?B?WVpmU3hqamx3K0JKMlFXWFF3NEVUZ2k4UlZUNDU4YWdtVzY3VDNhdDgrb1Nj?=
 =?utf-8?B?bHRLd3FZdjFCdGxMTWNFQ2hnRHNmRWN0SE1aaVd6VHhSeThQRWovcG5McUk1?=
 =?utf-8?Q?G4JNrhol?=
X-OriginatorOrg: fsu.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:34:34.8085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a54d65-46a5-4eef-f5d0-08d9b8e70d50
X-MS-Exchange-CrossTenant-Id: a36450eb-db06-42a7-8d1b-026719f701e3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a36450eb-db06-42a7-8d1b-026719f701e3;Ip=[146.201.107.145];Helo=[mailrelay03.its.fsu.edu]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM04FT053.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8P220MB0672
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

Hello,

I decided to write you this proposal in good faith, believing that you will=
 not betray me. I have been in search of someone with the same last name of=
 our late customer and close friend of mine (Mr. Richard), heence I contact=
ed you Because both of you bear the same surname and coincidentally from th=
e same country, and I was pushed to contact you and see how best we can ass=
ist each other. Meanwhile I am Mr. Fred Gamba, a reputable banker here in A=
ccra Ghana.

On the 15 January 2009, the young millionaire (Mr. Richard) a citizen of yo=
ur country and Crude Oil dealer made a fixed deposit with my bank for 60 ca=
lendar months, valued at US $ 6,500,000.00 (Six Million, Five Hundred Thous=
and US Dollars) and The mature date for this deposit contract was on 15th o=
f January, 2015. But sadly he was among the death victims in the 03 March 2=
011, Earthquake disaster in Japan that killed over 20,000 people including =
him. Because he was in Japan on a business trip and that was how he met his=
 end.

My bank management is yet to know about his death, but I knew about it beca=
use he was my friend and I am his Account Relationship Officer, and he did =
not mention any Next of Kin / Heir when the account was opened, because he =
was not married and no children. Last week my Bank Management reminded me a=
gain requested that Mr. Richard should give instructions on what to do abou=
t his funds, if to renew the contract or not.

I know this will happen and that is why I have been looking for a means to =
handle the situation, because if my Bank Directors happens to know that he =
is dead and do not have any Heir, they will take the funds for their person=
al use, That is why I am seeking your co-operation to present you as the Ne=
xt of Kin / Heir to the account, since you bear same last name with the dec=
eased customer.

There is no risk involved; the transaction will be executed under a legitim=
ate arrangement that will protect you from any breach of law okay. So It's =
better that we claim the money, than allowing the Bank Directors to take it=
, they are rich already. I am not a greedy person, so I am suggesting we sh=
are the funds in this ratio, 50% 50, ie equal.

Let me know your mind on this and please do treat this information highly c=
onfidential.

I will review further information to you as soon as I receive your
positive response.

Have a nice day and I anticipating your communication.

With Regards,
Fred Gamba.
