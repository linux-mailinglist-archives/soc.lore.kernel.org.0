Return-Path: <devicetree+bounces-13888-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB197E138A
	for <lists+devicetree@lfdr.de>; Sun,  5 Nov 2023 14:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE3D81C20916
	for <lists+devicetree@lfdr.de>; Sun,  5 Nov 2023 13:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355B0BE50;
	Sun,  5 Nov 2023 13:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MniEM5PH"
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB16BE4D
	for <devicetree@vger.kernel.org>; Sun,  5 Nov 2023 13:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329B4C433CB;
	Sun,  5 Nov 2023 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699189710;
	bh=MCqJNI03UFqb6LHDctkh2LC8kdxMRabrpkMYqXWY2kw=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=MniEM5PHWYRsDyZRVS4AlatPYhv0IM+enodpSeCKY3Sc7Bah7ubC7NmvJVMs8AjzH
	 pOimGOvHkZQ8J8Z/reQu6/921uVRigo5I63OTR2wzGhJjhP9DAz5R93H23dpKM7CHV
	 pQBdRul2inplF6UsOXn00aduZ9QVNUBuHQs7g4eU=
Date: Sun, 5 Nov 2023 14:08:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: William McVicker <willmcvicker@google.com>,
	Maksym Holovach <maksym.holovach.an.2022@lpnu.ua>,
	Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
	s.nawrocki@samsung.com, linus.walleij@linaro.org,
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de, olof@lixom.net,
	cw00.choi@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, semen.protsenko@linaro.org,
	saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com, linux-serial@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Message-ID: <2023110535-rare-underdone-b508@gregkh>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <3d489d6c-2098-4f0c-9ec4-f6040665753e@lpnu.ua>
 <CADrjBPp+fyNoPdix6=Wp4cDCRFq2Mui8NS6WENejcHn+H1M-jA@mail.gmail.com>
 <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua>
 <c0b8f356-0f26-459d-850d-ec0fa1fd3987@linaro.org>
 <ZUUvp3kqM7NPlyZ_@google.com>
 <cee1b28d-5bd9-46eb-b9f4-facbad10b5d7@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cee1b28d-5bd9-46eb-b9f4-facbad10b5d7@linaro.org>

On Sun, Nov 05, 2023 at 01:52:22PM +0100, Krzysztof Kozlowski wrote:
> On 03/11/2023 18:36, William McVicker wrote:
> 
> >>
> >> That's indeed a problem. Future Tesla SoC might have just few pieces
> >> similar to FSD. There would be no common SoC part, except the actual
> >> Tesla IP.
> >>
> >> Same for Google. Future GSXXX, if done by Qualcomm, will be absolutely
> >> different than GS101 and the only common part would be the TPU (Tensor).
> >>
> >> So now let's decide what is the common denominator:
> >> 1. Core SoC architecture, like buses, pinctrl, clocks, timers, serial,
> >> and many IP blocks, which constitute 95% of Devicetree bindings and drivers,
> >> 2. The one, big piece made by Samsung's customer: TPU, NPU or whatever.
> > 
> > As mentioned above, I think this should be based on how the DTBs and DTBOs are
> > used and distributed.
> 
> None of existing platforms do it. Nowhere. All chromebooks are split per
> SoC, not "how DTBs should be used and distributed". There is no google,
> no Chromebook directory. None of Samsung phones have it. No
> Samsung-phone directory. None of Google phones have Pixel directory.

but for code we have:
	drivers/patform/chrome/
	drivers/firmware/google/
	drivers/net/ethernet/google/

don't know if that matters or not, but thought I would mention it...

thanks,

greg k-h

