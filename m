Return-Path: <linux-x25-owner@vger.kernel.org>
X-Original-To: lists+linux-x25@lfdr.de
Delivered-To: lists+linux-x25@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47133000D7
	for <lists+linux-x25@lfdr.de>; Fri, 22 Jan 2021 11:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbhAVJ1n (ORCPT <rfc822;lists+linux-x25@lfdr.de>);
        Fri, 22 Jan 2021 04:27:43 -0500
Received: from mxout70.expurgate.net ([91.198.224.70]:47802 "EHLO
        mxout70.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727313AbhAVJKV (ORCPT
        <rfc822;linux-x25@vger.kernel.org>); Fri, 22 Jan 2021 04:10:21 -0500
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <ms@dev.tdt.de>)
        id 1l2sPM-00043n-EB; Fri, 22 Jan 2021 10:07:08 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ms@dev.tdt.de>)
        id 1l2sPL-0005xf-Ir; Fri, 22 Jan 2021 10:07:07 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id F300F240041;
        Fri, 22 Jan 2021 10:07:06 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id 7DE7E240040;
        Fri, 22 Jan 2021 10:07:06 +0100 (CET)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
        by mail.dev.tdt.de (Postfix) with ESMTP id D32EF2293D;
        Fri, 22 Jan 2021 10:07:05 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 22 Jan 2021 10:07:05 +0100
From:   Martin Schiller <ms@dev.tdt.de>
To:     Xie He <xie.he.0141@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, linux-x25@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5] net: lapb: Add locking to the lapb module
Organization: TDT AG
In-Reply-To: <20210121002129.93754-1-xie.he.0141@gmail.com>
References: <20210121002129.93754-1-xie.he.0141@gmail.com>
Message-ID: <b42575d44fb7f5c1253635a19c3e21e2@dev.tdt.de>
X-Sender: ms@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.16
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
X-purgate-ID: 151534::1611306428-000072E1-D532176F/0/0
X-purgate-type: clean
X-purgate: clean
Precedence: bulk
List-ID: <linux-x25.vger.kernel.org>
X-Mailing-List: linux-x25@vger.kernel.org

On 2021-01-21 01:21, Xie He wrote:
> In the lapb module, the timers may run concurrently with other code in
> this module, and there is currently no locking to prevent the code from
> racing on "struct lapb_cb". This patch adds locking to prevent racing.
> 
> 1. Add "spinlock_t lock" to "struct lapb_cb"; Add "spin_lock_bh" and
> "spin_unlock_bh" to APIs, timer functions and notifier functions.
> 
> 2. Add "bool t1timer_stop, t2timer_stop" to "struct lapb_cb" to make us
> able to ask running timers to abort; Modify "lapb_stop_t1timer" and
> "lapb_stop_t2timer" to make them able to abort running timers;
> Modify "lapb_t2timer_expiry" and "lapb_t1timer_expiry" to make them
> abort after they are stopped by "lapb_stop_t1timer", 
> "lapb_stop_t2timer",
> and "lapb_start_t1timer", "lapb_start_t2timer".
> 
> 3. Let lapb_unregister wait for other API functions and running timers
> to stop.
> 
> 4. The lapb_device_event function calls lapb_disconnect_request. In
> order to avoid trying to hold the lock twice, add a new function named
> "__lapb_disconnect_request" which assumes the lock is held, and make
> it called by lapb_disconnect_request and lapb_device_event.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: Martin Schiller <ms@dev.tdt.de>
> Signed-off-by: Xie He <xie.he.0141@gmail.com>


I don't have the opportunity to test this at the moment, but code looks
reasonable so far. Have you tested this at runtime?

> ---
> 
> Change from v4:
> Make lapb_unregister wait for other refs to "lapb" to drop, to ensure
> that other LAPB API calls have all finished.
> 
> Change from v3:
> In lapb_unregister make sure the self-restarting t1timer has really 
> been
> stopped.
> 
> Change from v2:
> Create a new __lapb_disconnect_request function to reduce redundant 
> code.
> 
> Change from v1:
> Broke long lines to keep the line lengths within 80 characters.
> 
> ---
>  include/net/lapb.h    |  2 ++
>  net/lapb/lapb_iface.c | 70 +++++++++++++++++++++++++++++++++----------
>  net/lapb/lapb_timer.c | 30 ++++++++++++++++---
>  3 files changed, 82 insertions(+), 20 deletions(-)
> 
> diff --git a/include/net/lapb.h b/include/net/lapb.h
> index ccc3d1f020b0..eee73442a1ba 100644
> --- a/include/net/lapb.h
> +++ b/include/net/lapb.h
> @@ -92,6 +92,7 @@ struct lapb_cb {
>  	unsigned short		n2, n2count;
>  	unsigned short		t1, t2;
>  	struct timer_list	t1timer, t2timer;
> +	bool			t1timer_stop, t2timer_stop;
> 
>  	/* Internal control information */
>  	struct sk_buff_head	write_queue;
> @@ -103,6 +104,7 @@ struct lapb_cb {
>  	struct lapb_frame	frmr_data;
>  	unsigned char		frmr_type;
> 
> +	spinlock_t		lock;
>  	refcount_t		refcnt;
>  };
> 
> diff --git a/net/lapb/lapb_iface.c b/net/lapb/lapb_iface.c
> index 40961889e9c0..b028dfc438ce 100644
> --- a/net/lapb/lapb_iface.c
> +++ b/net/lapb/lapb_iface.c
> @@ -122,6 +122,8 @@ static struct lapb_cb *lapb_create_cb(void)
> 
>  	timer_setup(&lapb->t1timer, NULL, 0);
>  	timer_setup(&lapb->t2timer, NULL, 0);
> +	lapb->t1timer_stop = true;
> +	lapb->t2timer_stop = true;
> 
>  	lapb->t1      = LAPB_DEFAULT_T1;
>  	lapb->t2      = LAPB_DEFAULT_T2;
> @@ -129,6 +131,8 @@ static struct lapb_cb *lapb_create_cb(void)
>  	lapb->mode    = LAPB_DEFAULT_MODE;
>  	lapb->window  = LAPB_DEFAULT_WINDOW;
>  	lapb->state   = LAPB_STATE_0;
> +
> +	spin_lock_init(&lapb->lock);
>  	refcount_set(&lapb->refcnt, 1);
>  out:
>  	return lapb;
> @@ -178,11 +182,23 @@ int lapb_unregister(struct net_device *dev)
>  		goto out;
>  	lapb_put(lapb);
> 
> +	/* Wait for other refs to "lapb" to drop */
> +	while (refcount_read(&lapb->refcnt) > 2)
> +		;
> +
> +	spin_lock_bh(&lapb->lock);
> +
>  	lapb_stop_t1timer(lapb);
>  	lapb_stop_t2timer(lapb);
> 
>  	lapb_clear_queues(lapb);
> 
> +	spin_unlock_bh(&lapb->lock);
> +
> +	/* Wait for running timers to stop */
> +	del_timer_sync(&lapb->t1timer);
> +	del_timer_sync(&lapb->t2timer);
> +
>  	__lapb_remove_cb(lapb);
> 
>  	lapb_put(lapb);
> @@ -201,6 +217,8 @@ int lapb_getparms(struct net_device *dev, struct
> lapb_parms_struct *parms)
>  	if (!lapb)
>  		goto out;
> 
> +	spin_lock_bh(&lapb->lock);
> +
>  	parms->t1      = lapb->t1 / HZ;
>  	parms->t2      = lapb->t2 / HZ;
>  	parms->n2      = lapb->n2;
> @@ -219,6 +237,7 @@ int lapb_getparms(struct net_device *dev, struct
> lapb_parms_struct *parms)
>  	else
>  		parms->t2timer = (lapb->t2timer.expires - jiffies) / HZ;
> 
> +	spin_unlock_bh(&lapb->lock);
>  	lapb_put(lapb);
>  	rc = LAPB_OK;
>  out:
> @@ -234,6 +253,8 @@ int lapb_setparms(struct net_device *dev, struct
> lapb_parms_struct *parms)
>  	if (!lapb)
>  		goto out;
> 
> +	spin_lock_bh(&lapb->lock);
> +
>  	rc = LAPB_INVALUE;
>  	if (parms->t1 < 1 || parms->t2 < 1 || parms->n2 < 1)
>  		goto out_put;
> @@ -256,6 +277,7 @@ int lapb_setparms(struct net_device *dev, struct
> lapb_parms_struct *parms)
> 
>  	rc = LAPB_OK;
>  out_put:
> +	spin_unlock_bh(&lapb->lock);
>  	lapb_put(lapb);
>  out:
>  	return rc;
> @@ -270,6 +292,8 @@ int lapb_connect_request(struct net_device *dev)
>  	if (!lapb)
>  		goto out;
> 
> +	spin_lock_bh(&lapb->lock);
> +
>  	rc = LAPB_OK;
>  	if (lapb->state == LAPB_STATE_1)
>  		goto out_put;
> @@ -285,24 +309,18 @@ int lapb_connect_request(struct net_device *dev)
> 
>  	rc = LAPB_OK;
>  out_put:
> +	spin_unlock_bh(&lapb->lock);
>  	lapb_put(lapb);
>  out:
>  	return rc;
>  }
>  EXPORT_SYMBOL(lapb_connect_request);
> 
> -int lapb_disconnect_request(struct net_device *dev)
> +static int __lapb_disconnect_request(struct lapb_cb *lapb)
>  {
> -	struct lapb_cb *lapb = lapb_devtostruct(dev);
> -	int rc = LAPB_BADTOKEN;
> -
> -	if (!lapb)
> -		goto out;
> -
>  	switch (lapb->state) {
>  	case LAPB_STATE_0:
> -		rc = LAPB_NOTCONNECTED;
> -		goto out_put;
> +		return LAPB_NOTCONNECTED;
> 
>  	case LAPB_STATE_1:
>  		lapb_dbg(1, "(%p) S1 TX DISC(1)\n", lapb->dev);
> @@ -310,12 +328,10 @@ int lapb_disconnect_request(struct net_device 
> *dev)
>  		lapb_send_control(lapb, LAPB_DISC, LAPB_POLLON, LAPB_COMMAND);
>  		lapb->state = LAPB_STATE_0;
>  		lapb_start_t1timer(lapb);
> -		rc = LAPB_NOTCONNECTED;
> -		goto out_put;
> +		return LAPB_NOTCONNECTED;
> 
>  	case LAPB_STATE_2:
> -		rc = LAPB_OK;
> -		goto out_put;
> +		return LAPB_OK;
>  	}
> 
>  	lapb_clear_queues(lapb);
> @@ -328,8 +344,22 @@ int lapb_disconnect_request(struct net_device 
> *dev)
>  	lapb_dbg(1, "(%p) S3 DISC(1)\n", lapb->dev);
>  	lapb_dbg(0, "(%p) S3 -> S2\n", lapb->dev);
> 
> -	rc = LAPB_OK;
> -out_put:
> +	return LAPB_OK;
> +}
> +
> +int lapb_disconnect_request(struct net_device *dev)
> +{
> +	struct lapb_cb *lapb = lapb_devtostruct(dev);
> +	int rc = LAPB_BADTOKEN;
> +
> +	if (!lapb)
> +		goto out;
> +
> +	spin_lock_bh(&lapb->lock);
> +
> +	rc = __lapb_disconnect_request(lapb);
> +
> +	spin_unlock_bh(&lapb->lock);
>  	lapb_put(lapb);
>  out:
>  	return rc;
> @@ -344,6 +374,8 @@ int lapb_data_request(struct net_device *dev,
> struct sk_buff *skb)
>  	if (!lapb)
>  		goto out;
> 
> +	spin_lock_bh(&lapb->lock);
> +
>  	rc = LAPB_NOTCONNECTED;
>  	if (lapb->state != LAPB_STATE_3 && lapb->state != LAPB_STATE_4)
>  		goto out_put;
> @@ -352,6 +384,7 @@ int lapb_data_request(struct net_device *dev,
> struct sk_buff *skb)
>  	lapb_kick(lapb);
>  	rc = LAPB_OK;
>  out_put:
> +	spin_unlock_bh(&lapb->lock);
>  	lapb_put(lapb);
>  out:
>  	return rc;
> @@ -364,7 +397,9 @@ int lapb_data_received(struct net_device *dev,
> struct sk_buff *skb)
>  	int rc = LAPB_BADTOKEN;
> 
>  	if (lapb) {
> +		spin_lock_bh(&lapb->lock);
>  		lapb_data_input(lapb, skb);
> +		spin_unlock_bh(&lapb->lock);
>  		lapb_put(lapb);
>  		rc = LAPB_OK;
>  	}
> @@ -435,6 +470,8 @@ static int lapb_device_event(struct notifier_block
> *this, unsigned long event,
>  	if (!lapb)
>  		return NOTIFY_DONE;
> 
> +	spin_lock_bh(&lapb->lock);
> +
>  	switch (event) {
>  	case NETDEV_UP:
>  		lapb_dbg(0, "(%p) Interface up: %s\n", dev, dev->name);
> @@ -454,7 +491,7 @@ static int lapb_device_event(struct notifier_block
> *this, unsigned long event,
>  		break;
>  	case NETDEV_GOING_DOWN:
>  		if (netif_carrier_ok(dev))
> -			lapb_disconnect_request(dev);
> +			__lapb_disconnect_request(lapb);
>  		break;
>  	case NETDEV_DOWN:
>  		lapb_dbg(0, "(%p) Interface down: %s\n", dev, dev->name);
> @@ -489,6 +526,7 @@ static int lapb_device_event(struct notifier_block
> *this, unsigned long event,
>  		break;
>  	}
> 
> +	spin_unlock_bh(&lapb->lock);
>  	lapb_put(lapb);
>  	return NOTIFY_DONE;
>  }
> diff --git a/net/lapb/lapb_timer.c b/net/lapb/lapb_timer.c
> index baa247fe4ed0..0230b272b7d1 100644
> --- a/net/lapb/lapb_timer.c
> +++ b/net/lapb/lapb_timer.c
> @@ -40,6 +40,7 @@ void lapb_start_t1timer(struct lapb_cb *lapb)
>  	lapb->t1timer.function = lapb_t1timer_expiry;
>  	lapb->t1timer.expires  = jiffies + lapb->t1;
> 
> +	lapb->t1timer_stop = false;
>  	add_timer(&lapb->t1timer);
>  }
> 
> @@ -50,16 +51,19 @@ void lapb_start_t2timer(struct lapb_cb *lapb)
>  	lapb->t2timer.function = lapb_t2timer_expiry;
>  	lapb->t2timer.expires  = jiffies + lapb->t2;
> 
> +	lapb->t2timer_stop = false;
>  	add_timer(&lapb->t2timer);
>  }
> 
>  void lapb_stop_t1timer(struct lapb_cb *lapb)
>  {
> +	lapb->t1timer_stop = true;
>  	del_timer(&lapb->t1timer);
>  }
> 
>  void lapb_stop_t2timer(struct lapb_cb *lapb)
>  {
> +	lapb->t2timer_stop = true;
>  	del_timer(&lapb->t2timer);
>  }
> 
> @@ -72,16 +76,31 @@ static void lapb_t2timer_expiry(struct timer_list 
> *t)
>  {
>  	struct lapb_cb *lapb = from_timer(lapb, t, t2timer);
> 
> +	spin_lock_bh(&lapb->lock);
> +	if (timer_pending(&lapb->t2timer)) /* A new timer has been set up */
> +		goto out;
> +	if (lapb->t2timer_stop) /* The timer has been stopped */
> +		goto out;
> +
>  	if (lapb->condition & LAPB_ACK_PENDING_CONDITION) {
>  		lapb->condition &= ~LAPB_ACK_PENDING_CONDITION;
>  		lapb_timeout_response(lapb);
>  	}
> +
> +out:
> +	spin_unlock_bh(&lapb->lock);
>  }
> 
>  static void lapb_t1timer_expiry(struct timer_list *t)
>  {
>  	struct lapb_cb *lapb = from_timer(lapb, t, t1timer);
> 
> +	spin_lock_bh(&lapb->lock);
> +	if (timer_pending(&lapb->t1timer)) /* A new timer has been set up */
> +		goto out;
> +	if (lapb->t1timer_stop) /* The timer has been stopped */
> +		goto out;
> +
>  	switch (lapb->state) {
> 
>  		/*
> @@ -108,7 +127,7 @@ static void lapb_t1timer_expiry(struct timer_list 
> *t)
>  				lapb->state = LAPB_STATE_0;
>  				lapb_disconnect_indication(lapb, LAPB_TIMEDOUT);
>  				lapb_dbg(0, "(%p) S1 -> S0\n", lapb->dev);
> -				return;
> +				goto out;
>  			} else {
>  				lapb->n2count++;
>  				if (lapb->mode & LAPB_EXTENDED) {
> @@ -132,7 +151,7 @@ static void lapb_t1timer_expiry(struct timer_list 
> *t)
>  				lapb->state = LAPB_STATE_0;
>  				lapb_disconnect_confirmation(lapb, LAPB_TIMEDOUT);
>  				lapb_dbg(0, "(%p) S2 -> S0\n", lapb->dev);
> -				return;
> +				goto out;
>  			} else {
>  				lapb->n2count++;
>  				lapb_dbg(1, "(%p) S2 TX DISC(1)\n", lapb->dev);
> @@ -150,7 +169,7 @@ static void lapb_t1timer_expiry(struct timer_list 
> *t)
>  				lapb_stop_t2timer(lapb);
>  				lapb_disconnect_indication(lapb, LAPB_TIMEDOUT);
>  				lapb_dbg(0, "(%p) S3 -> S0\n", lapb->dev);
> -				return;
> +				goto out;
>  			} else {
>  				lapb->n2count++;
>  				lapb_requeue_frames(lapb);
> @@ -167,7 +186,7 @@ static void lapb_t1timer_expiry(struct timer_list 
> *t)
>  				lapb->state = LAPB_STATE_0;
>  				lapb_disconnect_indication(lapb, LAPB_TIMEDOUT);
>  				lapb_dbg(0, "(%p) S4 -> S0\n", lapb->dev);
> -				return;
> +				goto out;
>  			} else {
>  				lapb->n2count++;
>  				lapb_transmit_frmr(lapb);
> @@ -176,4 +195,7 @@ static void lapb_t1timer_expiry(struct timer_list 
> *t)
>  	}
> 
>  	lapb_start_t1timer(lapb);
> +
> +out:
> +	spin_unlock_bh(&lapb->lock);
>  }
