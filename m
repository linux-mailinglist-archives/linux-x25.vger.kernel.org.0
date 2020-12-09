Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 380D12D4003
	for <lists+linux-x25@lfdr.de>; Wed,  9 Dec 2020 11:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730100AbgLIKdz (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Wed, 9 Dec 2020 05:33:55 -0500
Received: from mxout70.expurgate.net ([194.37.255.70]:60475 "EHLO
        mxout70.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729808AbgLIKdy (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Wed, 9 Dec 2020 05:33:54 -0500
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.90)
        (envelope-from <ms@dev.tdt.de>)
        id 1kmwlI-00067x-O4; Wed, 09 Dec 2020 11:31:56 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90)
        (envelope-from <ms@dev.tdt.de>)
        id 1kmwlH-0003ys-NA; Wed, 09 Dec 2020 11:31:55 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id 57816240041;
        Wed,  9 Dec 2020 11:31:55 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id D2ACD240040;
        Wed,  9 Dec 2020 11:31:54 +0100 (CET)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
        by mail.dev.tdt.de (Postfix) with ESMTP id 681CF20B8F;
        Wed,  9 Dec 2020 11:31:54 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 09 Dec 2020 11:31:54 +0100
From:   Martin Schiller <ms@dev.tdt.de>
To:     Xie He <xie.he.0141@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, linux-x25@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: x25: Fix handling of Restart Request and
 Restart Confirmation
Organization: TDT AG
In-Reply-To: <7aed2f12bd42013e2d975280a3242136@dev.tdt.de>
References: <20201209081604.464084-1-xie.he.0141@gmail.com>
 <7aed2f12bd42013e2d975280a3242136@dev.tdt.de>
Message-ID: <dde53213f7e297690e054d01d815957f@dev.tdt.de>
X-Sender: ms@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.15
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
X-purgate-ID: 151534::1607509916-000037DC-45CBCAB8/0/0
X-purgate-type: clean
X-purgate: clean
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

On 2020-12-09 10:52, Martin Schiller wrote:
> On 2020-12-09 09:16, Xie He wrote:
>> 1. When the x25 module gets loaded, layer 2 may already be running and
>> connected. In this case, although we are in X25_LINK_STATE_0, we still
>> need to handle the Restart Request received, rather than ignore it.
> 
> Hmm... I've never loaded the X.25 module after the interface is UP, but
> in this case we really have to fix it.
> 

This seems to be a regression caused by moving the Layer2 link handling
into the lapb driver, which wasn't intended in my original patchset.

I also have another patch on my todo list which aims orphan packet
handling in the x25_receive_data() function. Maybe it is better to catch
the whole thing there.

>> 
>> 2. When we are in X25_LINK_STATE_2, we have already sent a Restart 
>> Request
>> and is waiting for the Restart Confirmation with t20timer. t20timer 
>> will
>> restart itself repeatedly forever so it will always be there, as long 
>> as we
>> are in State 2. So we don't need to check x25_t20timer_pending again.
> 
> Yeah, you're right, we can actually leave that out.
> 
> Acked-by: Martin Schiller <ms@dev.tdt.de>
