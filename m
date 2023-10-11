Return-Path: <devicetree+bounces-7590-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BEA7C4C47
	for <lists+devicetree@lfdr.de>; Wed, 11 Oct 2023 09:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C8F028214B
	for <lists+devicetree@lfdr.de>; Wed, 11 Oct 2023 07:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A80199DB;
	Wed, 11 Oct 2023 07:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jr0OwM6+"
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B46199CA
	for <devicetree@vger.kernel.org>; Wed, 11 Oct 2023 07:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60242C433C7;
	Wed, 11 Oct 2023 07:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697010615;
	bh=dAef0QN1zwq0RlCLm4JgCn8MtOFfI0dxXws8yV0UGmY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=jr0OwM6+WhUZhFu/W4RdIy/idIaDOEfQhgNsBIoLr2VO5vxAVsMgZJbtI3tGF31Qp
	 9KCF7sA5lU1v9OBclNoCryyIhaq9WbWBqgtG/8VY86fveNLcGB4WAfwA31ZTwthDKs
	 ZyGMGHpqi6N4L6e+itO49fA7m25evDED8yDBITxw=
Date: Wed, 11 Oct 2023 09:50:12 +0200
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
Subject: Re: [PATCH v2 17/20] arm64: dts: google: Add initial Google gs101
 SoC support
Message-ID: <2023101112-essence-vocalist-857e@gregkh>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-18-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010224928.2296997-18-peter.griffin@linaro.org>

On Tue, Oct 10, 2023 at 11:49:25PM +0100, Peter Griffin wrote:
> +		serial_0: serial@10a00000 {
> +			compatible = "google,gs101-uart";

You use this entry, but:

> +			reg = <0x0 0x10a00000 0xc0>;
> +			reg-io-width = <4>;
> +			samsung,uart-fifosize = <256>;

See, it's really the samsung IP block.  Please don't declare new
compatible entries when you don't need to, it just adds churn to the
kernel for no reason (and makes you do more work.)

thanks,

greg k-h

