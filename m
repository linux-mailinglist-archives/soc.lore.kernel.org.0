Return-Path: <devicetree+bounces-7826-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B237C5B09
	for <lists+devicetree@lfdr.de>; Wed, 11 Oct 2023 20:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E40A71C20A15
	for <lists+devicetree@lfdr.de>; Wed, 11 Oct 2023 18:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B7122313;
	Wed, 11 Oct 2023 18:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z60BKamM"
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A1322306
	for <devicetree@vger.kernel.org>; Wed, 11 Oct 2023 18:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82C0C433C8;
	Wed, 11 Oct 2023 18:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697048175;
	bh=DnAp5V1swnooCM8fN/UxKJkQmJdF3KHzqQ7hRw12014=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=z60BKamMve/xI7hwntsoMbzdcl9t+euPahaSLfNwoA3BW651Zag3pk64AEMpXwjqY
	 Dy6JI2/zXqB/f77+pZjXfKgcVjAgSi+9MOiMn3wR3k8x3Dg6lbRprvjMHe7zzUe4z0
	 jlg6v20PxNQXrV8k7/edFLJzYPjDoblG8zBLNQwg=
Date: Wed, 11 Oct 2023 20:16:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
	tomasz.figa@gmail.com, s.nawrocki@samsung.com,
	linus.walleij@linaro.org, wim@linux-watchdog.org,
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	semen.protsenko@linaro.org, saravanak@google.com,
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 16/20] tty: serial: samsung: Add gs101 compatible and
 SoC data
Message-ID: <2023101116-browbeat-barcode-6d61@gregkh>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-17-peter.griffin@linaro.org>
 <2023101109-crispy-escapable-0801@gregkh>
 <CADrjBPouDPfcj9eCN0BN0Lfd1sOb=Q3jmkeD1aO2on5VHmROJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPouDPfcj9eCN0BN0Lfd1sOb=Q3jmkeD1aO2on5VHmROJg@mail.gmail.com>

On Wed, Oct 11, 2023 at 07:03:44PM +0100, Peter Griffin wrote:
> Hi Greg,
> 
> Thanks for the review.
> 
> On Wed, 11 Oct 2023 at 08:47, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Oct 10, 2023 at 11:49:24PM +0100, Peter Griffin wrote:
> > > Add serial driver data for Google Tensor gs101 SoC.
> > >
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > >  drivers/tty/serial/samsung_tty.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> > > index 07fb8a9dac63..79a1a184d5c1 100644
> > > --- a/drivers/tty/serial/samsung_tty.c
> > > +++ b/drivers/tty/serial/samsung_tty.c
> > > @@ -2597,14 +2597,21 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
> > >       .fifosize = { 256, 64, 64, 64 },
> > >  };
> > >
> > > +static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
> > > +     EXYNOS_COMMON_SERIAL_DRV_DATA(),
> > > +     .fifosize = { 256, 64, 64, 64 },
> > > +};
> >
> > Why are you duplicating a structure that is already in the same file?
> > What is the benifit here?
> 
> There is a mistake here, the struct shouldn't be the same as e850 it
> should look like this
> 
> static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
>      EXYNOS_COMMON_SERIAL_DRV_DATA(),
>      /* rely on samsung,uart-fifosize DT property for fifosize */
>      .fifosize = { 0 },
> };
> 
> This then allows the fifosize to be taken from the samsung,uart-fifosize
> DT property for each of the 19 UARTs on this SoC.

Ah, ok, then that makes more sense, and makes sense why you would want a
unique dt identifier for this device.  Make that change and I'll be much
happier :)

thanks,

greg k-h

