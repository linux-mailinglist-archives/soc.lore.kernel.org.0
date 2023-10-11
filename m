Return-Path: <devicetree+bounces-7626-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2377D7C4F4E
	for <lists+devicetree@lfdr.de>; Wed, 11 Oct 2023 11:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53ED21C20B85
	for <lists+devicetree@lfdr.de>; Wed, 11 Oct 2023 09:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCA71D532;
	Wed, 11 Oct 2023 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aVFyjUF/"
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BD11856
	for <devicetree@vger.kernel.org>; Wed, 11 Oct 2023 09:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CADC433C9;
	Wed, 11 Oct 2023 09:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697017352;
	bh=I6BUDFXTqdP5QiIJSn6tklq61ipwC+Dq6rKwc18P91U=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=aVFyjUF/hpsF7z0Z4dqSATlUj9NlaJXZyniaMXQG931Cy+ZYAtRpdz3DXYxAXFybG
	 +3h1C5+Kg3QLnh0GzK6NPpz5yWZVVP1uhYdhex6pb2gKI1CK/Z3u1TIK8LBlBym4iE
	 K5mp/ed7lrHq86kcy9LD7LfvJkYqEp1JJ8Ea2IFY=
Date: Wed, 11 Oct 2023 11:42:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Olof Johansson <olof@lixom.net>,
	Chanwoo Choi <cw00.choi@samsung.com>, andre.draszik@linaro.org,
	semen.protsenko@linaro.org, saravanak@google.com,
	William McVicker <willmcvicker@google.com>, soc@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-watchdog@vger.kernel.org, kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 08/20] dt-bindings: serial: samsung: Add
 google-gs101-uart compatible
Message-ID: <2023101126-stash-manor-7162@gregkh>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-9-peter.griffin@linaro.org>
 <2023101111-banknote-satin-1f77@gregkh>
 <a6c57156-d3a5-4524-8ef8-6f27cf0a2c97@linaro.org>
 <2023101137-fester-rerun-5c39@gregkh>
 <fe7cf585-622a-420e-8138-10de1cbca511@app.fastmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe7cf585-622a-420e-8138-10de1cbca511@app.fastmail.com>

On Wed, Oct 11, 2023 at 11:30:25AM +0200, Arnd Bergmann wrote:
> On Wed, Oct 11, 2023, at 10:57, Greg KH wrote:
> > On Wed, Oct 11, 2023 at 09:49:07AM +0100, Tudor Ambarus wrote:
> >> On 10/11/23 08:48, Greg KH wrote:
> >> > On Tue, Oct 10, 2023 at 11:49:16PM +0100, Peter Griffin wrote:
> >> >> Add dedicated google-gs101-uart compatible to the dt-schema for
> >> >> representing uart of the Google Tensor gs101 SoC.
> >> >>
> >> >> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >> >> ---
> >> >>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
> >> >>  1 file changed, 2 insertions(+)
> >> >>
> >> >>      oneOf:
> >> >>        - items:
> >> >> +          - const: google,gs101-uart
> >> >>            - const: samsung,exynosautov9-uart
> >> >>            - const: samsung,exynos850-uart
> >> >>        - enum:
> >> >>            - apple,s5l-uart
> >> >>            - axis,artpec8-uart
> >> >> +          - google,gs101-uart
> >> > 
> >> > These shouldn't be needed, just declare the device as the same as what
> >> 
> >> We should have SoC specific compatibles so that any further quirks or
> >> incompatibilities can be easily addressed.
> >
> > "further" work on quirks or incompatibilities can be added when they are
> > found and needed.  We don't add stuff for no good reason to the kernel.
> >
> >> It's not only the IP itself
> >> that can differ, it's also the integration of the IP into the final
> >> product that could have an influence on the behavior.
> >
> > This is for the Pixel 6, a device that is no longer even shipping.  The
> > "final product" is long stable, so this should not be an issue.
> 
> The driver does have soc specific settings for each compatible
> string, in this case it looks like it overrides the FIFO size
> based on driver specific data and the order in which the
> ports are probed [1]. I don't understand why the driver does
> this, but my impression is that if we wanted to change it to no
> longer rely on that data, we'd also need a new compatible
> string.

As I reviewed that patch already, it is just duplicating an existing
quirk/device that the driver already supports, so there is no need for
any "new device type" to be added to that driver, just use the existing
hardware description in the dt and all should be fine.

thanks,

greg k-h

