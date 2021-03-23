Return-Path: <clang-built-linux+bncBD4NDKWHQYDRB27E5CBAMGQEHAWJNXA@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC2B346782
	for <lists+clang-built-linux@lfdr.de>; Tue, 23 Mar 2021 19:24:44 +0100 (CET)
Received: by mail-qt1-x839.google.com with SMTP id m35sf1749883qtd.11
        for <lists+clang-built-linux@lfdr.de>; Tue, 23 Mar 2021 11:24:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616523883; cv=pass;
        d=google.com; s=arc-20160816;
        b=pDzR77GOoPZr47WNFpaNrgptd92W2H9ZAeE/Rzr7+dOZ7D0g9KJopVdxlzlfFD1O4e
         kRxwG+gsvmGgchRCj+jO7x3H9Zi/b9EKYr2tlGnw2YMzxUJKm5kSrejisWIZduG73Fk+
         0VEHGQ6znseR4Lr6kiMdXu1jKDgAQRMwmU12Wwl4sTLilOLS9vWovV3sRIdBCajEdhNt
         qsCE0X0B9nF+/Dgw45k8ZxcDTwQN3mDHrdrvGUPYJEWLFrbbvoYStdN7GnjlpEdFVwOg
         n+Q9cWjI6hdgeQ6ATEDx8kef5dShkHpIOwqyq9Ct4zM7kGd6fTiYjOavqspYIINQ3fUU
         3H6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:list-id:to:from:date:sender:dkim-signature;
        bh=OTEo3mxI3R8JqeeebntnVE1J+US5ZpKIjvGzlBSTmAE=;
        b=c4wfnAAVTx2jXqKxZ/O+vSvGd/xh3oBsO+ygMheKHlhWQ4PvzN7UYe31yQwuOytXN/
         GvrTnWLsu714lU1wv6k8z2J59SRGyUWu1uRFo4ZdsAFIJ9zXr1SAfG1nnKUTANbEPUmy
         Dppncu9U8JB412kMa8pQxO3gc72skECkugmYTbu1siiOyXNbQz176Gj5Z+/qyTAP77VL
         foEV/HqDq1F3JRSabTFhS7fwIKRIDE7j+X8MwsK+e53mvgm+NAlqN8X0BrRQoeWfolEl
         Wi3XFjSQwuBP4DMz5LGXzUZzmgYkhiBUh5eY8uvE4Ztr1eam+Au2nIfzpCqHnrVUCuCT
         fA/Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ncRSA4f2;
       spf=pass (google.com: domain of nathan@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=nathan@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:list-id:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results;
        bh=OTEo3mxI3R8JqeeebntnVE1J+US5ZpKIjvGzlBSTmAE=;
        b=nyyO4jeIUYAd3N06QVjfOEpxdGI3vehT16rXHz7hLmrgn7E2PHTxKf6piV+O8dwov0
         Ix3CvPWrhu+ecjYYZndUYdIr7dB77S04WlYk62w577jfU19ZAlct4bI+9s+dPyKhf+um
         /08vr+sZl7lkZleM8iGa/h4nPHAO7AtjaZDKhIDLCCf5a67uCCmL2VApu4G4REwm09DC
         U7kKvyh9CskJhwGY2AN9OKWLNUMTudTWOSc9TXglFUWJrzdTVrorFjlFosucUfED+mjU
         wey2McNkH1ReHY4bh1O+/udUCfh/RpbizkS3CD7Ib4+oafhYXSuhcyHhE/gJlS0mbGZj
         9ArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:list-id:cc:subject
         :message-id:references:mime-version:content-disposition:in-reply-to
         :x-original-sender:x-original-authentication-results;
        bh=OTEo3mxI3R8JqeeebntnVE1J+US5ZpKIjvGzlBSTmAE=;
        b=dp7XaYDtQ8DPHXP5xqtJtM5/cxQpPVFZg6LfIqTjkHoBR+9GM2eekMN1/7AnmH+KSw
         oyVu+hUq8Mpmq/er9T/CU+t5ppQFFlPAdQc7odC6GyEj4YuKK4ZYkHZoLMBm27jDMy6+
         X4uU8CX9odQzRy37iStG1IWfW9P1xrtfqPdIZixaH1LCss36Ysy1UZ1jS1NfoeBrpf72
         u45dhSbfDqFJW7pUPyBp+5ylkF3v2WWwEx6y8Hucqx0SmZctaZFNIiip5/xg3D1URere
         PGJ2iPCA5B7sEGMQpmHGqWU4pbgf5AWHlILXbd5A4HPYZFN1DO6p0IcNLkqM8CsTa+ZE
         5wlA==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM532njOuvpwFLEWgASkisv5YSPzEaS2SMPG7pcInzZnZVlB88+B+K
	DYe1fm33091OmHP9NTwmuoI=
X-Google-Smtp-Source: ABdhPJyNxLSHOOdKj+wcdQyZ867NtfqGHp/O/oose2Dk9uJQYoVkYesaFtNXNy1Sk1v14fl0LDAq9g==
X-Received: by 2002:ac8:695a:: with SMTP id n26mr5668499qtr.20.1616523883674;
        Tue, 23 Mar 2021 11:24:43 -0700 (PDT)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:ac8:5a88:: with SMTP id c8ls3666621qtc.1.gmail; Tue, 23 Mar
 2021 11:24:43 -0700 (PDT)
X-Received: by 2002:ac8:5196:: with SMTP id c22mr5491993qtn.155.1616523883245;
        Tue, 23 Mar 2021 11:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616523883; cv=none;
        d=google.com; s=arc-20160816;
        b=OUyk7F7r4gPiT6HUr/ofOIUuu12Y6YH+W5AopjBd1kKGITnM5EjjpAWAOyFw5LY+0F
         EdgFwV0eMMwVVqKbbTC1Oqg/TxqgRyhvapKITeEi2CtDQXQivwHoKMCs/MovEqrRTpo0
         dyP/SY8YfpxZ2WWovgdaeQ8pfZQ+uY1nErUEK3tTL7BIL7NpT6Vh4sM4BxVIKYY+jX9+
         ktbr+RXN6ZLfB/2Rbnw/o7enULFQjfC7a1ryVTeSeUQ4NSWTlb7tIPJtadhHsbnEXRS3
         DIolkrybq9XxwfHlM4+uQN33tfLxDT3HMhTzaLl78X+l0p+L190NuO99KC8VVMPuNggB
         RxCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:list-id:to:from:date:dkim-signature;
        bh=H7LBY7u0RiV/2WE7pu8d7QkQPleINMowF0vpotWqswk=;
        b=WmUOGVQtQ5YffnMgXe1lpESTVdu/7yBVMeAIwLHEwrKwCUYsZM9v2jNIueSupxI+3u
         DYnVg8ol3dPP3q0q9nDkZ+TEtk183rlQwWRlf6+M9Dq4Hq4gH5z0bo/3fZDsKiPDzcbt
         A4M/c2wjZ/Ud5Uk8gJFida8sLh6pKJIG6sI9Zg9BaQBu4v9PL03n83c8jsf5Lw3G5994
         XnjytdK37WG7nbLk2YaGu5wueehkJh9PTrlX5H6AENHN/0bRT991iQG8qsaLxx5I4pF3
         SjEnkmOBsOYxZJynVO43L2gT5kENYMp/8xx3paridL8sy07l5CHukSKHxkGB+D79rwSO
         nR7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ncRSA4f2;
       spf=pass (google.com: domain of nathan@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=nathan@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id w1si301863qkp.4.2021.03.23.11.24.43
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 11:24:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of nathan@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CDE7619C0;
	Tue, 23 Mar 2021 18:24:39 +0000 (UTC)
Date: Tue, 23 Mar 2021 11:24:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
	Robin Murphy <robin.murphy@arm.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Maxime Ripard <maxime@cerno.tech>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: Re: [PATCH] ARM: keystone: fix integer overflow warning
Message-ID: <20210323182436.5uxkjtgee3eoldvo@archlinux-ax161>
References: <20210323131814.2751750-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20210323131814.2751750-1-arnd@kernel.org>
X-Original-Sender: nathan@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=ncRSA4f2;       spf=pass
 (google.com: domain of nathan@kernel.org designates 198.145.29.99 as
 permitted sender) smtp.mailfrom=nathan@kernel.org;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=kernel.org

On Tue, Mar 23, 2021 at 02:18:05PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang warns about an impossible condition when building with 32-bit
> phys_addr_t:
> 
> arch/arm/mach-keystone/keystone.c:79:16: error: result of comparison of constant 51539607551 with expression of type 'phys_addr_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>             mem_end   > KEYSTONE_HIGH_PHYS_END) {
>             ~~~~~~~   ^ ~~~~~~~~~~~~~~~~~~~~~~
> arch/arm/mach-keystone/keystone.c:78:16: error: result of comparison of constant 34359738368 with expression of type 'phys_addr_t' (aka 'unsigned int') is always true [-Werror,-Wtautological-constant-out-of-range-compare]
>         if (mem_start < KEYSTONE_HIGH_PHYS_START ||
>             ~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Change the temporary variable to a fixed-size u64 to avoid the warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm/mach-keystone/keystone.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-keystone/keystone.c b/arch/arm/mach-keystone/keystone.c
> index cd711bfc591f..2c647bdf8d25 100644
> --- a/arch/arm/mach-keystone/keystone.c
> +++ b/arch/arm/mach-keystone/keystone.c
> @@ -65,7 +65,7 @@ static void __init keystone_init(void)
>  static long long __init keystone_pv_fixup(void)
>  {
>  	long long offset;
> -	phys_addr_t mem_start, mem_end;
> +	u64 mem_start, mem_end;
>  
>  	mem_start = memblock_start_of_DRAM();
>  	mem_end = memblock_end_of_DRAM();
> @@ -78,7 +78,7 @@ static long long __init keystone_pv_fixup(void)
>  	if (mem_start < KEYSTONE_HIGH_PHYS_START ||
>  	    mem_end   > KEYSTONE_HIGH_PHYS_END) {
>  		pr_crit("Invalid address space for memory (%08llx-%08llx)\n",
> -		        (u64)mem_start, (u64)mem_end);
> +		        mem_start, mem_end);
>  		return 0;
>  	}
>  
> -- 
> 2.29.2
> 

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210323182436.5uxkjtgee3eoldvo%40archlinux-ax161.
