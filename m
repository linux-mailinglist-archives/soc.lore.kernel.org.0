Return-Path: <devicetree+bounces-6266-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B197BA89C
	for <lists+devicetree@lfdr.de>; Thu,  5 Oct 2023 20:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 89077B20937
	for <lists+devicetree@lfdr.de>; Thu,  5 Oct 2023 18:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5363CD15;
	Thu,  5 Oct 2023 18:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DQYRnBua"
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AC73B7A7
	for <devicetree@vger.kernel.org>; Thu,  5 Oct 2023 18:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B713C433C7;
	Thu,  5 Oct 2023 18:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696529160;
	bh=3F/QHqu1nZgKxNeTmTMV+qJgLRsqzd8eazwINr7XUsI=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=DQYRnBuak7yuSY0Nc9KfDpzxPIVRAeBvRO01w6qvxxwzTXGLct1Mn9NgGWC6hnJN9
	 feEdYhy/1Vm/65a7ythX2fPwVWtbriUrS60SOIHerQq12l5rxTBE35m+iGqd1b0e1e
	 arsetgEMUhRx71PGlClnNQVRlsj9Xa2FG505fRE4=
Date: Thu, 5 Oct 2023 20:05:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: William McVicker <willmcvicker@google.com>
List-Id: <soc.lore.kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
	s.nawrocki@samsung.com, linus.walleij@linaro.org,
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de, olof@lixom.net,
	cw00.choi@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, semen.protsenko@linaro.org,
	soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@google.com
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC
 support
Message-ID: <2023100520-cleaver-sinless-fbae@gregkh>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-19-peter.griffin@linaro.org>
 <ZR75cIvnQS2cqTT3@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR75cIvnQS2cqTT3@google.com>

On Thu, Oct 05, 2023 at 10:59:12AM -0700, William McVicker wrote:
> On 10/05/2023, Peter Griffin wrote:
> > Google gs101 SoC is ARMv8 mobile SoC found in the Pixel 6,
> > (oriole) Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
> > phones. It features:
> > * 4xA55 little cluster
> > * 2xA76 Mid cluster
> > * 2xX1 Big cluster
> > 
> > This commit adds the basic device tree for gs101 (SoC) and oriole
> > (pixel 6). Further platform support will be added over time.
> > 
> > It has been tested with a minimal busybox initramfs and boots to
> > a shell.
> > 
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  arch/arm64/Kconfig.platforms                  |    6 +
> >  arch/arm64/boot/dts/Makefile                  |    1 +
> >  arch/arm64/boot/dts/google/Makefile           |    6 +
> >  arch/arm64/boot/dts/google/gs101-oriole.dts   |   68 +
> >  arch/arm64/boot/dts/google/gs101-pinctrl.dtsi | 1134 +++++++++++++++++
> >  arch/arm64/boot/dts/google/gs101-pinctrl.h    |   17 +
> >  arch/arm64/boot/dts/google/gs101.dtsi         |  501 ++++++++
> >  7 files changed, 1733 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/google/Makefile
> >  create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts
> >  create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.dtsi
> >  create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.h
> >  create mode 100644 arch/arm64/boot/dts/google/gs101.dtsi
> > 
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> > index 6069120199bb..a5ed1b719488 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -107,6 +107,12 @@ config ARCH_EXYNOS
> >  	help
> >  	  This enables support for ARMv8 based Samsung Exynos SoC family.
> >  
> > +config ARCH_GOOGLE_TENSOR
> > +	bool "Google Tensor SoC fmaily"
> > +	depends on ARCH_EXYNOS
> > +	help
> > +	  Support for ARMv8 based Google Tensor platforms.
> 
> I'd like to bring up this thread and discuss the option of not introducing
> another ARCH_* config:
> 
>   https://lore.kernel.org/all/20200306103652.GA3634389@kroah.com/

I agree, PLEASE don't add platform config options as that makes it
impossible to make a unified kernel image that works for more than one
platform at the same time.

> I especially don't like the "depends on ARCH_EXYNOS" because that forces one to
> include all the other Exynos drivers that ARCH_EXYNOS selects that Google
> Tensor SoCs don't need. Can we consider using SOC_GOOGLE instead and for all
> drivers that actually depend on the SoC hardware, we can just add "depends on
> SOC_GOOGLE"?

Why do any of this at all?  It should not be needed.

> The idea is that drivers should be tied to hardware -- not a specific vendor.

And drivers should be auto-loaded.

All of these drivers are not vendor-specific at all, they are based on
the same IP blocks as others, so that is how they should be unified.

> By making drivers depend on ARCH_*, you are introducing an arbitrary vendor
> dependency and not a hardware dependency.

Totally agree, thanks for bringing this up.

greg k-h

