Return-Path: <clang-built-linux+bncBAABBX5U6CAAMGQE47AHZMY@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-io1-xd3f.google.com (mail-io1-xd3f.google.com [IPv6:2607:f8b0:4864:20::d3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A65030F709
	for <lists+clang-built-linux@lfdr.de>; Thu,  4 Feb 2021 17:01:53 +0100 (CET)
Received: by mail-io1-xd3f.google.com with SMTP id v25sf3260836ioj.15
        for <lists+clang-built-linux@lfdr.de>; Thu, 04 Feb 2021 08:01:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612454512; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q3np0+Dd5oY/697ynVkTEOjjATK+Ytwz75jHM6wglAW/1SqVDBlcrS3oBitG1trqbf
         amOlg0iGXR55ity37nMV8W6u3PSzNg9w9ynQIsp20KA7W95/GoVSFbn/MQSRNvI3jsF4
         ZCs8g425djaRdmM70PEmhZdbA40qe/chKrtahBshy86yihyih3rxqwX07aUjgoO4rWfS
         peN1Bcfb0WI51VTcUbZ3YsK2h1rITuA/Ne4jeqFOZ5IUlX3vuhhTMYNtpEHmGVGhCZSc
         WM2H4chadfAUkzKFcrykD2nMQeFL6lzfSiTmmF2LCft7dMKg8AV+7Xsrda3eevrDEzSK
         TKtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:list-id:to:from:sender
         :dkim-signature;
        bh=rolAGk6Uzyg0yf9YpR5GzG4IIGAAB/VNaPLF/kEK3S0=;
        b=hQCkIafJoFdbIqa3q+BOB0gRqROVM0fa7QH7toSY9JAf6ZL5gTOyYnz9PmKJN+6hde
         3QU8aWmm5ev0+JuRo5WNfMNPALVVZkDHIZQm9iPhJjLbAsl2BKGhWvI3yCONg5JxsVnK
         plhgoCB8brg42b2fvH9lObw3cg2NO0sHN/tRFJWGlepyFA3GypQwJjb7570Yl+uMqBCI
         yC+zwaofto/PZ/wLZ4iTEm6fFLETqExMXLIDydOfSPuBvxepTS/OjsSx2eCMmZK4qtDb
         T1A4HRiCuhc8+lDIXeB73KDHxR1AsejgPVb4nZE/avia8QDLVBrFWh8fr17ov05ceG57
         Mskw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AxxDK+Qh;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:list-id:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results;
        bh=rolAGk6Uzyg0yf9YpR5GzG4IIGAAB/VNaPLF/kEK3S0=;
        b=nUccmvjzZbGyeX4z479slBSt9GYrJWuEImXklRdt/Pd1EA2yB/pPzoUVbv6ZdLkeXU
         uTFSKYaWA5Xw0s5Vbr0uVZw4r7n0mhof+Szphwc+ljcSQyEXj9sLObuE/FxSmWS4bAX8
         6v0ACTYpr72SB2D+sIuBD1xuthP7faxzVDo/8/22vndv+CInuWIcxxl7Wr0O2+YSX0pZ
         7WQFQE5JoCGfJHhzVoL/9ICMMAcGhGyo0a6tg2Vz8QadbDGuNsnHAmO4ycAs5OcLngi9
         lez/7zC2o5N/s+pSAjX8e9mtGKy1M51bksLsroqd1ZWWcJ1YQDc+gVwgmRlE4tkhjcfJ
         BqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:list-id:cc:subject:date
         :message-id:mime-version:x-original-sender
         :x-original-authentication-results;
        bh=rolAGk6Uzyg0yf9YpR5GzG4IIGAAB/VNaPLF/kEK3S0=;
        b=iJxq/YKEdvd51ueWajHEJZXHD7+99v27iw998flCSnR6gI0RomUvYDbSiuaKPDoGa9
         4ZKuhzQIDwNtNBTBbmoBjVRRSnTlULizDZO9OX4vTGO2W3/by6G9raEXt/HmHhvVj72E
         4xUhrCpcGg0v1fuQPLyz2B/FvBYOjJFsU/zq+3XOfh8y2DOsimX9ucCjS3jtTGMrUGIc
         n6/Lbm0mrsnCm8qeoFwYNDV9CNONPBrX8qE1cgqGQHKX2lAOidA4fW166VAWJGOd4FWN
         gNEzQuFMaUka9BbsfVqxjVffuXkLYzUHJ5u77QEDi+HRUQYVr+2tSHmi3+pisQyiTjUk
         QeJQ==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM531ycnz4oQ5Y8j3ZTYKrw9WPAkwZxUuMvycWM8HWty9c3QnedIeK
	039OAKKJNmyuBNEYR5NvVA0=
X-Google-Smtp-Source: ABdhPJwy5R5IN1wqIeAr16j5EqnAn+AZPpAfVP2y5Oz/jXgwmVJrG2WIlVDWHTGZORmzv+NMKRR2RQ==
X-Received: by 2002:a02:3f62:: with SMTP id c34mr249812jaf.16.1612454510668;
        Thu, 04 Feb 2021 08:01:50 -0800 (PST)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:a05:6602:2cc5:: with SMTP id j5ls986357iow.0.gmail; Thu, 04
 Feb 2021 08:01:35 -0800 (PST)
X-Received: by 2002:a6b:5404:: with SMTP id i4mr23810iob.62.1612454495231;
        Thu, 04 Feb 2021 08:01:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612454495; cv=none;
        d=google.com; s=arc-20160816;
        b=DuOb2e49SvUcZUmxe8CSqarD7lvpAIeNh/UXWezfD0xCoNxLzjID0duizPWOIGUUDT
         BMFBuyre8/XBPlWlK9DrkHy28/0X0IBQd6dEAhd82i86lklUxeUP1Uz5Px+3g6NmK8VX
         nnp63kVz2Zlg9JGTX9D3PS6DwHJ3NvUoOiMgb1RXLk48WMnXkifV0yih0+zIGktRYopi
         B54H2833jUolkNlmz6XBivTOgmrr73U8XALbhZ62h4hBdiPIzYowqLFO7bKp7y9s8Xzy
         5GHynnZgPXRWYv7a0vTgoM6vUbVfFk7MOUtzh22N5qJV6QTNKklrKGrCiFQ3zqrM1KeL
         qJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :list-id:to:from:dkim-signature;
        bh=5jDSRumq/K8ZNA0itjaJcdimD89MM91uEvnnm76HyCU=;
        b=wJgFOZ4kwxphqBEcNYbimoO7CmrYLX8IDcZafn1enZeNFvl7RYrWr77vZs2S/3uaia
         MBaKvxKvR4FlMkUDKM5vP17e8ueg0TpQMNeFDwuOrfe+hnn+PQjwAdLzczGhu9206aKr
         6KHs8YDM1GA3dzouooQJnKxp4bBbAbuJ32T0FVrxFLk79VHGIJm55+lLNkB4W0ulXepo
         md2D582BL+HnLoz8BG1Rre76SY7z48ZeNTy/njMmAEisb2OSUDD4ByZC21pptwp2FHmw
         an1lxk61YhMVpEgXEk9WVE1Mtnyn7j/P0YFkqhSTGsMnYI06kD6NaxUC1XgOfBRBSopf
         SJLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AxxDK+Qh;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id y6si217046ill.1.2021.02.04.08.01.35
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Feb 2021 08:01:35 -0800 (PST)
Received-SPF: pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F40E64DD6;
	Thu,  4 Feb 2021 16:01:32 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Stephen Boyd <sboyd@kernel.org>,
	clang-built-linux@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: at91: use proper asm syntax in pm_suspend
Date: Thu,  4 Feb 2021 17:01:20 +0100
Message-Id: <20210204160129.2249394-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Original-Sender: arnd@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=AxxDK+Qh;       spf=pass
 (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted
 sender) smtp.mailfrom=arnd@kernel.org;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Arnd Bergmann <arnd@arndb.de>

Compiling with the clang integrated assembler warns about
a recently added instruction:

<instantiation>:14:13: error: unknown token in expression
 ldr tmp1, =#0x00020010UL
arch/arm/mach-at91/pm_suspend.S:542:2: note: while in macro instantiation
 at91_plla_enable

Remove the extra '#' character that is not used for the 'ldr'
instruction when doing an indirect load of a constant.

Fixes: 4fd36e458392 ("ARM: at91: pm: add plla disable/enable support for sam9x60")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-at91/pm_suspend.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspend.S
index 909856c8a8c6..0d467cc40129 100644
--- a/arch/arm/mach-at91/pm_suspend.S
+++ b/arch/arm/mach-at91/pm_suspend.S
@@ -446,7 +446,7 @@ ENDPROC(at91_backup_mode)
 	str	tmp1, [pmc, #AT91_PMC_PLL_UPDT]
 
 	/* step 2. */
-	ldr	tmp1, =#AT91_PMC_PLL_ACR_DEFAULT_PLLA
+	ldr	tmp1, =AT91_PMC_PLL_ACR_DEFAULT_PLLA
 	str	tmp1, [pmc, #AT91_PMC_PLL_ACR]
 
 	/* step 3. */
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210204160129.2249394-1-arnd%40kernel.org.
