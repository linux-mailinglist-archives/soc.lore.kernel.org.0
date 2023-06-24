Return-Path: <netdev+bounces-13633-lists+netdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+netdev@lfdr.de
Delivered-To: lists+netdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D25673C59D
	for <lists+netdev@lfdr.de>; Sat, 24 Jun 2023 02:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 337C1281EB9
	for <lists+netdev@lfdr.de>; Sat, 24 Jun 2023 00:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B677379;
	Sat, 24 Jun 2023 00:52:57 +0000 (UTC)
X-Original-To: netdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24749378
	for <netdev@vger.kernel.org>; Sat, 24 Jun 2023 00:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728B1C433C0;
	Sat, 24 Jun 2023 00:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687567970;
	bh=r/EW6obxSAVNNGjwUGkGRU+SWh5nEHChw4jIkdrVMyk=;
	h=From:List-Id:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dSOKhy79sEB2zIN2c8ajaVofGMArO0Go+fWumUQL9gmmkAU3QnfwbPH7w9WAaAOOZ
	 w2GYaOr0xjKNeW8QA4o905lF5G9oX5k83Z7NVNVK0BRDZOe0gr7KK1bn3S+/TZ4fA2
	 utNavE4sqCzZkKo0lfmhyMQzNQjXWTcX5MAmp82m8t11shclN2Cy3B6Il2KRsjJqa1
	 L6tvmcwX8j5bfsy21mp78UvjksdnPTlXaMUpDMhWKk+uAqGmyUEFF2mtf7Z8p2Q1XR
	 bRoAQou336boKyaD+3RQxZDzBKli+QkQJk1AGEeapc1CUwRC7l8k9a+I5g79sPTr29
	 PSjHxExxu4Q+w==
From: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com, 
 mturquette@baylibre.com, sboyd@kernel.org, herbert@gondor.apana.org.au, 
 davem@davemloft.net, vkoul@kernel.org, tglx@linutronix.de, maz@kernel.org, 
 lee@kernel.org, ulf.hansson@linaro.org, tudor.ambarus@linaro.org, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 linus.walleij@linaro.org, p.zabel@pengutronix.de, olivia@selenic.com, 
 a.zummo@towertech.it, radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com, 
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, wim@linux-watchdog.org, 
 linux@roeck-us.net, arnd@arndb.de, olof@lixom.net, soc@kernel.org, 
 linux@armlinux.org.uk, sre@kernel.org, jerry.ray@microchip.com, 
 horatiu.vultur@microchip.com, durai.manickamkr@microchip.com, 
 andrew@lunn.ch, alain.volmat@foss.st.com, neil.armstrong@linaro.org, 
 mihai.sain@microchip.com, eugen.hristev@collabora.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
 Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com, 
 balamanikandan.gunasundar@microchip.com, manikandan.m@microchip.com, 
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com, 
 balakrishnan.s@microchip.com
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
Subject: Re: (subset) [PATCH v2 00/45] Add support for sam9x7 SoC family
Message-Id: <168756794811.1155588.11719780333735420720.b4-ty@kernel.org>
Date: Sat, 24 Jun 2023 01:52:28 +0100
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835

On Sat, 24 Jun 2023 02:00:11 +0530, Varshini Rajendran wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v2:
>  --------------
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[32/45] spi: dt-bindings: atmel,at91rm9200-spi: add sam9x7 compatible
        commit: a3eb95484f276488e3d59cffa8eec29f79be416e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


