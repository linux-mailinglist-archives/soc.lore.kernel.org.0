Return-Path: <clang-built-linux+bncBD4NDKWHQYDRBA7M5CBAMGQEEDYL5HA@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-qk1-x73c.google.com (mail-qk1-x73c.google.com [IPv6:2607:f8b0:4864:20::73c])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC53467E0
	for <lists+clang-built-linux@lfdr.de>; Tue, 23 Mar 2021 19:40:04 +0100 (CET)
Received: by mail-qk1-x73c.google.com with SMTP id u5sf2628931qkj.10
        for <lists+clang-built-linux@lfdr.de>; Tue, 23 Mar 2021 11:40:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616524803; cv=pass;
        d=google.com; s=arc-20160816;
        b=Yx+Doj6nHmKBI+io7XsiBhHTEWj0AlIqTNCBFAFAluM71cl88ybt3//nSMBDbnxQXY
         AxvPtMgjOz0CXFYZGXBV6yPuaEip1miSPTwOnKcx0P41xvpAjZErvwsU+fbVfzeBcz6y
         tWWJfGWTxhTJGzc6NiZA0P/DuNvSf1L16Cl54LiEOtduFXoFVp0yUkrK/1q8zBPuHDEG
         hx8fx5/64gGI04Yaw4HeQGLI7npTqCZFP1C2hZbEJyrYKlAimTtOpwVW/JVPdGXl1BFo
         UC5cJrxCHJptJUNcmWYuDbiW31JaS+H/aet+sunUOHEXFsIeZqGkd/oXPFNPmSKwajQH
         ETdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:list-id:to:from:date:sender:dkim-signature;
        bh=0wNWDRp0uxSxZdiDq69iMKmHVDmTx0W9N1oJLDkhT7Q=;
        b=Icb5XYvjefbz+axFlMvxANKuIOcbMAAeeRT3TB8vmG1pUM3mMWu0Pxwk9tEI2gVCrJ
         bZjz/vJfBHYoajrLsbhzRa2FcmN6m3HPQdrNLaPFGHZsJ7a53t1W5xn9E97D1XdNRT+K
         H254n3XEyQKuQVLZCVhoU3UpHzebM+y0nMzPrpr5l32BIIEztbxYLuo8TUftLgfVklaV
         gqt/S7DBVnlOeeVNoQtxJqrnVRDcod47ttEQ+GzbtDJUDcL/KHiESGGlJvQfWrSV/5/6
         4yQhd8q5qLF1dhyF0kKiuncSFR8oXOFdDOkywTS0S0fxoKpPpab7BtCJjMJZu12v9md1
         ZwzA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nnnxFiIL;
       spf=pass (google.com: domain of nathan@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=nathan@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:list-id:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results;
        bh=0wNWDRp0uxSxZdiDq69iMKmHVDmTx0W9N1oJLDkhT7Q=;
        b=mMoIoOSyeezA1vli1faHG3S8KK2ia0JzXcMtA2NfDifucwFkc1Hr5JuiHyTiZ2ovi7
         OAHtr5yc/rU7mrxEpmP+alNa58z79GIAmNIzyi1XSrLDI905PT2jMmJRRNjUzN4kyJRW
         lI5N9OYjGpAl6hc8SlhGuRmKw9S7JzMJazhFbV3VM/P3rGQDTtA7jWWzRWyxrtoMXjyM
         Dv9ZUhrmDBDr7bnxe3HfCD0WJJ8+xX5deT0BuFD4Dm/V+AhX2QTU4EHw5g92fPamsuNZ
         rjPGi9v/KqTNE42XQ4g5CifFbpeZCeCXTcMba2vOEtTWDATcfWR24cwGoPSi0c/RcAQA
         tpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:list-id:cc:subject
         :message-id:references:mime-version:content-disposition:in-reply-to
         :x-original-sender:x-original-authentication-results;
        bh=0wNWDRp0uxSxZdiDq69iMKmHVDmTx0W9N1oJLDkhT7Q=;
        b=HjsXE8vp09yAwVh8f6W/8S7nUO60GD2vic2Sfh+JYZ/LNbHIX89+wp4OGZaT0QHcJ9
         wY/s22wU/dWvfL0Bt8gE+4IFEgASr6V0iezZeaJPUTdHy/1Ym7KsyySi1mWFG3e86HUW
         wP1TKBpe7cTUq1y4D6WRvW/yfBvtbbSMoA4Q+DxK/rvuxwcn8lh+hJ7h0LUhNwneCCXi
         TL3AIswwWEBbef/T+0kTKnr5Z9OqJLpIHb221xIEUIhfqNRHpwbUZsh4mihSssZGafvS
         htk4IYkdNWs//yClCEOpRwfKIoTgwMnE6P20C31j0Wo96aqgLonD0Gs30L1aCYMmugim
         7EMw==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM531PS01+alh56W6aN+77kYqJwV9x0WuV8tdHdNwouLCpnIMMF/QO
	kCWyu5DsGgwUeKMc5OdV6+g=
X-Google-Smtp-Source: ABdhPJxTtO8Qe5/b94U8LvnUW69G1jw9oES7LSjttMuGpwdZo/rDm/7vo6PWnd1ZRPgio/OfljvDEg==
X-Received: by 2002:a05:620a:522:: with SMTP id h2mr6909076qkh.476.1616524803804;
        Tue, 23 Mar 2021 11:40:03 -0700 (PDT)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:a05:620a:12c4:: with SMTP id e4ls9155044qkl.4.gmail; Tue, 23
 Mar 2021 11:40:03 -0700 (PDT)
X-Received: by 2002:a37:68c1:: with SMTP id d184mr6443069qkc.395.1616524803436;
        Tue, 23 Mar 2021 11:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616524803; cv=none;
        d=google.com; s=arc-20160816;
        b=ML10/vaNaansGn3nwUAkn6DnK0qRLrWySaEkjlXOkAnsarhw+FrbyOHaCsygv6Ymvi
         nODvYJSFXPBOeWZRObU8TY761Me3DDNmodncvQDpbGY1y0Z8qoofFrdTlyL76XuYQ6gl
         j9Tg6CSXoNl195ufxHPPmg/YKoqXtOlEztFr427xf6NKtqPUdzssCZGADMrBiC/4A02h
         LmoyOnSrwTHjMcOoN8wPdSnMgFmnh5laz9ahybxOCb+2jBQZ3BUC6HXgm2eK96tM6q8J
         Oh4s4p/OfVI5o9yllSZQ47oDprsnrY4Afxv8HkuPpTfprgafjYUYwDyOavUcYizvcEPI
         2pMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:list-id:to:from:date:dkim-signature;
        bh=xWG0uqg5EN6B0zWH5Dm2tKtwPPqqTj316TMdWAlNrZQ=;
        b=IT6iyI1nfwmacMzJuQO9doDtMFmQKWjPaXcVebWe0/tYSAQIvIRwwVLg9nIcSInT+I
         pni4cWJBbK3sZlFAV6UlNCZ1DUzBKKBaSUQ7+GtBqhhb8Zhnn15OEDxM8Q8brHWzZfVK
         ZpMUVUk3MRwqYpoXzUC+kPwoaMhz2VN3uDHcYMZNtsZhDxHYzoMc8Tojw4KSt9qt+PHm
         9zOuK80FBekbDmeSus/9qucehALx5v1yyUIY1i+I9+YAK0OCfGlJWAK9f++63L80o1E7
         JBoVBcgOUI3ROB2Syxf9d6Tk8BSiikZhj9/HNjJ2LmK7lCuabU3DHCljPHfyQE46xayk
         5k1w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nnnxFiIL;
       spf=pass (google.com: domain of nathan@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=nathan@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id o8si1063197qtm.5.2021.03.23.11.40.03
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 11:40:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of nathan@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id 310AC60200;
	Tue, 23 Mar 2021 18:40:00 +0000 (UTC)
Date: Tue, 23 Mar 2021 11:39:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] ARM: mvebu: avoid clang -Wtautological-constant warning
Message-ID: <20210323183957.cgku3mhmcn53aut4@archlinux-ax161>
References: <20210323131952.2835509-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20210323131952.2835509-1-arnd@kernel.org>
X-Original-Sender: nathan@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=nnnxFiIL;       spf=pass
 (google.com: domain of nathan@kernel.org designates 198.145.29.99 as
 permitted sender) smtp.mailfrom=nathan@kernel.org;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=kernel.org

On Tue, Mar 23, 2021 at 02:19:42PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Clang warns about the comparison when using a 32-bit phys_addr_t:
> 
> drivers/bus/mvebu-mbus.c:621:17: error: result of comparison of constant 4294967296 with expression of type 'phys_addr_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>                 if (reg_start >= 0x100000000ULL)
> 
> Add a cast to shut up the warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/bus/mvebu-mbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
> index dd9e7343a5e3..ea0424922de7 100644
> --- a/drivers/bus/mvebu-mbus.c
> +++ b/drivers/bus/mvebu-mbus.c
> @@ -618,7 +618,7 @@ mvebu_mbus_find_bridge_hole(uint64_t *start, uint64_t *end)
>  		 * This part of the memory is above 4 GB, so we don't
>  		 * care for the MBus bridge hole.
>  		 */
> -		if (reg_start >= 0x100000000ULL)
> +		if ((u64)reg_start >= 0x100000000ULL)
>  			continue;
>  
>  		/*
> -- 
> 2.29.2
> 

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210323183957.cgku3mhmcn53aut4%40archlinux-ax161.
