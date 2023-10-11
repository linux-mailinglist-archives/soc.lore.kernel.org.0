Return-Path: <devicetree+bounces-7588-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F467C4C40
	for <lists+devicetree@lfdr.de>; Wed, 11 Oct 2023 09:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 930232820BD
	for <lists+devicetree@lfdr.de>; Wed, 11 Oct 2023 07:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AF7199CF;
	Wed, 11 Oct 2023 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="buVQLXMB"
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BC16132
	for <devicetree@vger.kernel.org>; Wed, 11 Oct 2023 07:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D3BC433C7;
	Wed, 11 Oct 2023 07:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697010425;
	bh=TKxbMsBarpoZFO2cUw4PQl8DmB/FWYBI+aG4z8GcLa4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=buVQLXMBcBM2AFFeDvDzvwW3yqrJzLaPTjAgJ7ilI0FD1DZ0n7ccYFaLfArL7o/Do
	 1iyJgqJGH7CO7TK/G1qdSYq+bIWJHp9CyE/wttflXfvKsROFzT9uXBNRBlvzYjMg8J
	 g3pza75bGZ/AOswHPHP5geZZGzAll5dKhsf7R2y4=
Date: Wed, 11 Oct 2023 09:47:01 +0200
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
Message-ID: <2023101109-crispy-escapable-0801@gregkh>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-17-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010224928.2296997-17-peter.griffin@linaro.org>

On Tue, Oct 10, 2023 at 11:49:24PM +0100, Peter Griffin wrote:
> Add serial driver data for Google Tensor gs101 SoC.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/tty/serial/samsung_tty.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 07fb8a9dac63..79a1a184d5c1 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2597,14 +2597,21 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
>  	.fifosize = { 256, 64, 64, 64 },
>  };
>  
> +static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
> +	EXYNOS_COMMON_SERIAL_DRV_DATA(),
> +	.fifosize = { 256, 64, 64, 64 },
> +};

Why are you duplicating a structure that is already in the same file?
What is the benifit here?

>  #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
>  #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
>  #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
> +#define GS101_SERIAL_DRV_DATA (&gs101_serial_drv_data)

What is "GS101"?

>  #else
>  #define EXYNOS4210_SERIAL_DRV_DATA NULL
>  #define EXYNOS5433_SERIAL_DRV_DATA NULL
>  #define EXYNOS850_SERIAL_DRV_DATA NULL
> +#define GS101_SERIAL_DRV_DATA NULL
>  #endif
>  
>  #ifdef CONFIG_ARCH_APPLE
> @@ -2688,6 +2695,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
>  	}, {
>  		.name		= "artpec8-uart",
>  		.driver_data	= (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
> +	}, {
> +		.name		= "gs101-uart",
> +		.driver_data	= (kernel_ulong_t)GS101_SERIAL_DRV_DATA,
>  	},
>  	{ },
>  };
> @@ -2709,6 +2719,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
>  		.data = EXYNOS850_SERIAL_DRV_DATA },
>  	{ .compatible = "axis,artpec8-uart",
>  		.data = ARTPEC8_SERIAL_DRV_DATA },
> +	{ .compatible = "google,gs101-uart",
> +		.data =  GS101_SERIAL_DRV_DATA },

Why aren't you just listing this hardware as the same one above?  There
doesn't need to be a new entry if you just fix up the DT for the board
to declare it as the proper type of device.  No need to keep adding new
entries that do the exact same thing, we don't normally like that at all
for other bus types, why is DT different?

thanks,

greg k-h

