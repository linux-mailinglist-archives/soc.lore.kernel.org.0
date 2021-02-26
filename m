Return-Path: <clang-built-linux+bncBAABBXGK4SAQMGQERA7XSKQ@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-vs1-xe40.google.com (mail-vs1-xe40.google.com [IPv6:2607:f8b0:4864:20::e40])
	by mail.lfdr.de (Postfix) with ESMTPS id 014FE3265C3
	for <lists+clang-built-linux@lfdr.de>; Fri, 26 Feb 2021 17:44:14 +0100 (CET)
Received: by mail-vs1-xe40.google.com with SMTP id x1sf894337vso.14
        for <lists+clang-built-linux@lfdr.de>; Fri, 26 Feb 2021 08:44:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1614357853; cv=pass;
        d=google.com; s=arc-20160816;
        b=0kNoBTDIG17Ya8OjEyTB5Y3hiXH/p3LIJI9aQN7SM/tOKAoGydkRV6KVx7HnAVd2b/
         yxcGnm8yR4Xdp5gv/vXVcgP0dwtOkgLzn35JVHB7qPUKr3kexhJk1g6dFjeQmtrGEAfx
         8OgZ7gR9C63oVnPHI+RiEuIog4ee/h/THRdTKCYnyAkOxurqo3/Rh+tW5W6Fde4iXSN2
         iDMnCom4OGVnydFMvVu9Tf8zsgw3XXRgxSeM3ssC1ciuMSr61spgTaYa0bjGg8M+LUXe
         MjRrOpeSZMKzEN7nJSlZf0NCVbItcO9CYzKq95qOGuuNt3KeZwtvY1Gt+4WuUKGMO3G9
         qVEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:list-id:to:from:sender
         :dkim-signature;
        bh=xGMPkeeZzok312XvVjyRUr41FKMJ/MQ6R2UItB8ADns=;
        b=C2zRvccAvb0rk+qCy3ZJjIe8fYKdww5Pvpx+EQil5cgoNXmOkZ2TuSePlIQIeHwwto
         DN2itJpIwMlcy8oO1uNBwPhqSUa0ERQTXu2g7HLGGEPPygxbz1WKQWnWw/05h4GUIpaU
         cocKZ3kdQTQaeSkgt3RAfiC8+aZXu0zu2POpPT8ioE10NiLDBPacxAJcCGTvI41D3TDq
         OXTPHyz4aiBH93uqR5ghLcTOL0wwYrvPIRinuM/dTfe7iZ1lvCPA7JGWHXqxjAfJkzv4
         1u4yXBdo2sfYNZeD5ynj12BGARq2+K9DicZUl+trkRtmCWV5eZajfHvskO7idjs50JW5
         6IEQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=CXuh0VwW;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:list-id:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results;
        bh=xGMPkeeZzok312XvVjyRUr41FKMJ/MQ6R2UItB8ADns=;
        b=l6uIvHap4SklI4KpSHIq06bdn465dFWnv28yz60CBkFCb/Acx5HQRL4O9VuJTTZ2mI
         V1ZtuVO2TByTVkAa4WLfDsLwABPOxSo86K9mEKY8OeU0869blY49ePLEh0BE168jxfyi
         nSELccuz+N8M2Q/fH8oAevl1nN+QD3KEgkpHVSDuKihgHgGEO3WrvVvwlHQZm3BKJ3Gj
         N/rzHl5rpPXMRukSGULZQX8ibi+8LQAIRPGvjhbztFwzQE0S+U+j4oksmCj0h7WCmbRz
         8UdkzlxcgQLzseA87U0UfFKlQAsq1TrYrNqvpJtLkcE6lvfA2UjeuChPqVRxeHcijyYW
         mxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:list-id:cc:subject:date
         :message-id:mime-version:x-original-sender
         :x-original-authentication-results;
        bh=xGMPkeeZzok312XvVjyRUr41FKMJ/MQ6R2UItB8ADns=;
        b=omFgmM8fpYG0Mco9ZAMp3Mj1nyFKhlWakE/WgjPCFUH8EFTOU/MeQwhpNAK3O7/IoP
         cODfurWoXsq/JtQOq8bDRZYa/GZ1vhbNcznXGI0tc6KXyrAmlvHN9iK+3RUULTkZqWeB
         3R4god7ZnzIBc0YJlUYmPzbyIw3YDo2rrV32dItotZ0VPXqge1b6rS8aNRqdiXQ1oh5z
         IHQ0+myS9qlaww0ivEEaBNXfJQwN0Cqz1UxSDdfg/pfP0BPdCcE0eZ1xNQ2IxOURrXrN
         z6rhNDyNu6bg+xXg/GknUnvlUKJdDPr95IU76qrKgE1wHrtzTGdRVWp5a+mAXqoKQxsh
         AVVw==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM531qa4RW8FW3b94nuBBAyXxQhyjYUsBLUS4fw/0/p0han26s56Wm
	FsB4cWZtiJ8ub3T4tldqoAg=
X-Google-Smtp-Source: ABdhPJxkH7WnSN6xwVF86dcHsR97gQ2BMmJ5JTjVsGutqtpND9im/xmESCVemfbl/NEKaqREx/wP/g==
X-Received: by 2002:a05:6102:40f:: with SMTP id d15mr1719957vsq.49.1614357852952;
        Fri, 26 Feb 2021 08:44:12 -0800 (PST)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:ab0:64d0:: with SMTP id j16ls763331uaq.11.gmail; Fri, 26 Feb
 2021 08:44:12 -0800 (PST)
X-Received: by 2002:a9f:2431:: with SMTP id 46mr2408784uaq.55.1614357852494;
        Fri, 26 Feb 2021 08:44:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614357852; cv=none;
        d=google.com; s=arc-20160816;
        b=maHoV1TWXso1G1vgurt5sP1C/78dyc54wpHsJc8IqwmM58HFMMOD51JjvgxtJzuSx0
         2wbZED+nmdCH0KUPKyq9+LZu0FxgCqvfOGp07LNF00LF5YvNT09z8kXbRIxndIYJNbGu
         fuwQqbBMokm4eLl+dn/wTrtKHWR9fJgOknuZH1vUm3rrYG70kTyzs1AIbVoEIbJ3VLzM
         By0z1L1fiDqrlM5WqnjVUE7d5FxT5+qx6x5I+ulkHdXkhDx/1pKs7ZOSEFWWzaUPJPzt
         pekpGfR4HAc8T63WPogx66QLk7GhwC5KLvVAhPSR9A/fpT8dR/Lk/0mAwvwNEqoqMZ5x
         iz0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :list-id:to:from:dkim-signature;
        bh=kun5euwCQSzOTxZ8y3RT85zW40gVWoxUzJhGD4Ty95w=;
        b=NgRcyjmMuMrP+0VoGjbJNEccR1eU9j7zZZJIDpoDYT+lmoBvrAZzfSqdRNI64nRZxs
         ZNOv8RQICpxzRBA4vJD7FaaGW3M+0s1mBJ92EZYzDYMBDtm7Y3GAXEnGtqzXPpS8A0v7
         q6OMCFtQa+xEkKJFGlagGiaMDYZmCJObPLyfTO4LoGt0j5THR8a/Ox6tPaDczbIkOgnj
         TOSZai9IpPEV/GSBx/VF5Ja5YjTNCjokPUiZHesQ0wTkuOvw7P1TbuGVRK5i2HbHKIm0
         HxfClQEsr8FLWLyrQDUdfwzMQt4NQHh80rGujTN7Mix5qniVODrtaA2wda7mpsITtjwY
         IPWA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=CXuh0VwW;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id a136si344275vki.0.2021.02.26.08.44.12
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Feb 2021 08:44:12 -0800 (PST)
Received-SPF: pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id 873D664F0D;
	Fri, 26 Feb 2021 16:44:08 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
To: Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: [PATCH] ARM: ep93xx: don't use clang IAS for crunch
Date: Fri, 26 Feb 2021 17:43:31 +0100
Message-Id: <20210226164345.3889993-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Original-Sender: arnd@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=CXuh0VwW;       spf=pass
 (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted
 sender) smtp.mailfrom=arnd@kernel.org;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Arnd Bergmann <arnd@arndb.de>

Randconfig builds with ep93xx fail with the clang integrated
assembler that does not understand the maverick crunch extensions:

arch/arm/mach-ep93xx/crunch-bits.S:94:2: error: invalid instruction
 cfstr64 mvdx0, [r1, #0] @ save 64b registers

It is unclear if anyone is still using support for crunch: gcc-4.8 dropped
it in 2012 when it was already too broken to be used reliabled. glibc
support existed as an external patch but was never merged upstream.
We could consider removing the last bits of the kernel support as well.

Turn off the integrated assembler for this file for now.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-ep93xx/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-ep93xx/Makefile b/arch/arm/mach-ep93xx/Makefile
index 86768495f61d..f686577ba059 100644
--- a/arch/arm/mach-ep93xx/Makefile
+++ b/arch/arm/mach-ep93xx/Makefile
@@ -7,7 +7,7 @@ obj-y			:= core.o clock.o timer-ep93xx.o
 obj-$(CONFIG_EP93XX_DMA)	+= dma.o
 
 obj-$(CONFIG_CRUNCH)		+= crunch.o crunch-bits.o
-AFLAGS_crunch-bits.o		:= -Wa,-mcpu=ep9312
+AFLAGS_crunch-bits.o		:= -Wa,-mcpu=ep9312 $(cc-option, -fno-integrated-as)
 
 obj-$(CONFIG_MACH_ADSSPHERE)	+= adssphere.o
 obj-$(CONFIG_MACH_EDB93XX)	+= edb93xx.o
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210226164345.3889993-1-arnd%40kernel.org.
