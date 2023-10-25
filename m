Return-Path: <devicetree+bounces-11818-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E617D6B3E
	for <lists+devicetree@lfdr.de>; Wed, 25 Oct 2023 14:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C11431C20B18
	for <lists+devicetree@lfdr.de>; Wed, 25 Oct 2023 12:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D472772E;
	Wed, 25 Oct 2023 12:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGEQ15v0"
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E941F607
	for <devicetree@vger.kernel.org>; Wed, 25 Oct 2023 12:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFDDC433C7;
	Wed, 25 Oct 2023 12:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698236528;
	bh=iAp62fcXxNhccc4Gqt2/rcPZle2L2nQUuLLiglxHlKg=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=hGEQ15v027nKsJM73uPY1GbkUWIZlqz8u2RVNASMXTk0gt9cGTV5CKoEOLte5ylvM
	 peWhumFa29diA41cjai/4BuWk0U10OgkiyxYRnWEHujOCWatRsF2HYXUrSajzVu+k+
	 EbbjhgwJC7sIrpXqmmJwr+EpQ9b5eaEA4N2QgNQzIgzJcxBYg2RB/rswwznfvEnJw9
	 jsVYXWoE0ORuRe1wrjgTijk5FKX6o3H2ippbhbrw3KmNNbb7RVi7ZeuKyQiDUhuXX1
	 JSuZkY5S9SRKjKf5YufV6LW3JDNEIX2xzGPiK7WWdjgsTBQklpsW1Me4kaxCDHJ55s
	 Fza4B+3xpbcPQ==
Date: Wed, 25 Oct 2023 13:22:03 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
	Russ Weight <russell.h.weight@intel.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fpga@vger.kernel.org
Subject: Re: [PATCH v3 6/6] riscv: dts: microchip: add the mpfs' system
 controller qspi & associated flash
Message-ID: <20231025-demystify-iodize-cd93fedfd7ff@spud>
References: <20231020-agreeably-filing-3d48708e6262@spud>
 <20231020-unrated-uproar-c911c6185ae9@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K2EkulDe7Fc2EpiM"
Content-Disposition: inline
In-Reply-To: <20231020-unrated-uproar-c911c6185ae9@spud>


--K2EkulDe7Fc2EpiM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 02:18:44PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> The system controller's flash can be accessed via an MSS-exposed QSPI
> controller sitting, which sits between the mailbox's control & data
> registers. On Icicle, it has an MT25QL01GBBB8ESF connected to it.
>=20
> The system controller and MSS both have separate QSPI controllers, both
> of which can access the flash, although the system controller takes
> priority.
> Unfortunately, on engineering sample silicon, such as that on Icicle
> kits, the MSS' QSPI controller cannot write to the flash due to a bug.
> As a workaround, a QSPI controller can be implemented in the FPGA
> fabric and the IO routing modified to connect it to the flash in place
> of the "hard" controller in the MSS.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../boot/dts/microchip/mpfs-icicle-kit.dts    | 21 +++++++++++++++++++
>  arch/riscv/boot/dts/microchip/mpfs.dtsi       | 17 +++++++++++++++
>  2 files changed, 38 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/ris=
cv/boot/dts/microchip/mpfs-icicle-kit.dts
> index 90b261114763..2dae3f8f33f6 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> @@ -199,6 +199,27 @@ &syscontroller {
>  	status =3D "okay";
>  };
> =20
> +&syscontroller_qspi {
> +	/*
> +	 * The flash *is* there, but Icicle kits that have engineering sample
> +	 * silicon (write?) access to this flash to non-functional. The system
> +	 * controller itself can actually access it, but the MSS cannot write
> +	 * an image there. Instantiating a coreQSPI in the fabric & connecting
> +	 * it to the flash instead should work though. Pre-production or later
> +	 * silicon does not have this issue.
> +	 */
> +	status =3D "disabled";
> +
> +	sys_ctrl_flash: flash@0 { // MT25QL01GBBB8ESF-0SIT
> +		compatible =3D "jedec,spi-nor";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		spi-max-frequency =3D <20000000>;
> +		spi-rx-bus-width =3D <1>;
> +		reg =3D <0>;
> +	};
> +};

Hmm, I think I will drop this part of the patch, and instead add the
flash for the sev-kit (which does work correctly) to avoid any confusion
as to why this is not supported on the current icicle kit boards.

Cheers,
Conor.

--K2EkulDe7Fc2EpiM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTkIXAAKCRB4tDGHoIJi
0mrpAP9NgAYLEtvFXBO5DfWx1YJXMlv7vsyRY7eEK5cL3UJxtwEAirHnHzNEZoAG
1JNLFsVyCMD6ZEn4HrrAqnlzW4dY2A0=
=J0jG
-----END PGP SIGNATURE-----

--K2EkulDe7Fc2EpiM--

