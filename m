Return-Path: <clang-built-linux+bncBAABBDEITGBAMGQEJSTCWAQ@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0203833124E
	for <lists+clang-built-linux@lfdr.de>; Mon,  8 Mar 2021 16:34:38 +0100 (CET)
Received: by mail-yb1-xb3e.google.com with SMTP id f81sf13133830yba.8
        for <lists+clang-built-linux@lfdr.de>; Mon, 08 Mar 2021 07:34:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1615217676; cv=pass;
        d=google.com; s=arc-20160816;
        b=ClB/JPNWpIn/cVhMkhujZuFfqGaG2ZTs1Gi8RPRwYCmGr46OI1S475N4PHF1PEY9vl
         QkuiztFBI5ub5enlvYsGo0qyCQcxGx+WHX0Zlp8c4esCJ3Odpqyi/TrHGLs6jtEoQP2Y
         Z6mhtsqmbGChtwqLLZJg/xHyUbKZcp0GijJMWfmrNs4KW8V44+/B0QHm0XWFTMDiFVbE
         c6bThG9tfJzcmg+aHsqoZI+zQjHItqRpp8pyyL+2VqTpJt9DaEkbc5myJcfjVPYx0O/0
         xhML4KIV/hyt6LPKMjqVzzxOBO3K4f3tMWQQ4qcVr8dDDF2ZxPDsTovER+ged/AAhVfp
         5pFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:list-id:to:from:sender
         :dkim-signature;
        bh=+7pDJwe7az3kEJiyRa32fNj8tMrAY0zrruU7AwPGfGI=;
        b=KsjtvCdEshTyEQeKQDy9j3xRrSbQl23n4ryhNpBnF1GPGH2nF7jU8DQGpfpIaO80Fe
         21KRtg5Vg1EJAWGmIWpk9lC0qhKauXYTrzb5eodC+/oBZPnBaJo4yjVVRc8y8IrsjMTl
         TjQEBoPoyNrkvVlJUlzdEE3CUYfAxaMv8/z19Eu0v47NTKNn2+F5PnRuCwYMgXWSDOnV
         QxC9UwLWrHTaGTnlJCLWGtv6IKiPvU2PshyKypOdBIdFHS2zW6KFqQLKoEJ1ygm07TuO
         u4g1bRCFz4fMGc+7/XKonjC979C249n0mgpdity+d5d2DTqfWi2SM3FGZQl4Y3aSmJWn
         ZU+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="pF/hs/lB";
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:list-id:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results;
        bh=+7pDJwe7az3kEJiyRa32fNj8tMrAY0zrruU7AwPGfGI=;
        b=RVELdcOqmwntnamQsgRzmtSp3JYtqqbHer/XWmH/g9xcselbvlb/dTL9uRglCxPKST
         o1hEhzKi473ZRpsKrbM7b0QhseBxaBkVJoy63Ch5GwwD5YA5sNCdc0iZ6V2PZcF8IBzE
         S1ZnnLM00YQoh5tDFmdbzWM4ll/2pjdwZDl+wiAVb2pzDQ2ZQPSzFk9diNIe7mZ9Owow
         7MTJiEuqX6IYkvqGlvPAb5rOeb6Q40b1uhOdi6PhDOgVNnzGlyuet3H+ent993jq1V9A
         Qw1JIYLlLO+BE4BgnBxlsoOrM0im1sBovYJsQ3Tu5HV7dhBQU7J2/L5DsvW7l+6Ivhsg
         8g+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:list-id:cc:subject:date
         :message-id:mime-version:x-original-sender
         :x-original-authentication-results;
        bh=+7pDJwe7az3kEJiyRa32fNj8tMrAY0zrruU7AwPGfGI=;
        b=eiw/aJ0kCoAys66PJzrGibRmMSnFrzNSq2LjN6rjC4CtrrVWKLyeYPgfX4AhxPsxwL
         Eq0UNPw+ncmKDR2lYR6qUJuAD5V/9S27Y6rJn+OM+MjBEOpLCAILIHFMLsNk6RJmE3ww
         y4le6TebIjmCeu8RIcAgh+Za9zXs4nemU6rRGjLgDOGbs4LxxB+kIyjQCc4/Gchm5aXG
         0CsNI7YtJOeYTvWSmW0w4ZrMTvOYdZUy99Zjc8ag5HD9ByiN1FwfwUEFhWNJfMwqNT+K
         UdebcNflCce6klrla4WxA9bMuz4X7sOvnUYQ+BflI4NP3hB0t4j8t4i3nLAoEVQ5HKEN
         I0/A==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM531K6kBsKC8rVvSn7o/m2blorJthOn6gN3y8MhBsW/MFCqScVlh/
	lrleC3kPPdsWdgGMCyfSgwo=
X-Google-Smtp-Source: ABdhPJyGqXJnS28nbUEru4gUZsTYAoShz+2BqSmlLCazz2SpE67AUr0jmZnnsBNlYMktX+dfsFR+HA==
X-Received: by 2002:a25:ad5c:: with SMTP id l28mr31356748ybe.307.1615217676497;
        Mon, 08 Mar 2021 07:34:36 -0800 (PST)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:a25:cb81:: with SMTP id b123ls8835024ybg.11.gmail; Mon, 08
 Mar 2021 07:34:36 -0800 (PST)
X-Received: by 2002:a25:d684:: with SMTP id n126mr33189023ybg.223.1615217676089;
        Mon, 08 Mar 2021 07:34:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615217676; cv=none;
        d=google.com; s=arc-20160816;
        b=alcXRl0wjn4f2kkCHeMulH6K4iZa3ToCssIBAx09YtEBn5813spKHQ5w7ftMj0WkOJ
         Dm/61C2URQUmhOJRXT1vgUbe1YXwKHcw468JN167oMHx2WvwS4QcKKFmsHDvXdtTNtzY
         YoWhf0/rIgNOb3HunkbylEIFbIGzgsE/ZQXpV0TlNn3AbVtHfk/9aGnlHz5xIFFzeD7B
         7vKfqT1wIO0XfF01m98V4SFp/rMszozLUG7INSJaLkKch013Kg40xGbmRSKdkPjv5pAj
         fN5YgffegMXn0nXPNImmlH4nknMbbqBbg0dmYqttK1T3zYiezl6xPlwI/QhB6xaOIkT2
         2FtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :list-id:to:from:dkim-signature;
        bh=Ruzcn5ruhXvQUsCo+1JrOvaCEuUe0h/JS52OGFK7bE4=;
        b=gx9Jvd5eIIuYfQzKS1/f5+eR9lIC7BcE5KBcC1PAVm0YiDVsd0UKRqaYaKI/952Pdz
         geiq8d2F+G652lj+DMl9vgwePRUEKTp2JNFyBfiwoggkwKjX77e0dr/t0x8UVad/tSHV
         VZPeKcSK8rCIIgnG101u8fcKdz+b+ZZJrg7luvPNBoNtw+lvYxVhrXmm7RSbitHvwM/f
         9XwLL5YN/pZn77fGeuKFGT+/l5mZGWz+bHcLZSX6qDlEAUPJTb1xcqU4JwPJk7lniJhS
         t/Yyz3053m6MJj0su81npaffRar7cPCguO1nApvRyPS6ovhBasUIHsrLVMEn/Y3XNspX
         0pFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="pF/hs/lB";
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id x7si743975ybm.0.2021.03.08.07.34.35
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Mar 2021 07:34:35 -0800 (PST)
Received-SPF: pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id 060B565208;
	Mon,  8 Mar 2021 15:34:32 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: [PATCH] ARM: omap1: fix building with clang IAS
Date: Mon,  8 Mar 2021 16:34:21 +0100
Message-Id: <20210308153430.2530616-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Original-Sender: arnd@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b="pF/hs/lB";       spf=pass
 (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted
 sender) smtp.mailfrom=arnd@kernel.org;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Arnd Bergmann <arnd@arndb.de>

The clang integrated assembler fails to build one file with
a complex asm instruction:

arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: error: invalid instruction, any one of the following would fix this:
 mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
 ^
arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: armv6t2
 mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
 ^
arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: thumb2
 mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
 ^

The problem is that 'NR_IRQS_LEGACY' is not defined here. Apparently
gas does not care because we first add and then subtract this number,
leading to the immediate value to be the same regardless of the
specific definition of NR_IRQS_LEGACY.

Neither the way that 'gas' just silently builds this file, nor the
way that clang IAS makes nonsensical suggestions for how to fix it
is great. Fortunately there is an easy fix, which is to #include
the header that contains the definition.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/ams-delta-fiq-handler.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap1/ams-delta-fiq-handler.S b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
index a0fb7cca0fc3..e6a33024f6b4 100644
--- a/arch/arm/mach-omap1/ams-delta-fiq-handler.S
+++ b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
@@ -16,6 +16,7 @@
 
 #include <asm/assembler.h>
 #include <linux/soc/ti/omap1-io.h>
+#include <asm/irq.h>
 
 #include "hardware.h"
 #include "ams-delta-fiq.h"
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210308153430.2530616-1-arnd%40kernel.org.
