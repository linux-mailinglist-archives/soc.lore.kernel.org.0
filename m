Return-Path: <devicetree+bounces-6288-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 299DA7BAA2B
	for <lists+devicetree@lfdr.de>; Thu,  5 Oct 2023 21:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 209BF1C20945
	for <lists+devicetree@lfdr.de>; Thu,  5 Oct 2023 19:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BA641743;
	Thu,  5 Oct 2023 19:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DjI8Frt+"
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ADE266D5
	for <devicetree@vger.kernel.org>; Thu,  5 Oct 2023 19:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D63C433C7;
	Thu,  5 Oct 2023 19:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696533805;
	bh=mEC4GCPFke5BHEMWLbxQgvP7fQIPlgzksDjsQnxScS8=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=DjI8Frt+YkYm54tzjnBb1KFjBfpXU6PXPmmZtKSjuVjwYSNPiyvTGynp4hA8tTxFz
	 Vey859gxJ/zzg1Q7s+SIHHbOFkZFbDdqiHkX0AJbrW+rI5WQFxAxxQtMj+NOZpt1fP
	 6Nz647Q+482Gkqk26jF+MQotdB0tnlu8iCRIFFTc=
Date: Thu, 5 Oct 2023 21:23:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: William McVicker <willmcvicker@google.com>,
	Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
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
Message-ID: <2023100513-mashing-scrubber-ea59@gregkh>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-19-peter.griffin@linaro.org>
 <ZR75cIvnQS2cqTT3@google.com>
 <2023100520-cleaver-sinless-fbae@gregkh>
 <99419159-cab0-4c79-a4a0-12229bfad3c0@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99419159-cab0-4c79-a4a0-12229bfad3c0@linaro.org>

On Thu, Oct 05, 2023 at 09:18:48PM +0200, Krzysztof Kozlowski wrote:
> >> I'd like to bring up this thread and discuss the option of not introducing
> >> another ARCH_* config:
> >>
> >>   https://lore.kernel.org/all/20200306103652.GA3634389@kroah.com/
> > 
> > I agree, PLEASE don't add platform config options as that makes it
> > impossible to make a unified kernel image that works for more than one
> > platform at the same time.
> 
> There is no single problem in making unified image as we were doing
> since beginning of ARM64. The ARCH_* is not a obstacle for this.

Then why are the ARCH_* options needed at all?  What does this help out
with?

> >> I especially don't like the "depends on ARCH_EXYNOS" because that forces one to
> >> include all the other Exynos drivers that ARCH_EXYNOS selects that Google
> >> Tensor SoCs don't need. Can we consider using SOC_GOOGLE instead and for all
> >> drivers that actually depend on the SoC hardware, we can just add "depends on
> >> SOC_GOOGLE"?
> > 
> > Why do any of this at all?  It should not be needed.
> > 
> >> The idea is that drivers should be tied to hardware -- not a specific vendor.
> > 
> > And drivers should be auto-loaded.
> > 
> > All of these drivers are not vendor-specific at all, they are based on
> > the same IP blocks as others, so that is how they should be unified.
> 
> They are vendor specific. All of them are specifically for Exynos
> hardwre, because this is Exynos. We call it Google GS/Tensor SoC just
> for fancy convenience, but this just Exynos.

Ok, then why is this ARCH_ option needed if these IP blocks really are
from something else and are part of other drivers?

confused,

greg k-h

