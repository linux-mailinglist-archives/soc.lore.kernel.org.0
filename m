Return-Path: <clang-built-linux+bncBAABBMV6S2BQMGQE7SRCVAA@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-qk1-x73d.google.com (mail-qk1-x73d.google.com [IPv6:2607:f8b0:4864:20::73d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9569B35135D
	for <lists+clang-built-linux@lfdr.de>; Thu,  1 Apr 2021 12:23:47 +0200 (CEST)
Received: by mail-qk1-x73d.google.com with SMTP id x11sf3391623qki.22
        for <lists+clang-built-linux@lfdr.de>; Thu, 01 Apr 2021 03:23:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1617272626; cv=pass;
        d=google.com; s=arc-20160816;
        b=UYRMhHjig7fWuLy5RYZNit5U9gfkc8Kn4aXHckxLNhHxnVy8uKwR+ylitnPrGvxdov
         wctpmue2BQQU9R2subxJMC65AiGT18aH8QRNfgEot5MhGbNcimQX6pqci29Sckbmn3J+
         SDROEy6Sa2r/TRCiiuvQeJS4lCJhsQ44uNpnHbRk4ysC88o6z2xRRBCXWhNc3RCLIuNq
         JJwwymiiTnamf2P+rVknQ4hlDVuTHbHbLtx6byLTH53e/KsP8oTjfbMQlTrPIGTvlTjN
         rA4g3pG0vrdanmwkjITxVRWL9+zraL8qPhO30BB+4MSwb5Zz3K3Ct6Y+m7hYXQIxErrN
         qFYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc
         :list-id:to:from:sender:dkim-signature;
        bh=3o++zr9GBxP+xLfDNlijuTda8f7LIvXMhfCW61Z91dE=;
        b=swI8spu8ZATEiiOVbrE0bzuZMGs4ZD72sHsNkO6JEy9EWxPFypr3c8GSQYfhGxuuou
         /WxfnF+oIe2tRVCbYngOndljwC8Ex2DBf/T0nCU9mYBYWj29qka9oDocdBfSQdeOD920
         cnn+Zj71pajH8XTODydC57n0ZGNiki2zB+7UuSVuD7wb9Fy0HbyY9BADKdwfKTwdNP4Y
         AA0HW7lprLU+FAJdhFFeI4NdBc0iH4cymn3z18WHSzcleZX/OfqlH40CSMaz3TZkE+Ks
         rEbuw4nSfbyidEZMMcqJw5OjObX63ParNhMxvGbs9rccjlXnFy5InPYwwZAPzOnk2m8a
         xNAg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=bD0IXEYD;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:list-id:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results;
        bh=3o++zr9GBxP+xLfDNlijuTda8f7LIvXMhfCW61Z91dE=;
        b=mDSdfYpRaRc8F+btKvc4x5Q3EDLEwss1ld3XfGWZz894caobLEe5JorPBGSvsqjnMc
         cL4xcXi3gC2BRYJ+vt+a4RKpmbwwStVlCqbAZjKLLw331u7yzrd5YRPK9NUXm4tSj5sz
         otfQSDJWqtbJ5AywAYI1eLC2trZzG5AQxe2Wl1vwwPqqek5oCOrTh0jp/NAllnlaPYEh
         1wR4itDLhh/K2FmqW87c3vyo1jcSkgByv4yO38+d6JLhFa2eRnYzbfAv6SaD9gBFypyb
         Rx8YsgEck6LFUtRB5s6xxscgfS1H1wF7BJ+kEbDq6u5gdJ/Srklrs/xnL/fCaWaGgZwK
         YooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:list-id:cc:subject:date
         :message-id:in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results;
        bh=3o++zr9GBxP+xLfDNlijuTda8f7LIvXMhfCW61Z91dE=;
        b=OczoOs77zl8Zugk4Mx7F8LdmwVrVvI7v46M4ZP00l4R1S6HhTEb86SPRXbZ3J8C7oi
         M/KR/htQ8HPO0oq8Bq4hjBABqmk0YdhAUahBaARPb9snHjHvmLYK7scY9TTTn9qI98Aq
         jP0hAc95uMoPQpAaWWh57DTjRtsXRKHbjl7fPp02qxaZa8aFhW+m6REr09Rbyqof4VJo
         KVbNdjjEa/kJ3kcKYuWcikVd6CxOKZSv4Ua8bbSKZtxssC1z+TX/t9cQwc2zEtU3EKWp
         9E7tZAm+npYED6zKNi2sx+S52mueFFC/BHMcDYobb+X+lo+lEF4SYekx6kZAiHhy+So9
         0zSQ==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM533Cklz+JS/B837HxR3U2Jxo2svwgtsVg6ayWBwvL6ZSXvsf5L/2
	9qruA0ATiuzYEcP7geCuR9o=
X-Google-Smtp-Source: ABdhPJwZkLzt/ooMpEXTtxWQzAX30PpIU9OtLQ+Y2SshbX8LiZn7ESThn4Vo69VurwpbE8N/2HEWZA==
X-Received: by 2002:a0c:cc8c:: with SMTP id f12mr7336696qvl.14.1617272626728;
        Thu, 01 Apr 2021 03:23:46 -0700 (PDT)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:a05:620a:b19:: with SMTP id t25ls3033054qkg.1.gmail; Thu, 01
 Apr 2021 03:23:46 -0700 (PDT)
X-Received: by 2002:ae9:f444:: with SMTP id z4mr7666205qkl.226.1617272626367;
        Thu, 01 Apr 2021 03:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617272626; cv=none;
        d=google.com; s=arc-20160816;
        b=Hh+jL0Iyt8ZTn8C1LQerP18lu3DhEyQfEmzHEMdGTWO7djv1IO5KBGqCYz+sZH6FYA
         GvFfWEau9eYdkiv4hRIGxs5NZzZ/RW6bHFNUsCGcfl/TqgCMH6Th0SONQS4z09iO1tsM
         RPMegc5TxErN8KeNHojLfh5e3++2KvtMjR5VlzuQtb7MUbJiP05kiAH0ECSXXJBRyWPu
         Q2jnKwiaMWQzIdu0IOmWosqcN6wuy9bjvF1G4gCqvktWVlAd4yLUkX/b7Y16dqb4J8EW
         Egi8d6zTqdLcjAHgU1j/oBwHbFxFiNkus9Fbisq7o+ppdFvHIkqPkWtf4EuF6K4H/cUm
         tRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:list-id:to:from:dkim-signature;
        bh=5hcPCeA+K1xcP/rAN68uPeue6TaFfoT3yJ0Z+xpEBcI=;
        b=uC+77KmMssr4oBHrpZTjynBZ3SC7Hb3D75jo/6sF9cfT/wfpPGnj/w4HbwrSByEMIH
         6je0PWffUQpkbPXWtb4Y9q+ay2e0unO71WuveWv//v5n2i1OxLlNki7uUNe+2T8Vbxid
         pYj2x3lYYpGDu9XcFdKWp7w+AtGZuZTyqXqCHJ4qSeMCgw5kqw7pBioViimi5RiZxsZA
         04ilHTAtBLIfIMY8DylNzKxRG+vinbPLMK5m1DiYmOhcXNowF5FCNgg20060t6eg45sL
         gnYw19HqaMkSqul/W0uyl1szZ8up13BDMcB23BNT8ETacLNMpAizFdVF38HlqMmLYuqX
         j6WA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=bD0IXEYD;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id w1si243618qkp.4.2021.04.01.03.23.46
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Apr 2021 03:23:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id F209E610D0;
	Thu,  1 Apr 2021 10:23:42 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Tony Lindgren <tony@atomide.com>,
	Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	soc@kernel.org,
	clang-built-linux@googlegroups.com,
	Nathan Chancellor <nathan@kernel.org>,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: fix building with clang IAS
Date: Thu,  1 Apr 2021 12:23:28 +0200
Message-Id: <161727243810.583633.14191051174001891363.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308153430.2530616-1-arnd@kernel.org>
References: <20210308153430.2530616-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: arnd@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=bD0IXEYD;       spf=pass
 (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted
 sender) smtp.mailfrom=arnd@kernel.org;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=kernel.org

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 8 Mar 2021 16:34:21 +0100, Arnd Bergmann wrote:
> The clang integrated assembler fails to build one file with
> a complex asm instruction:
> 
> arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: error: invalid instruction, any one of the following would fix this:
>  mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
>  ^
> arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: armv6t2
>  mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
>  ^
> arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: thumb2
>  mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
>  ^
> 
> [...]

Applied to arm/fixes.

[1/1] ARM: omap1: fix building with clang IAS
      commit: b897653a2fd4b7d0a77aa209d1e6b5cc08899bbf

       Arnd

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/161727243810.583633.14191051174001891363.b4-ty%40arndb.de.
