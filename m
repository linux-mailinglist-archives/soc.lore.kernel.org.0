Return-Path: <clang-built-linux+bncBAABBNV76CAAMGQEPW73INA@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-pg1-x540.google.com (mail-pg1-x540.google.com [IPv6:2607:f8b0:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A7D30F79C
	for <lists+clang-built-linux@lfdr.de>; Thu,  4 Feb 2021 17:24:24 +0100 (CET)
Received: by mail-pg1-x540.google.com with SMTP id s17sf2643109pgv.14
        for <lists+clang-built-linux@lfdr.de>; Thu, 04 Feb 2021 08:24:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612455862; cv=pass;
        d=google.com; s=arc-20160816;
        b=R/kCCwVhqXXoZLp3syfjNX9s1nPD8HvAnWuY7OYxzAeW5C6XUdGjS/2GwSFj81mG8W
         tHssoa5XscMMW2CZvAKRKQ7/Jikn8uIofxcTOWfIg3Lm9KNtzu//KgnFrOOf2kSxpq7n
         GEld8duVC4tUbnEL0HizmI8qS1sTT9dT511WZmV1MlSOmiW8YmvCtfjGOBm1C4Pzo4DZ
         zhMIa37Sn82RyxOLHPb3Dch5yJkLvP05BDBolLW1Cne/x65VsYKwp5zZaeZiqCORtumN
         2yI5UqIutrLghzXX6fEycdhFE6/e/CLmJbExR2MR3eZPWqktROiv+zD+gWdPtbSfNr2H
         REUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:list-id:to:from:sender
         :dkim-signature;
        bh=g/pw0yfRXicfdyPgw9OWiFeAVzHlHjNEu3JqKMuDlVQ=;
        b=Z+MEuTjjIaKmI/K7ekP+a4IABbd0wcJgmq1H174ebuqID7cBC+iz/7GuT34a/33gox
         4PYqsF0WGXOaZtY7nF9HygEiGLosdvMJipVyBxKvB6/IwP7WtAuSoXF+GlTv364j7u0c
         nqJxlySubnbZjuSRYOpzOahxVsmTa3mXP/CBEUhjWzK3o6N/egzTgMQd9BGDvsueO/hP
         Qh0JDNZTveuPI8o2lR7OWdkYjHqjG2ijK0DXm/kzK+u3gIN9pmkVwc4+XAeeD4KbGXLj
         Y+CVPjgQ459T1NnKixX05aWfMrzM/H/m9FbYum0/udkuTlWThYgJKxBQvcs5GHqiCmfH
         EHOA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=m9wBdgig;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:list-id:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results;
        bh=g/pw0yfRXicfdyPgw9OWiFeAVzHlHjNEu3JqKMuDlVQ=;
        b=I3VQOEKTYtOl8KK1aqLuawkhRljLneYEHbH2vCKwTE3aTxqby/L6mmhDqTClzH2Lni
         FwjpVyg9apnQnZuyYlYbt2e3Xmf3X7x7Q+/S9+WrnQn8Nsjsr4VHpitgb4+ohUFazmcA
         3sCtd73XJgbZHbJLtpTINzeSsHHGzZmPS1fhZ642rlN8KVRYl+pyd5WP5vNcJ3wACbrF
         NHh+BgsmT4PcLSpxJsmrR+YLFuqKJQGElTLeg8TyT6VUpTuE+J71mfO5JJky9IWt0f07
         l+II6qwH/PlM+dQ6lYIAKlw9yMCrITTT1trN3JNgkCEYasHiXVCg+Omn2W4B0i3DZ/Kh
         u2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:list-id:cc:subject:date
         :message-id:mime-version:x-original-sender
         :x-original-authentication-results;
        bh=g/pw0yfRXicfdyPgw9OWiFeAVzHlHjNEu3JqKMuDlVQ=;
        b=iPxfeQLh4y/GmtuzlCFJITVvfYVoOyRigWFVSjF7rXzUQSTShIAJLXy2HvCy/hZb4F
         xKYFazKdJsaVj97eoglaPizPWQMDwzoEM38WSZHzxEFDijANOi0j8uMi3SfLhRZj5jYs
         BS3VBmccln7Cu3QfzTTKQHyJyR2ZRnKnfLZbeJCulgcBw08NhJC0I+WSUTFk9GsN+0Si
         6OT0Pn21/+VH+lmqAPffEBT9mgdW1l41U7fH6FSJUAyS4lb9z0nTl+h5CvZ5/bbNi1Z+
         liMaL8LgiDgCUE9O4Lc3/JgtWUNfITgA4GMNA+rMljHDVYzoR2hPhTfh3OVOw2SZaUZy
         Dr4Q==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM532wLqR/EtP1dWbiP52hRMkpEY306JayBFb+o58UTqi5lA/Xzfw3
	y62Vyus1F1jktDDMXdIfGwQ=
X-Google-Smtp-Source: ABdhPJzSgW68wYs2q2Ka0joo/ubgSLa8D3kx8CPIUX4GyscyRtcdUj4NUbpxCiQoONDKp9pCYsw9Kg==
X-Received: by 2002:a63:a03:: with SMTP id 3mr9532775pgk.366.1612455862568;
        Thu, 04 Feb 2021 08:24:22 -0800 (PST)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:a17:902:a707:: with SMTP id w7ls2919331plq.9.gmail; Thu, 04
 Feb 2021 08:24:22 -0800 (PST)
X-Received: by 2002:a17:902:c94d:b029:de:9b70:d886 with SMTP id i13-20020a170902c94db02900de9b70d886mr166449pla.5.1612455862015;
        Thu, 04 Feb 2021 08:24:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612455862; cv=none;
        d=google.com; s=arc-20160816;
        b=qrlgzyzbIunGjnZDPqs+33yyaiOLI9kBYs73ii37ampYlkZkoWmWpXY0T2D8Sw5uyu
         8NcVU3SSaJVJTXthYqUzL5Y2DoosQ8FcGPObgVqUKFp1gBjr/0h+smlpHrAX7UkwsCsl
         qXP+3As/UV09jwAWmFws3ThBLrjRwHIce+4B3BvsDPi2crcKQ0WnQuH64aY+ZkIxOkC+
         qunZPEQTjKQJ2s59xF+BdfCHzpjlbwTBGWN9bMAbHQxSvK/FTIr5qBsReXnDsxYu0f/Z
         L+H7reAnm8jjC4r0rCzwusl6IKJ50SoLhAss3TGtHgiYDUdwiI2o41LjjHEwnbJhi5k3
         9HDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :list-id:to:from:dkim-signature;
        bh=h7MJ4x5ogW7ahwBFEcDW+UnUrz2w4HTkQDTB419X/HM=;
        b=vJ4vt64EEEFH3gnw3VQhGKSWeM36tK/QNxdQ/i0e4YvBsoMmIFFuUixnWTsaWqTpKw
         5ta0lEBgmTzZULxj8iTMnDK4KiR5uPZN9PYliZs4sXfo00yMcLL+VjNogjqDY6WOxAsC
         uUQd0FeHoMHuumGVEt8pOB/TQdhtQ0hsgCUC7SSYGfoZlu4nsVq66SFmukridTKDDG2v
         e6Jp3/WLxL6dwuaKXgi38LEXpT2c5HPX/45DZtt1Pk+Dh3HY+rgsNiY3PcXLirULIR7N
         9yGEpT0Ry0DhN4JL4F+kxNZWsPGFLg7Xb0QLHZIPUZQd2os7CDZdiSgRKEkXuUMK8ySX
         IhMA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=m9wBdgig;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id n13si329582pfd.1.2021.02.04.08.24.21
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Feb 2021 08:24:22 -0800 (PST)
Received-SPF: pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E86A64E3F;
	Thu,  4 Feb 2021 16:24:19 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
List-Id: <soc.lore.kernel.org>
Cc: Ben Dooks <ben-linux@fluff.org>,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Stefan Agner <stefan@agner.ch>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: [PATCH] ARM: s3c: fix fiq for clang IAS
Date: Thu,  4 Feb 2021 17:23:42 +0100
Message-Id: <20210204162416.3030114-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Original-Sender: arnd@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=m9wBdgig;       spf=pass
 (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted
 sender) smtp.mailfrom=arnd@kernel.org;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Arnd Bergmann <arnd@arndb.de>

Building with the clang integrated assembler produces a couple of
errors for the s3c24xx fiq support:

arch/arm/mach-s3c/irq-s3c24xx-fiq.S:52:2: error: instruction 'subne' can not set flags, but 's' suffix specified
 subnes pc, lr, #4 @@ return, still have work to do
 ^
arch/arm/mach-s3c/irq-s3c24xx-fiq.S:64:1: error: invalid symbol redefinition
s3c24xx_spi_fiq_txrx:
^
arch/arm/mach-s3c/irq-s3c24xx-fiq.S:79:2: error: instruction 'subne' can not set flags, but 's' suffix specified
 subnes pc, lr, #4 @@ return, still have work to do
 ^
arch/arm/mach-s3c/irq-s3c24xx-fiq.S:104:2: error: instruction 'subne' can not set flags, but 's' suffix specified
 subnes pc, lr, #4 @@ return, still have work to do

There are apparently two problems: one with extraneous or duplicate
labels, and one with old-style opcode mnemonics. Stefan Agner has
previously fixed other problems like this, but missed this particular
file.

Fixes: bec0806cfec6 ("spi_s3c24xx: add FIQ pseudo-DMA support")
Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c/irq-s3c24xx-fiq.S | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s3c/irq-s3c24xx-fiq.S b/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
index b54cbd012241..5d238d9a798e 100644
--- a/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
+++ b/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
@@ -35,7 +35,6 @@
 	@ and an offset to the irq acknowledgment word
 
 ENTRY(s3c24xx_spi_fiq_rx)
-s3c24xx_spi_fix_rx:
 	.word	fiq_rx_end - fiq_rx_start
 	.word	fiq_rx_irq_ack - fiq_rx_start
 fiq_rx_start:
@@ -49,7 +48,7 @@ fiq_rx_start:
 	strb	fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
 
 	subs	fiq_rcount, fiq_rcount, #1
-	subnes	pc, lr, #4		@@ return, still have work to do
+	subsne	pc, lr, #4		@@ return, still have work to do
 
 	@@ set IRQ controller so that next op will trigger IRQ
 	mov	fiq_rtmp, #0
@@ -61,7 +60,6 @@ fiq_rx_irq_ack:
 fiq_rx_end:
 
 ENTRY(s3c24xx_spi_fiq_txrx)
-s3c24xx_spi_fiq_txrx:
 	.word	fiq_txrx_end - fiq_txrx_start
 	.word	fiq_txrx_irq_ack - fiq_txrx_start
 fiq_txrx_start:
@@ -76,7 +74,7 @@ fiq_txrx_start:
 	strb	fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
 
 	subs	fiq_rcount, fiq_rcount, #1
-	subnes	pc, lr, #4		@@ return, still have work to do
+	subsne	pc, lr, #4		@@ return, still have work to do
 
 	mov	fiq_rtmp, #0
 	str	fiq_rtmp, [ fiq_rirq, # S3C2410_INTMOD  - S3C24XX_VA_IRQ ]
@@ -88,7 +86,6 @@ fiq_txrx_irq_ack:
 fiq_txrx_end:
 
 ENTRY(s3c24xx_spi_fiq_tx)
-s3c24xx_spi_fix_tx:
 	.word	fiq_tx_end - fiq_tx_start
 	.word	fiq_tx_irq_ack - fiq_tx_start
 fiq_tx_start:
@@ -101,7 +98,7 @@ fiq_tx_start:
 	strb	fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
 
 	subs	fiq_rcount, fiq_rcount, #1
-	subnes	pc, lr, #4		@@ return, still have work to do
+	subsne	pc, lr, #4		@@ return, still have work to do
 
 	mov	fiq_rtmp, #0
 	str	fiq_rtmp, [ fiq_rirq, # S3C2410_INTMOD  - S3C24XX_VA_IRQ ]
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210204162416.3030114-1-arnd%40kernel.org.
