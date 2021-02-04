Return-Path: <clang-built-linux+bncBD4NDKWHQYDRBCUF6GAAMGQEYSQZI2Y@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-pg1-x537.google.com (mail-pg1-x537.google.com [IPv6:2607:f8b0:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C1030FBF1
	for <lists+clang-built-linux@lfdr.de>; Thu,  4 Feb 2021 19:53:00 +0100 (CET)
Received: by mail-pg1-x537.google.com with SMTP id z20sf2944441pgh.18
        for <lists+clang-built-linux@lfdr.de>; Thu, 04 Feb 2021 10:53:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612464779; cv=pass;
        d=google.com; s=arc-20160816;
        b=PduDahn6z7FZTpKg1dJ0CnJ1O8fRz66BlvzUZ3a3HTN8RDwRAEqQ+6p4ioY2omCbY+
         qIL5w/9nNj83oBymxjKgbCAg8rZtvYeLlNarXawsn9KOsJHBsL+C09iK4vHOvAAiUir5
         wp7xzXAsjabCAE69bICHNUYicu+ZeDEe3bWhD+Zdr1oOzqQgNyYbCgmHiuSx/puNoKxp
         D+tWIptPWMvySUEoBfVqoJMve6MTKw2/3lVeL4P8P5rqhi5RuOo6+ml2LIOuV8DEc5IG
         nUMTdWiPYx3YDLRvI9wQ53OXC4XnUUMxCCRiNfdDs7XLKzASUS8PobY1m8K64Fm+iP8R
         a+sQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:list-id:to:from:date:sender:dkim-signature;
        bh=ISa/znv4OEoPshdOWhvS7APTtrZ++x1HkPOZaUphO2I=;
        b=FXaNvGpvw1Ww4laWC8PtmEFJ2NPKc/hs9jvonp83sFCS8AIxdItmp6UXfyHZhQxLPa
         /UnpAhVsFuJ65k+fGkThAuZN/mmrU5nHS0NzzkmFVwEl0xStYKKVKJybNgqtPbkpW4RG
         uvsXKNbUNuJ8k7VBYQAG94/RoZv0BFCqluBiTAFCpdS2+3PLJWerUKqOzlTIgECe4Xy+
         9/mbWA7/TD4CP02aQQ6++J4o8dmhLgO3Y5CDp5f2gLHpGIiBVevjo06Ub53PhTO/Oiq0
         JeeBh5RbQl/jLdqNd3SXIRNUsYy8gxVdETszMMjVvi5kX38OTBcXgKbTQjfxmPOzrwCf
         kltQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=gY4WQlNA;
       spf=pass (google.com: domain of nathan@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=nathan@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:list-id:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results;
        bh=ISa/znv4OEoPshdOWhvS7APTtrZ++x1HkPOZaUphO2I=;
        b=pO8fHWFElUnd/euXo0LrkdeIUCX3ijPH2HbfvWPUJkQ09HC3qL0vh/aSypjsN9vvH6
         29ptITuEKq3qk022kGTqP0cGyqe/RhextXjTacT8a6L2sYH958QpVJM06RQVndMwkmaS
         yUMfUDLBxc8+HTWJUO2+pDsYMH5IKz9wReHGxiqEN9E+bMB1OXxq24Zx2xmYpuSg/r96
         FeYUIYDrOjq3Lh0AgjQfK7P/e0NeTPDbrkWJqerSJzpFp6QOp6AQJvk6mc2A0FppTFyQ
         GtjnWk4jGm/v78Tk7Y43H7KdnxvtDDDP4ALY2JlPKP7JcLL+91ZzVIR5vTDHD4F09M1g
         5e/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:list-id:cc:subject
         :message-id:references:mime-version:content-disposition:in-reply-to
         :x-original-sender:x-original-authentication-results;
        bh=ISa/znv4OEoPshdOWhvS7APTtrZ++x1HkPOZaUphO2I=;
        b=YPf0LEq/AqZg2xSriLBtTr6XjWMo3QLlhP+8OlTpRkIYvlZ6X+vV877h9Wj6VMGmGj
         c0P/EtH+KoHq6YhJVR3wDdBZFOH+LAVNC3TTzq4NBHA8uFvw/aOEOL3pGlsLJWSbVVeA
         pjJ2zGMsjCALCxEIyvROj2i4kw3A3KYQx/wF6toviTW28JDLK+BMiDxnTMKXJEto4Iaf
         4ty6GlNPmSvIrYTLg3+JCVObMpLr/xEJWNnb6ucPh6kAtc5WUjE1rml1CX8elc6h1/f2
         a2b4aJMjkUWF7bZGl3pf5B+D9jX1iyszBVHCohsai/nNh6pawxdrxEvNRdahoYn5Ek5T
         KMiA==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM531dDApWY0cS/rSuSyetoHURXuA9xfsukGO3WpZa/z66FYhf9IRl
	q09gPyYSERhf50TYKkYVQ6E=
X-Google-Smtp-Source: ABdhPJx9Xbc+XE1yYpp1B7k7otpiOhBRA4OnY/OOBcJkFAzIXK1XZN1AVCEZ1LaVgkZqzGowvA0flg==
X-Received: by 2002:a17:90b:3787:: with SMTP id mz7mr374638pjb.96.1612464779113;
        Thu, 04 Feb 2021 10:52:59 -0800 (PST)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:aa7:92cd:: with SMTP id k13ls385843pfa.5.gmail; Thu, 04 Feb
 2021 10:52:58 -0800 (PST)
X-Received: by 2002:a62:7b55:0:b029:1b9:9caa:2e62 with SMTP id w82-20020a627b550000b02901b99caa2e62mr530779pfc.41.1612464778503;
        Thu, 04 Feb 2021 10:52:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612464778; cv=none;
        d=google.com; s=arc-20160816;
        b=vKIjCJvbVPXnGfddi2HmUIZAl3tIYXD7Nvdk1BLe/FBTePYLyAe/NHt+WOAgegFBLK
         zrjm8rSsPaW+XIFmZcsWR/MMlBPAxw1nBQbBx6nBfGKkDd7ikMkVhpNK23ZdAIsPjDsT
         jOulgboU0ySGPMb9HmHcrDzGrZBzUpk80wjKBWNJGqx5/sI+wgM0PzHt849QUAmuoulE
         O6MYr+CrV8I2hx1/GUnBtfWfmRhZMr6kPdoMC21QVxrELhaK6Y8iOVCZzXZOfBds73yW
         NxY4n274Zij3gL6ptFl2UaRxgPJ3GAp/BAoYa+/U6kzPLFA8NTf2s9GD/PGQVGLXV6n1
         IrXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:list-id:to:from:date:dkim-signature;
        bh=mNN+xH/3/1FvtZOWxir5+DLSArt03M6Kq3xnnctCnVw=;
        b=Py6y1FUkpP5B2OD9FFb+xFgKHoIyVXZR/PbQoFm6ZivNvYTKfVNdQKrc5vMJ34ZUmZ
         CYGvRwaoa03qeJcbqtKaTVIivKS9PnVAlOkNQ1E0mOHP7UYs4oKOUd6ajZ/zcM6UrcWe
         2nTtblQMvk+4lnBz5BlQ+7xlJjW9CT3pgodf8lpScXDYc+h4LuN51VsCt7BkEhsCIuqH
         o8mo2eSS83EZV3b/CtLsGZRDW8dUB+83bzs9hNa5ujJDWx9yhAsEURdgUql4LznNLDNm
         1FT5YWRAE+8/Osjk5CGpREzAfnq1z4P6lzWTo3mEmbyq/ELgsVhVHJcH05lldIU1Lvjj
         4GQg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=gY4WQlNA;
       spf=pass (google.com: domain of nathan@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=nathan@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id b189si233661pfg.5.2021.02.04.10.52.58
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Feb 2021 10:52:58 -0800 (PST)
Received-SPF: pass (google.com: domain of nathan@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C97164E3F;
	Thu,  4 Feb 2021 18:52:56 +0000 (UTC)
Date: Thu, 4 Feb 2021 11:52:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ben Dooks <ben-linux@fluff.org>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Stefan Agner <stefan@agner.ch>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: Re: [PATCH] ARM: s3c: fix fiq for clang IAS
Message-ID: <20210204185255.GB2991903@localhost>
References: <20210204162416.3030114-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20210204162416.3030114-1-arnd@kernel.org>
X-Original-Sender: nathan@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=gY4WQlNA;       spf=pass
 (google.com: domain of nathan@kernel.org designates 198.145.29.99 as
 permitted sender) smtp.mailfrom=nathan@kernel.org;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=kernel.org

On Thu, Feb 04, 2021 at 05:23:42PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Building with the clang integrated assembler produces a couple of
> errors for the s3c24xx fiq support:
> 
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:52:2: error: instruction 'subne' can not set flags, but 's' suffix specified
>  subnes pc, lr, #4 @@ return, still have work to do
>  ^
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:64:1: error: invalid symbol redefinition
> s3c24xx_spi_fiq_txrx:
> ^
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:79:2: error: instruction 'subne' can not set flags, but 's' suffix specified
>  subnes pc, lr, #4 @@ return, still have work to do
>  ^
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:104:2: error: instruction 'subne' can not set flags, but 's' suffix specified
>  subnes pc, lr, #4 @@ return, still have work to do
> 
> There are apparently two problems: one with extraneous or duplicate
> labels, and one with old-style opcode mnemonics. Stefan Agner has
> previously fixed other problems like this, but missed this particular
> file.
> 
> Fixes: bec0806cfec6 ("spi_s3c24xx: add FIQ pseudo-DMA support")
> Cc: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm/mach-s3c/irq-s3c24xx-fiq.S | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c/irq-s3c24xx-fiq.S b/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
> index b54cbd012241..5d238d9a798e 100644
> --- a/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
> +++ b/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
> @@ -35,7 +35,6 @@
>  	@ and an offset to the irq acknowledgment word
>  
>  ENTRY(s3c24xx_spi_fiq_rx)
> -s3c24xx_spi_fix_rx:
>  	.word	fiq_rx_end - fiq_rx_start
>  	.word	fiq_rx_irq_ack - fiq_rx_start
>  fiq_rx_start:
> @@ -49,7 +48,7 @@ fiq_rx_start:
>  	strb	fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
>  
>  	subs	fiq_rcount, fiq_rcount, #1
> -	subnes	pc, lr, #4		@@ return, still have work to do
> +	subsne	pc, lr, #4		@@ return, still have work to do
>  
>  	@@ set IRQ controller so that next op will trigger IRQ
>  	mov	fiq_rtmp, #0
> @@ -61,7 +60,6 @@ fiq_rx_irq_ack:
>  fiq_rx_end:
>  
>  ENTRY(s3c24xx_spi_fiq_txrx)
> -s3c24xx_spi_fiq_txrx:
>  	.word	fiq_txrx_end - fiq_txrx_start
>  	.word	fiq_txrx_irq_ack - fiq_txrx_start
>  fiq_txrx_start:
> @@ -76,7 +74,7 @@ fiq_txrx_start:
>  	strb	fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
>  
>  	subs	fiq_rcount, fiq_rcount, #1
> -	subnes	pc, lr, #4		@@ return, still have work to do
> +	subsne	pc, lr, #4		@@ return, still have work to do
>  
>  	mov	fiq_rtmp, #0
>  	str	fiq_rtmp, [ fiq_rirq, # S3C2410_INTMOD  - S3C24XX_VA_IRQ ]
> @@ -88,7 +86,6 @@ fiq_txrx_irq_ack:
>  fiq_txrx_end:
>  
>  ENTRY(s3c24xx_spi_fiq_tx)
> -s3c24xx_spi_fix_tx:
>  	.word	fiq_tx_end - fiq_tx_start
>  	.word	fiq_tx_irq_ack - fiq_tx_start
>  fiq_tx_start:
> @@ -101,7 +98,7 @@ fiq_tx_start:
>  	strb	fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
>  
>  	subs	fiq_rcount, fiq_rcount, #1
> -	subnes	pc, lr, #4		@@ return, still have work to do
> +	subsne	pc, lr, #4		@@ return, still have work to do
>  
>  	mov	fiq_rtmp, #0
>  	str	fiq_rtmp, [ fiq_rirq, # S3C2410_INTMOD  - S3C24XX_VA_IRQ ]
> -- 
> 2.29.2
> 

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210204185255.GB2991903%40localhost.
