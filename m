Return-Path: <clang-built-linux+bncBD4NDKWHQYDRBKED6GAAMGQEWILSTRA@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-il1-x13f.google.com (mail-il1-x13f.google.com [IPv6:2607:f8b0:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2822D30FBE1
	for <lists+clang-built-linux@lfdr.de>; Thu,  4 Feb 2021 19:49:13 +0100 (CET)
Received: by mail-il1-x13f.google.com with SMTP id s74sf3887628ilb.20
        for <lists+clang-built-linux@lfdr.de>; Thu, 04 Feb 2021 10:49:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612464552; cv=pass;
        d=google.com; s=arc-20160816;
        b=jryqExm+Ez/ksYS5/8y0h5qBEeQVlfLGHtzPnrONFt+XH1WgBzwDcPvfMwaHVX7MV9
         bnDzfkP9cmUrDgKZBvL7dbkQXseynYg5a7of6g4eBxqb/FxELSA+Fs2GSz70Aqa0a2pr
         qbws8G7PcXFlXdydb6Nb5r4eH15vsX6Dsy4G2dUFL2ECVckDq9fh1u7QsTHymMUe4dzw
         TTQKrq7GQxz29DKn9fFPWE9iHcvb/qGeWLAUiVKfNXnsZg4ZHONwEB4BNdXN0jrXaqKq
         ww15OWpLVNyON7aynUyvWJDXY8dOHRMGZvMaGjKk73fknBkCHGgkeTz9YZl2CwquTRcH
         IoUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:list-id:to:from:date:sender:dkim-signature;
        bh=gWuJr5jCSbLyB5zUU0BWZidappahs70C4PBj3fDlImc=;
        b=O0DE7gkJuDO6EE0xhAV+IVmk9z+KCe2KWSbZocKYtegwdXvMMXoWhB3hS1HkZUErDd
         bNTTA+2s4HODkg1A2JAB7eIVslS+8Oi4Jp6sLvc/HD0PmYKaIkyb0XqVUZrGhBFeNppz
         XvoEwcG/0FVXscnR/Jpcg1I3jid0Z82BmhzMuYzByfqILKVknDFMeT5a6UYro9VHb54z
         WXGjTnmTNCzyJ+ycSN+0D0IdU8d1skhHKaiH0C//AUOVf9JcfPBAtx4us5EOBMsr+4nY
         eUZrYJUi4cFwsVhTXjJUQJjXNDuR+Ep55r7jWxF8EPqPLkJTTYkvePjhoDOKvMuNaiOw
         95eA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=kcikoCRP;
       spf=pass (google.com: domain of nathan@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=nathan@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:list-id:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results;
        bh=gWuJr5jCSbLyB5zUU0BWZidappahs70C4PBj3fDlImc=;
        b=knxH6xDvI8Ou7w03WhZUULtGqo/jRP1ucL01wFXHLdG2m2VMUdEXrsbcD9kSLVNdwT
         Pq0ep/24Em+T5oJizQxtjJ6KetLQeYw0amh/0jWmk34OSif7VaaofTAofRkg8+qyNzK0
         CMP9n1w/nt70hZyaX8+ehW0+iWlqznnViVzkzAlERDSozw4N0r/ifkbu3pHlGW0/uJoW
         baTFtHpeCSlXLCLvNrJsntmsfdZqgdn6fYmiz+icMzEt4T3Mi6qzhsWn+/heRijJN27B
         CUKUs6glLb02YU2e1DQrWUq3iO9vNumdHmYAj5FqdcPocVUHRiGIjWAHjiEYfrADCiVW
         QXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:list-id:cc:subject
         :message-id:references:mime-version:content-disposition:in-reply-to
         :x-original-sender:x-original-authentication-results;
        bh=gWuJr5jCSbLyB5zUU0BWZidappahs70C4PBj3fDlImc=;
        b=AwJYEbhd+JGkHHk22mG5jVJbjuMG+KCkfr9n3rizn1ys+qZyp4SL98UrAjVQM3zRCS
         6zJ9WGUoOS5kBShcGj23sQkiDB25Hfde2Y0yRxkilvCq0LUyOmexr/LFagi90Ss6DgMI
         jkdG9p2cZ5yrpSFkIbLz5ql3W6Q9vDisJPNi4PwlsWrxIl2mHi2HnTdWYk8Zw44wqHq7
         QYV+AFe1lmPnExjRqc/Uhqtts6UijyICb7KO8mEmRbGEbnBTazcw+x98rSIaAoRHZ5NN
         D9jUM7mVlMwl4wbcwZJAly/U7fGSMdDRwpmRb9BqAgGJUBiAhZCo3aJB9mbUT7e2vfLI
         ZReA==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM533HaHX4vE9bJiCZ1fQY7Se7NnVzzDxHxdmFdYUyA0h2k5/Oj02F
	gGQeSZu7Nf6CGFlZZ14Jpw8=
X-Google-Smtp-Source: ABdhPJwK4mOkqM3z/uFSH7Z6gXcuCgKMnTqO/Qb+naedc0JdvRR7szpGK4ZA0TYc6WQpFfYFYnDFGw==
X-Received: by 2002:a05:6e02:1c2a:: with SMTP id m10mr448490ilh.17.1612464552176;
        Thu, 04 Feb 2021 10:49:12 -0800 (PST)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:a5d:80cb:: with SMTP id h11ls1070051ior.3.gmail; Thu, 04 Feb
 2021 10:49:11 -0800 (PST)
X-Received: by 2002:a5d:8d94:: with SMTP id b20mr644625ioj.200.1612464551748;
        Thu, 04 Feb 2021 10:49:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612464551; cv=none;
        d=google.com; s=arc-20160816;
        b=LIjqhG1+RZFkdTXUCxT63iU9Lty0Wa4wfoOjs2ESneYC408EoWtNwhmBs/soPBxyL7
         /OZeLaNAp3EZtkX22ZnR4Gh/4x2Hc2FLEE7AdPGB1K9D5ZwrmOUegxTQRVPnl6R/KFGd
         YuJ+674DWDKcQEE+Ux5xsnWGxlbYJu2iZmPsUHxoFw99oecJtjnv/qwEPqT89lzAkLPF
         D4maa8UgBRf1jcgmb7MsqspcSzlk4o1YDRLG0wmKbj26bxz/F52XQuIzHjN+36MSWYgw
         Cjfbwseh6imILkGo9FaJA5FTyziDpZAFzXW7dUP1DAoF898fAdxO/Hg3/TkLCqWQELbu
         vMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:list-id:to:from:date:dkim-signature;
        bh=pYltHGXTm5nsdVFlQ4HGP2L5gDlBDP2zI2Fhy/vpnuM=;
        b=WTsKBxQi8+KyoNYJdyBmwXTMgApYPzEyPlChg1m73S1Wlc6YKjScDD3oljGhzPBiSs
         cQP8AUQgGy+eoH77pNwRtNx2qm0nbCOSldNGu2vFEm99EuKXXLxLC9FatIp6tFvMkA4Z
         KwIMPyzmbih/VdI0ioKFA1qy+nme5cYTVBeCYbm5bDjfgQ6un5EGBGg7cpEBFvFJnGd0
         mS/s65jAEygcJN09i4Gg8/O4eDN3rZYKN+TXQg1WH7l+B6M/N2XTueSWJb4VY+8J0E0f
         roJAS3MlGoqpOslR24TYljAcXqbuzcfgbq6550HQWLx5OBFQr8D87KJ3QV4Js8U6lkGG
         98TQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=kcikoCRP;
       spf=pass (google.com: domain of nathan@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=nathan@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id d13si264669iow.0.2021.02.04.10.49.11
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Feb 2021 10:49:11 -0800 (PST)
Received-SPF: pass (google.com: domain of nathan@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id E115864DE1;
	Thu,  4 Feb 2021 18:49:09 +0000 (UTC)
Date: Thu, 4 Feb 2021 11:49:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
	clang-built-linux@googlegroups.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: at91: use proper asm syntax in pm_suspend
Message-ID: <20210204184907.GA2991903@localhost>
References: <20210204160129.2249394-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20210204160129.2249394-1-arnd@kernel.org>
X-Original-Sender: nathan@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=kcikoCRP;       spf=pass
 (google.com: domain of nathan@kernel.org designates 198.145.29.99 as
 permitted sender) smtp.mailfrom=nathan@kernel.org;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=kernel.org

On Thu, Feb 04, 2021 at 05:01:20PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compiling with the clang integrated assembler warns about
> a recently added instruction:
> 
> <instantiation>:14:13: error: unknown token in expression
>  ldr tmp1, =#0x00020010UL
> arch/arm/mach-at91/pm_suspend.S:542:2: note: while in macro instantiation
>  at91_plla_enable
> 
> Remove the extra '#' character that is not used for the 'ldr'
> instruction when doing an indirect load of a constant.
> 
> Fixes: 4fd36e458392 ("ARM: at91: pm: add plla disable/enable support for sam9x60")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm/mach-at91/pm_suspend.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspend.S
> index 909856c8a8c6..0d467cc40129 100644
> --- a/arch/arm/mach-at91/pm_suspend.S
> +++ b/arch/arm/mach-at91/pm_suspend.S
> @@ -446,7 +446,7 @@ ENDPROC(at91_backup_mode)
>  	str	tmp1, [pmc, #AT91_PMC_PLL_UPDT]
>  
>  	/* step 2. */
> -	ldr	tmp1, =#AT91_PMC_PLL_ACR_DEFAULT_PLLA
> +	ldr	tmp1, =AT91_PMC_PLL_ACR_DEFAULT_PLLA
>  	str	tmp1, [pmc, #AT91_PMC_PLL_ACR]
>  
>  	/* step 3. */
> -- 
> 2.29.2
> 

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210204184907.GA2991903%40localhost.
