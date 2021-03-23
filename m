Return-Path: <clang-built-linux+bncBAABB7WV46BAMGQESJUL4BQ@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-qv1-xf3e.google.com (mail-qv1-xf3e.google.com [IPv6:2607:f8b0:4864:20::f3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A608345F82
	for <lists+clang-built-linux@lfdr.de>; Tue, 23 Mar 2021 14:19:59 +0100 (CET)
Received: by mail-qv1-xf3e.google.com with SMTP id s16sf1573966qvw.3
        for <lists+clang-built-linux@lfdr.de>; Tue, 23 Mar 2021 06:19:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616505598; cv=pass;
        d=google.com; s=arc-20160816;
        b=qQQlMJsQ5pBcRH1+3+SRCd5A3HHGeNVA++5sudmjkxHX0vpKC2W+WkxEPQbwIQxvNb
         WG8yftK7B3/sX3AUDvaRHdFcvAZGG6OXXjIDRPQEuBQtbZyPp92hZ+33OKxjaAB+QDYQ
         x2fkndqbWBTYf5t7Ne+m9VwlAbWTIICwW6T5pEbxniVqqRnJM5+h4LRbDqZ//1PRRTD+
         +sRhC9AwQqu9AIshptQMX/BZY28+Rh4qVMLedbGlKe/AGMLq7fFh4XCc5dCGPYVRIllX
         O+utz8m3I9p5QcAVaOEwJ0nHcdxVbJb9KkslN95f9Lb95+Oml3dNxT8ZSIDaji8s62/3
         ZHlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:list-id:to:from:sender
         :dkim-signature;
        bh=MgCmGiAe1wKW1hIpdIsY5q0YN4PUGSnqOgN55u0k3+w=;
        b=f9YFgDbRL6eRNZQKOe95NdG2nTUdhwL8NXrSTsftkWW0sueUhAXAd8YA2JD/E7JdlT
         J1SySOr4RHJ3wVQbfX8GYF/6mO3fUYBPjquLAWyfueQ7XaDdm3dlE5GG66KoOiISvNmY
         wmDR6QPLD4aeCNNiR469kPJV1516mk1fV5jdMS8KKL2E8XAHbTvdO5DEsVwXxGHKIG7Y
         UpL+iWqB0wZ6f6+yV1pKfXJ/VLPQJjXSV1GewDENTyGHs/GSk0L8bbsaUcTL3K3vqsSs
         pUrDeInJQd+0AmXmD3oT0ksT73u6JOILbRXFdYAryJQxh1efaR0A1NgqdjMV+cY2ZRTu
         sU1A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=iueD3kIy;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:list-id:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results;
        bh=MgCmGiAe1wKW1hIpdIsY5q0YN4PUGSnqOgN55u0k3+w=;
        b=FQR7fg2iTOxz/2Pt3BifBQ5Jn/Ys6AIZnpTl/zdg7RR6Ix60lSvrAZ9FoH+qu+XyWr
         dRudyTYs/SUzodLjTM/FdEO+nn0pwCwqYNpfMzN7iwZrly9LzcDWrABBVO1S6J0MZo1t
         ltm8C4OBOjzwfdDwcx5L3wSIIbQZYl8mw/2TDFDDQQeejvuGpyanlM5nfpXvsAiAAxKv
         7yq3/zWv07UHI2k/dUMl34qkZH+VHJ7ZQvCTbTFb0FRrPc87FD6EAxTvdbK/+iIwBbCp
         pw62/pdVwaLRZFX4PwkQ8Lg1Wyjuc4iUXd4eZbjRnFeDB7wCc0riJMR1A0alY/NtqMdg
         PR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:list-id:cc:subject:date
         :message-id:mime-version:x-original-sender
         :x-original-authentication-results;
        bh=MgCmGiAe1wKW1hIpdIsY5q0YN4PUGSnqOgN55u0k3+w=;
        b=t8nIGDCIZ/DSTg1DSdFjf1BCQZWFHyzWx22cZ4yN9AXumUocYy20WJkVIR87qw49+b
         youKwHhRH9Wp0+tWC16fGxcM3lbH/T2U/L9NbtddeP/puD7I87R22VeiLOcgiSTSbasv
         mjqz6KuNKVN1eUuUCG7fRPDyzgecxr45+v/9+wOBJDslcgORmSJNq6JfQLtlIeHVaK28
         QIplrB3aIAj7c6Ci392F5NIhAsDh/PCLrZ8CHIAmFOeEiH4YABbBu24dSeEcKZ2vSWtu
         4FcTup3t30+sG88BfksiKRoIWzNccJ/JNCVr0Pvp/KBpgwNQdQl/PrWleCNTsxfvZKhH
         c1JA==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM533Iz7w6iDHiuQVeIe0vxpGdy2/5/zm5RK67ri/HHffPkcyATZyL
	Yvd1QT3g3Htn3+ugm2fMsSo=
X-Google-Smtp-Source: ABdhPJxXM1PV72cUMUAsC0gweJGgsnBN12r7NUZuLT76fEDArZR4yzln2yHWgA47I0dS5DgONyRmWQ==
X-Received: by 2002:ad4:51c1:: with SMTP id p1mr5217930qvq.39.1616505598640;
        Tue, 23 Mar 2021 06:19:58 -0700 (PDT)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:ac8:71d9:: with SMTP id i25ls6130304qtp.8.gmail; Tue, 23 Mar
 2021 06:19:58 -0700 (PDT)
X-Received: by 2002:a05:622a:110:: with SMTP id u16mr2749894qtw.254.1616505598167;
        Tue, 23 Mar 2021 06:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616505598; cv=none;
        d=google.com; s=arc-20160816;
        b=dspfz/n7G1t99M7iKYkG4ausQXlwk0irOxQmwc+q7aYY+ld2jLwiV0aJTZCEECzqRt
         o9e2R312aWj9skWra/F2joNegaaiYZCHy69QmTD9grcHdK2EPeflQ2DAWlDiAxctWXRf
         LpTcJQ1aAGtWQntgkMUEl0gynlHOsOx7qcl+/XeMYJPZxhj6T10m8x1AT+E37bcqVQyy
         IuUehdOSK4sY2dNkSSJGCbbdkoE0C67XbPxV3exrU/yyk25gYNeLVG1+X9hLmfa9vKz2
         O2VbIuwsqSJd4cKsJaGrWW0WOmFrdA8CT+x1p6RCBbzF+avk/cccjIhG8GcSNtiVXmVw
         Z4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :list-id:to:from:dkim-signature;
        bh=QM6KtXQPgLI75/QT/i6iEQpYREzisY3Mz9JnKAg8Lq8=;
        b=FtXDJl/NvVVF9jsF/feV9kp7s17tDonjffuXbUNlRU9rEjPJzi1hATsv9mbzM6fOwK
         mmtsN+JidGpRrSCPlrsqOirKlWcJ+6CKD59ghrVyoXNa2NZwTcIUssVFvMN08dIR76Dt
         648pDoon4uW5eFfxLhlEsd+X6oqzVmsdCe1E/hxbPXilSL0j/GY5vksADsDocea/2FKn
         KVM141V+6UPvpqLRnRNKSLZAAuOXhSYqdfVsZ/rSTP4uC7AMXsTaQxPvo9EMwqRbuh2p
         uTGZkO8dagVV/AI+n8kYLklm789QxB0rufWecz92naJcHNxwpg+zj1bxnxRKUhk2wPNM
         6ngA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=iueD3kIy;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id b4si1007007qkh.2.2021.03.23.06.19.58
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 06:19:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9652761878;
	Tue, 23 Mar 2021 13:19:54 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: [PATCH] ARM: mvebu: avoid clang -Wtautological-constant warning
Date: Tue, 23 Mar 2021 14:19:42 +0100
Message-Id: <20210323131952.2835509-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Original-Sender: arnd@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=iueD3kIy;       spf=pass
 (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted
 sender) smtp.mailfrom=arnd@kernel.org;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Arnd Bergmann <arnd@arndb.de>

Clang warns about the comparison when using a 32-bit phys_addr_t:

drivers/bus/mvebu-mbus.c:621:17: error: result of comparison of constant 4294967296 with expression of type 'phys_addr_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
                if (reg_start >= 0x100000000ULL)

Add a cast to shut up the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/bus/mvebu-mbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index dd9e7343a5e3..ea0424922de7 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -618,7 +618,7 @@ mvebu_mbus_find_bridge_hole(uint64_t *start, uint64_t *end)
 		 * This part of the memory is above 4 GB, so we don't
 		 * care for the MBus bridge hole.
 		 */
-		if (reg_start >= 0x100000000ULL)
+		if ((u64)reg_start >= 0x100000000ULL)
 			continue;
 
 		/*
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210323131952.2835509-1-arnd%40kernel.org.
