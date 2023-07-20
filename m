Return-Path: <netdev+bounces-19497-lists+netdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+netdev@lfdr.de
Delivered-To: lists+netdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 600EE75AE83
	for <lists+netdev@lfdr.de>; Thu, 20 Jul 2023 14:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49E041C21447
	for <lists+netdev@lfdr.de>; Thu, 20 Jul 2023 12:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9443C19A0A;
	Thu, 20 Jul 2023 12:36:20 +0000 (UTC)
X-Original-To: netdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24866199EC
	for <netdev@vger.kernel.org>; Thu, 20 Jul 2023 12:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E69C433C7;
	Thu, 20 Jul 2023 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689856578;
	bh=tx4bjwgSSJSb6YT5+Vwiw5cr91ahSeHGqQoHPOhKX8c=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=OxsinWvIFF5gSYzeC9nprmcJnexZ2+pzRTEtCPGSDVXBXTxmtyD8J6cScmlKDK3cB
	 5yE1supJc9fsWZHybibJENoDpuz2+JtJq0G0/o1M9H5vusZ/mbBNE89kmITtLNWiUv
	 VoYJp6D/sT5jvqV22YqlSQtVCg1Ds1tBAbxEP0qahLvXW+mcnCR+r5IZSf1AolV+A8
	 TLA3CjFa77OdSPos2Qg4O1B7BjDbMZaGdV7iiw3FoGeIJWPra6iLOe3D7hFUktjPhd
	 pswJWK5/sxEEqZ7EFzaPyQhlO+ROBbnAN36OJeucLXcjKaVy7Z0N1/uAdQi0D9efa3
	 FUZwjDuSIiyQw==
Date: Thu, 20 Jul 2023 13:36:01 +0100
From: Mark Brown <broonie@kernel.org>
To: nikita.shubin@maquefel.me
List-Id: <soc.lore.kernel.org>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Lennert Buytenhek <kernel@wantstofly.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sebastian Reichel <sre@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michael Peters <mpeters@embeddedts.com>,
	Kris Bahnsen <kris@embeddedts.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 42/42] ASoC: cirrus: edb93xx: Delete driver
Message-ID: <d77bee81-190a-4aa2-98ac-8da3a9801b50@sirena.org.uk>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-42-3d63a5f1103e@maquefel.me>
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5GyV5EkRHy37I+rH"
Content-Disposition: inline
In-Reply-To: <20230605-ep93xx-v3-42-3d63a5f1103e@maquefel.me>
X-Cookie: Ginger snap.


--5GyV5EkRHy37I+rH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 02:29:42PM +0300, Nikita Shubin via B4 Relay wrote:
> From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>=20
> Can be replaced with "simple-audio-card" for the rates up to 50kHz, refer
> to commit "ARM: dts: ep93xx: Add EDB9302 DT".

Acked-by: Mark Brown <broonie@kernel.org>

--5GyV5EkRHy37I+rH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS5KjEACgkQJNaLcl1U
h9B6aQf/XDtbT4LN4vU9F6keDfckOFzxaWiUcy57r8jPcwHJg8vCxhKWHLrclREk
XH6ynZJ84wMW6ghI1RW3NJ06CVhs/KPzBcZ30la2LplfkeaUXMcB6Gh7C3NSzzkZ
47MAW/Y4HgC8BFFwixdr6vcqulgad7GD8AZcJq0FfaRSuv0OBYpicItwd2Hjxyev
yx3wdBDRiwxBn4FdFOd1KU3fnLZbvVBEmrF54V5z8AM3nkN+u0tSyAHyoaEMNQ+N
bBbcQi0/TIdD0ktmis2z41SHRJJUpLB65MWk6Kjs92gE9GS7g4m3LJrDtrm/FqVT
81KRIgPAl1ZTlDxAZhUIyTGU9MecZw==
=aMu7
-----END PGP SIGNATURE-----

--5GyV5EkRHy37I+rH--

