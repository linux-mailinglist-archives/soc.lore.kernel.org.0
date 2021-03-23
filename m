Return-Path: <clang-built-linux+bncBAABBHGV46BAMGQETTOOOZA@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-pg1-x540.google.com (mail-pg1-x540.google.com [IPv6:2607:f8b0:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AC7345F6F
	for <lists+clang-built-linux@lfdr.de>; Tue, 23 Mar 2021 14:18:21 +0100 (CET)
Received: by mail-pg1-x540.google.com with SMTP id h8sf1814174pgd.8
        for <lists+clang-built-linux@lfdr.de>; Tue, 23 Mar 2021 06:18:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616505500; cv=pass;
        d=google.com; s=arc-20160816;
        b=L6UgzP379b/6pU3Ygazm0mRBKwYo0hvmaXJ36/SX0tDyYtwL/fToURRRn8sxc8QE6f
         AOdn+H3GufYXv8xksLItpUVSRiX0f4xZ2PxBFqDAKc4DvV2xgL05DpthzHdQyujumssp
         BI6jO8FFs+ReTa+1KFyMmq7qK0f2OPVanSINug2NCktv9ZzaSVHitalzF3UuH0cKvvp0
         Pdb2k5Y9L306r8iZJdUij9BZYyZshDbsw06vnBPTp1gCD8kdwVP06BoLxKHOHwOvcVfg
         F080sFIoB6IgumyORCOtocduuyA2KeFcC9j7C26NeoD/qtC9ETiKavDuXYF4j1Xw3auM
         yH8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:list-id:to:from:sender
         :dkim-signature;
        bh=buwgSqtD7aDmaeXbdQC+CUyJAwXA+eUUMwIHYeKAY3Q=;
        b=t7WOFyHUxNe4WEudSLuSDFDcZoyHSbAsoeOjRgFavvoOmlENH2f+yNTjrJeeDgo++Y
         xRHhnk71MQHZQBsNPSw7354013I0SuXRvgxJ09cI/Xlm32dgMx1X4abDqCBRyL5jZY9v
         O9/hLMiLZ2oC+HblPxkQNE78ISbrrQt1hsGIOQePMyJC43/WOLFvkj7H705Soc2sW4Fa
         bACxKl1oFo5Kf4ekTCxeax51c5yVchvGqKbwZbeLooWygYV18sIMKqjIfAe6n2eupMTN
         PRO0RZW81uJM9aCtE4Rhpp8+b8F4G/HjbEnd6xGAe25tL24wpKVe1LuC2EHAppMo5oB+
         0UaQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=o38ISwQi;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:list-id:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results;
        bh=buwgSqtD7aDmaeXbdQC+CUyJAwXA+eUUMwIHYeKAY3Q=;
        b=e1z0GYfqxt82FOx/ddOmrnonksxrzdz02I4aLZ9VLfXJl2TwdC0NhoBuMrFHaLbF6Y
         Yi7Tk5Aks7SiM9a1Bm0FfhjSbu4mj6fplbcQ9o8tufzyDNnwFGFaTfBQoPyBQM7unzcN
         XRGJctUhvoVMwlyt3YlgWriou16nT2uVww76ILyPfWr6v0iM4hNi60zhnnqCujPiHLqO
         qaHULWJ3pd9LBw1GZRkzg27pwl4eaZxSHYPS/bJOI0Y5BJmxHlbTtg7Ljb9VY2NrJbAY
         Yw5ZVjuaa3l6+4+XUixDp9W75SLkf7iXepvsKqWy78/huTVITrAFgRjiLeoHbADhaSRc
         Rh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:list-id:cc:subject:date
         :message-id:mime-version:x-original-sender
         :x-original-authentication-results;
        bh=buwgSqtD7aDmaeXbdQC+CUyJAwXA+eUUMwIHYeKAY3Q=;
        b=ul6ZeXePHyZsWNRI/s+CiB9bzz38swKTPHMOPg4BtaSIOc0E3ZG8wKMqO1dWvRlAD9
         Db89XVdSrQtzOJesNY0ZSU6zrQk3kb1tIo4Q7nu94wXSVxI1IqCb5Fv44LdWAV6YaUYd
         5Wx885Al7UHXiD2aQksVSwLOpDF+kg6Fs8yDxAdfigYFw8aQovdQwVb68Qy48sKAtIL3
         cfDDFdFaYQqvVrpptrUrGsdd29+UsRqQYxujd8/9QastQrTbCf7CmCCm0+HsxCTBLAUW
         lNGcAVjiqAPnwjfZ1tAMbJO3g7dRur+A8BEt2BMCLZJyiPt3C7jfhnLmb7FJH9/KQ6tb
         s6eg==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM531xuLZYrsvNU+GLbwD3SwZf+lpnxRV1nCGsLkUBkoIuhnUAR3cC
	I9iqJgyG4S2dhs34vOJt/cU=
X-Google-Smtp-Source: ABdhPJzdhVil45I19rBoTje8Zl5rmdXM1c8VgCpTspbLr7urLbU7Pffzxiqi05oQ66Xu0aOUh67sIA==
X-Received: by 2002:a63:e20b:: with SMTP id q11mr4046452pgh.396.1616505500199;
        Tue, 23 Mar 2021 06:18:20 -0700 (PDT)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:a17:902:a507:: with SMTP id s7ls8616846plq.3.gmail; Tue, 23
 Mar 2021 06:18:19 -0700 (PDT)
X-Received: by 2002:a17:90a:eac7:: with SMTP id ev7mr4548115pjb.158.1616505499815;
        Tue, 23 Mar 2021 06:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616505499; cv=none;
        d=google.com; s=arc-20160816;
        b=ZOeTUWmWMxOJiNNtTN1z5bI/El6308l3TwhvF8us3Bb/nPITTs/Z+OngctM6eQifVR
         k2YmGfYIcz+a6gHsIB5in4wPbOmqKorLrBFhn9NDqp984qSEn0YpeZ0aJFMxQUVDoSPC
         Hq/HxIHoWKPlu5b9BnYWdJvK6pue/99NwergtKYtqoDd8HB3UmtfPxqqJcD+NelnUobV
         ct3uXG4g1PcFeYbPXnaTkywfb6AtmHIs9bNCt3gaWDm/2K25p8quR4b3Ye9lkY4XFv8C
         AG3Zzg8Ce3xuaFURNIUN2VoeROuelOotjlmLVI74UCBHzgxyMUVjuej+bfDfMTSzOatn
         s/xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :list-id:to:from:dkim-signature;
        bh=d20PUad9R3aT0FAWxKBo+uLFMUkYW9g5/xIMs5C1iUA=;
        b=TRGnYjU66PI8LlMZagdwq0u62SGc538YShNt/wCld/gKBYeXS7PS+QAgw0Kw3hp+sY
         tF8JiwSzJNZojN1RC5xLBXH+9dP+PT/pfq81w0Dh6VAE1fQ/QHXE+T+73BnuzaAPE5Vg
         8EX5Jw6gr4f5/Gpizvv+s0p3RjJr4qIqtimK5rrO+J0G86PeBcWUlA/Qz2DVmQrImDus
         T6IKNSe3BlDK0g7PuX40fT1OStYRCViNcttbDYeTARnLI0nPcIJu9/l2E7VWjKb9oReA
         kuYjXzNMsGGQshFBNvTyLxnu8QrUYxUjbI+Vl65gnQ+bblHuEpvF58GqXuofSQ215kzo
         BWuA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=o38ISwQi;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id nl15si57556pjb.2.2021.03.23.06.18.19
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 06:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id E26CF619BD;
	Tue, 23 Mar 2021 13:18:16 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Robin Murphy <robin.murphy@arm.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Maxime Ripard <maxime@cerno.tech>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: [PATCH] ARM: keystone: fix integer overflow warning
Date: Tue, 23 Mar 2021 14:18:05 +0100
Message-Id: <20210323131814.2751750-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Original-Sender: arnd@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=o38ISwQi;       spf=pass
 (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted
 sender) smtp.mailfrom=arnd@kernel.org;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Arnd Bergmann <arnd@arndb.de>

clang warns about an impossible condition when building with 32-bit
phys_addr_t:

arch/arm/mach-keystone/keystone.c:79:16: error: result of comparison of constant 51539607551 with expression of type 'phys_addr_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
            mem_end   > KEYSTONE_HIGH_PHYS_END) {
            ~~~~~~~   ^ ~~~~~~~~~~~~~~~~~~~~~~
arch/arm/mach-keystone/keystone.c:78:16: error: result of comparison of constant 34359738368 with expression of type 'phys_addr_t' (aka 'unsigned int') is always true [-Werror,-Wtautological-constant-out-of-range-compare]
        if (mem_start < KEYSTONE_HIGH_PHYS_START ||
            ~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~

Change the temporary variable to a fixed-size u64 to avoid the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-keystone/keystone.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-keystone/keystone.c b/arch/arm/mach-keystone/keystone.c
index cd711bfc591f..2c647bdf8d25 100644
--- a/arch/arm/mach-keystone/keystone.c
+++ b/arch/arm/mach-keystone/keystone.c
@@ -65,7 +65,7 @@ static void __init keystone_init(void)
 static long long __init keystone_pv_fixup(void)
 {
 	long long offset;
-	phys_addr_t mem_start, mem_end;
+	u64 mem_start, mem_end;
 
 	mem_start = memblock_start_of_DRAM();
 	mem_end = memblock_end_of_DRAM();
@@ -78,7 +78,7 @@ static long long __init keystone_pv_fixup(void)
 	if (mem_start < KEYSTONE_HIGH_PHYS_START ||
 	    mem_end   > KEYSTONE_HIGH_PHYS_END) {
 		pr_crit("Invalid address space for memory (%08llx-%08llx)\n",
-		        (u64)mem_start, (u64)mem_end);
+		        mem_start, mem_end);
 		return 0;
 	}
 
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210323131814.2751750-1-arnd%40kernel.org.
