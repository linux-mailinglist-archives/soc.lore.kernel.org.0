Return-Path: <clang-built-linux+bncBAABBZ72T6EAMGQE3O5U3DQ@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-vs1-xe3f.google.com (mail-vs1-xe3f.google.com [IPv6:2607:f8b0:4864:20::e3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 421FE3DDA4A
	for <lists+clang-built-linux@lfdr.de>; Mon,  2 Aug 2021 16:12:57 +0200 (CEST)
Received: by mail-vs1-xe3f.google.com with SMTP id p13-20020a67a60d0000b02902a88e22a5e8sf2963045vse.14
        for <lists+clang-built-linux@lfdr.de>; Mon, 02 Aug 2021 07:12:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627913576; cv=pass;
        d=google.com; s=arc-20160816;
        b=CSWRFqOMzOYKD26jYpNarJSLCVDPNX3QN7w1mFb1AoIiVklcw7NqkA0SGKBvPWbAdu
         5nrkvdBqabtEZFkYLKa4cIwqmy1wh4o1q51LVvxMLKpm4sZmvEzVpCck0j1gyik2pI+2
         mfaXVHncJCyXp56IpjIkRNYeWfBKCeIES8FcRIWct2P2s99aON6vV4q4jxoJG/7/ufOn
         Hv4zFsx3BHrKlWn2+02+I4dvnaaNcHuFigIgcWRhxAPSLP4ex/DIiWAaqkdH5extthG3
         s7jgoHRDR/B6SlPPlTILowlIBOmwPLJez7x/8mwMBpejVXWC281kfzAJyZBIAhQyD2+y
         g+TQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:list-id:to:from:sender
         :dkim-signature;
        bh=cd+zZtkQo23xXtzIs+qGu+huTOffgYEtWcEp4L8+DZk=;
        b=f6gQb0JvsZ7sl0HLYx85HtgVgGZqa2SUEmGykXxZ4zlweRZtkUS91e899yC8cx6vys
         0PZwyDA4HgQw4c6ut40X0791wDByU9V2uo8SszNYeSi4Np0nSvQh6aUyE6p8edLvXQnS
         cPW0qpEl2Sr8TCSBiJcmSuvUg8+Tjl7FjX2boR7RmaH60CmRNNR8l+e2VWEQlJjhxWEX
         A0MVJwQAGmDyEW4CMIAw60vmaIJEENWntwmJjIVB2i3cf9iLgISse5BDBaTB3zW3GjaL
         l7702W5DyfYvNS7s1oSuCwKKfjydHfPdp+f7/y3jisMgmCxOiPSBHxhWPPg/zeTWSe/x
         Ivqg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="DQvTT/zV";
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:list-id:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results;
        bh=cd+zZtkQo23xXtzIs+qGu+huTOffgYEtWcEp4L8+DZk=;
        b=swN8g/sfpLkzV8lv26HGzgcFSwAtXmS0NJP2ZmF8VsLIWBR7cyeYbaXtJjeXdLISL/
         sPWPT6/GVYrlGJXWZMeRYWcxbTIRSAqeSS83xlBm6QUDfULcC2U3QXB3MnVY1KIgzE17
         +U/IjnHENiRQ+hNLIDjMC4zh54XSeXZ46OozGEynufmd220F3VKcFSvecz81BW9c27yR
         94vquxxjYM5pN/ybHMkD3DGuSgP0xvgd+hFi42vGSBOwGfF/XLN+CY/iPkHH8McKNBv5
         H6oLrA4ev3xwtmznneC4haH4ZnW+nDzGJE56sGvfoGxgS1abdmtuvBYcexep24ewRzBx
         d3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:list-id:cc:subject:date
         :message-id:mime-version:x-original-sender
         :x-original-authentication-results;
        bh=cd+zZtkQo23xXtzIs+qGu+huTOffgYEtWcEp4L8+DZk=;
        b=M1m8lQwb5b7P80Rqr1hHdDMTp1bedCP5AjFE+zJ3KJo6wIYbnLU+askS3gHUj3WQaE
         9Bk39AT3+DvYwEMxxcOwxZlj5VZwvsLySix07fR9CEZJB4UQydzj4dytwOtlhyW9N2m8
         Z+3G/uC/ZjaSq1XeQYXdMD+Na9fqCXVMT2ahT9cKMkQ6FegGFZcN6VxetAzOETeWQuLH
         T/WPnY4iuq2bLRaJxM3dJZ3NsNmoQfKxbfx+k0FrPGa//4bPSrgViW8GITWhgC+YwDOe
         J813N2KOkBfn3rFgv1GZnb8aqeEhXFXz8MmyQLqT8HKm8OVkX3UvPZkTDBBNsCQ9N5c/
         6y4g==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM5310YF5vc4lgtOqycUsnNXatEAbNDhtm9Q6TsyQGIRF42NBi2jku
	ljEBp7Czex7VH87/q/0/RFQ=
X-Google-Smtp-Source: ABdhPJygKfZR659thEk+V7MEVgAO61kcdzMR98YrZgUshCakChbfGjmgJ1JWANkZIt7o/rGmtaV3ag==
X-Received: by 2002:a05:6102:21b:: with SMTP id z27mr10058539vsp.18.1627913575985;
        Mon, 02 Aug 2021 07:12:55 -0700 (PDT)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:a67:ec03:: with SMTP id d3ls1792178vso.1.gmail; Mon, 02 Aug
 2021 07:12:55 -0700 (PDT)
X-Received: by 2002:a05:6102:34e2:: with SMTP id bi2mr8793801vsb.36.1627913575287;
        Mon, 02 Aug 2021 07:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627913575; cv=none;
        d=google.com; s=arc-20160816;
        b=lTdtZBcyCYPO2zLxA06O45oJHV1D9sY0DX/4+oinbQ8yFsAjN+xDvMsCBGfr6FPgPY
         FnrCFts62vppuE87Z1PrxHPzp+M6o/GV8FSCetm/JzbR0IyRcAAyS5FFK/WPxkqsPA4y
         x5JtFsDAz3Ltk45cMsohnmA+IcufHOk+iucGQWfjBCJ/f2DRbKDzGPk41H2sOZtTiD4S
         kLC1HlItt7W3WlNgApZaWvQP9RWpsV9J2rV8NGF4PeG6uMNdMSCVbuMcCCOs/AziUV2t
         qpzuF8dHGs3GrDkkIv49PwOTsOD0YbnWN+084lZWRgFQYYH6V2DScWCB31B89mvLopxy
         bn3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :list-id:to:from:dkim-signature;
        bh=ikpKBuo2EKEPEjpKu3XazJEZAyBGBu2sDV2bPwHBjks=;
        b=rk5gEJ4ATnVVQRxD1HyyzllGBoog/NNAt6O2YD3cqBmgYaYTR3Wt/X2ICM3hGWwOWe
         SSfgks9Ww9BPNYGHZKoRH4IzWcUxVSxh5qDZfUNIKlWIcpYWXbOUQaocNEpSrEh0mw8N
         KhSguv+ZFwcmCi7VOstlmQ1ugT1yVm7unEFdrxJthDusC3bjNs8nbB+yCCldHgV/Azgx
         ExYCqpLqJljEoNt2q2OwyrGTdUu+Zj51woZTYycT+PHRtka395d4kLYYpN33V+zXML4R
         CKOZiszhcxtrAAVo0lJSlepYL/VBxBj3hNL0JjF+XOoj1Uq64yhJihCpJuuQ07s02k7q
         kYRg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="DQvTT/zV";
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id m38si89922vkf.5.2021.08.02.07.12.55
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Aug 2021 07:12:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27CB460F6D;
	Mon,  2 Aug 2021 14:12:49 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Arnd Bergmann <arnd@arndb.de>,
	"Martin Guy" <martinwguy@martinwguy@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Hubert Feurstein <hubert.feurstein@contec.at>,
	Lukasz Majewski <lukma@denx.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: [PATCH] ARM: ep93xx: remove MaverickCrunch support
Date: Mon,  2 Aug 2021 16:11:10 +0200
Message-Id: <20210802141245.1146772-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Original-Sender: arnd@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b="DQvTT/zV";       spf=pass
 (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted
 sender) smtp.mailfrom=arnd@kernel.org;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Arnd Bergmann <arnd@arndb.de>

The MaverickCrunch support for ep93xx never made it into glibc and
was removed from gcc in its 4.8 release in 2012. It is now one of
the last parts of arch/arm/ that fails to build with the clang
integrated assembler, which is unlikely to ever want to support it.

The two alternatives are to force the use of binutils/gas when
building the crunch support, or to remove it entirely.

According to Hartley Sweeten:

 "Martin Guy did a lot of work trying to get the maverick crunch working
  but I was never able to successfully use it for anything. It "kind"
  of works but depending on the EP93xx silicon revision there are still
  a number of hardware bugs that either give imprecise or garbage results.

  I have no problem with removing the kernel support for the maverick
  crunch."

Unless someone else comes up with a good reason to keep it around,
remove it now. This touches mostly the ep93xx platform, but removes
a bit of code from ARM common ptrace and signal frame handling as well.

If there are remaining users of MaverickCrunch, they can use LTS
kernels for at least another five years before kernel support ends.

Link: https://lore.kernel.org/linux-arm-kernel/20210226164345.3889993-1-arnd@kernel.org/
Link: https://github.com/ClangBuiltLinux/linux/issues/1272
Link: https://gcc.gnu.org/legacy-ml/gcc/2008-03/msg01063.html
Cc: "Martin Guy" <martinwguy@martinwguy@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I was reminded that this is still in my backlog of patches.

Russell, if you don't see any problems with the
arch/arm/{include,kernel}/ bits, I'd apply this to the soc tree
directly.

 arch/arm/configs/ep93xx_defconfig    |   1 -
 arch/arm/include/asm/fpstate.h       |   8 -
 arch/arm/include/asm/thread_info.h   |   8 -
 arch/arm/include/asm/ucontext.h      |  14 --
 arch/arm/include/uapi/asm/hwcap.h    |   2 +-
 arch/arm/include/uapi/asm/ptrace.h   |   4 +-
 arch/arm/kernel/asm-offsets.c        |   3 -
 arch/arm/kernel/entry-armv.S         |   6 -
 arch/arm/kernel/ptrace.c             |  36 ----
 arch/arm/kernel/signal.c             |  42 ----
 arch/arm/mach-ep93xx/Kconfig         |   5 -
 arch/arm/mach-ep93xx/Makefile        |   3 -
 arch/arm/mach-ep93xx/adssphere.c     |   1 -
 arch/arm/mach-ep93xx/core.c          |   5 -
 arch/arm/mach-ep93xx/crunch-bits.S   | 310 ---------------------------
 arch/arm/mach-ep93xx/crunch.c        |  86 --------
 arch/arm/mach-ep93xx/edb93xx.c       |   8 -
 arch/arm/mach-ep93xx/gesbc9312.c     |   1 -
 arch/arm/mach-ep93xx/micro9.c        |   4 -
 arch/arm/mach-ep93xx/platform.h      |   7 -
 arch/arm/mach-ep93xx/simone.c        |   1 -
 arch/arm/mach-ep93xx/snappercl15.c   |   1 -
 arch/arm/mach-ep93xx/ts72xx.c        |   2 -
 arch/arm/mach-ep93xx/vision_ep9307.c |   1 -
 arch/arm64/include/asm/hwcap.h       |   2 +-
 25 files changed, 4 insertions(+), 557 deletions(-)
 delete mode 100644 arch/arm/mach-ep93xx/crunch-bits.S
 delete mode 100644 arch/arm/mach-ep93xx/crunch.c

diff --git a/arch/arm/configs/ep93xx_defconfig b/arch/arm/configs/ep93xx_defconfig
index cd16fb6eb8e6..88d5ecc2121e 100644
--- a/arch/arm/configs/ep93xx_defconfig
+++ b/arch/arm/configs/ep93xx_defconfig
@@ -12,7 +12,6 @@ CONFIG_MODULE_FORCE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_ARCH_EP93XX=y
-CONFIG_CRUNCH=y
 CONFIG_MACH_ADSSPHERE=y
 CONFIG_MACH_EDB9301=y
 CONFIG_MACH_EDB9302=y
diff --git a/arch/arm/include/asm/fpstate.h b/arch/arm/include/asm/fpstate.h
index 9e2fe9ced084..ca42fd9ae0b3 100644
--- a/arch/arm/include/asm/fpstate.h
+++ b/arch/arm/include/asm/fpstate.h
@@ -77,14 +77,6 @@ union fp_state {
 
 #define FP_SIZE (sizeof(union fp_state) / sizeof(int))
 
-struct crunch_state {
-	unsigned int	mvdx[16][2];
-	unsigned int	mvax[4][3];
-	unsigned int	dspsc[2];
-};
-
-#define CRUNCH_SIZE	sizeof(struct crunch_state)
-
 #endif
 
 #endif
diff --git a/arch/arm/include/asm/thread_info.h b/arch/arm/include/asm/thread_info.h
index 70d4cbc49ae1..a02799bd0cdf 100644
--- a/arch/arm/include/asm/thread_info.h
+++ b/arch/arm/include/asm/thread_info.h
@@ -65,9 +65,6 @@ struct thread_info {
 	__u32			syscall;	/* syscall number */
 	__u8			used_cp[16];	/* thread used copro */
 	unsigned long		tp_value[2];	/* TLS registers */
-#ifdef CONFIG_CRUNCH
-	struct crunch_state	crunchstate;
-#endif
 	union fp_state		fpstate __attribute__((aligned(8)));
 	union vfp_state		vfpstate;
 #ifdef CONFIG_ARM_THUMBEE
@@ -107,11 +104,6 @@ static inline struct thread_info *current_thread_info(void)
 	((unsigned long)(task_thread_info(tsk)->cpu_context.r7))
 #endif
 
-extern void crunch_task_disable(struct thread_info *);
-extern void crunch_task_copy(struct thread_info *, void *);
-extern void crunch_task_restore(struct thread_info *, void *);
-extern void crunch_task_release(struct thread_info *);
-
 extern void iwmmxt_task_disable(struct thread_info *);
 extern void iwmmxt_task_copy(struct thread_info *, void *);
 extern void iwmmxt_task_restore(struct thread_info *, void *);
diff --git a/arch/arm/include/asm/ucontext.h b/arch/arm/include/asm/ucontext.h
index 5c5e62cb304b..4048c92d9c2b 100644
--- a/arch/arm/include/asm/ucontext.h
+++ b/arch/arm/include/asm/ucontext.h
@@ -43,17 +43,6 @@ struct ucontext {
  */
 #define DUMMY_MAGIC		0xb0d9ed01
 
-#ifdef CONFIG_CRUNCH
-#define CRUNCH_MAGIC		0x5065cf03
-#define CRUNCH_STORAGE_SIZE	(CRUNCH_SIZE + 8)
-
-struct crunch_sigframe {
-	unsigned long	magic;
-	unsigned long	size;
-	struct crunch_state	storage;
-} __attribute__((__aligned__(8)));
-#endif
-
 #ifdef CONFIG_IWMMXT
 /* iwmmxt_area is 0x98 bytes long, preceded by 8 bytes of signature */
 #define IWMMXT_MAGIC		0x12ef842a
@@ -92,9 +81,6 @@ struct vfp_sigframe
  * one of these.
  */
 struct aux_sigframe {
-#ifdef CONFIG_CRUNCH
-	struct crunch_sigframe	crunch;
-#endif
 #ifdef CONFIG_IWMMXT
 	struct iwmmxt_sigframe	iwmmxt;
 #endif
diff --git a/arch/arm/include/uapi/asm/hwcap.h b/arch/arm/include/uapi/asm/hwcap.h
index b5971dfa4b8c..990199d8b7c6 100644
--- a/arch/arm/include/uapi/asm/hwcap.h
+++ b/arch/arm/include/uapi/asm/hwcap.h
@@ -15,7 +15,7 @@
 #define HWCAP_EDSP	(1 << 7)
 #define HWCAP_JAVA	(1 << 8)
 #define HWCAP_IWMMXT	(1 << 9)
-#define HWCAP_CRUNCH	(1 << 10)
+#define HWCAP_CRUNCH	(1 << 10)	/* Obsolete */
 #define HWCAP_THUMBEE	(1 << 11)
 #define HWCAP_NEON	(1 << 12)
 #define HWCAP_VFPv3	(1 << 13)
diff --git a/arch/arm/include/uapi/asm/ptrace.h b/arch/arm/include/uapi/asm/ptrace.h
index e61c65b4018d..8896c23ccba7 100644
--- a/arch/arm/include/uapi/asm/ptrace.h
+++ b/arch/arm/include/uapi/asm/ptrace.h
@@ -26,8 +26,8 @@
 #define PTRACE_GET_THREAD_AREA	22
 #define PTRACE_SET_SYSCALL	23
 /* PTRACE_SYSCALL is 24 */
-#define PTRACE_GETCRUNCHREGS	25
-#define PTRACE_SETCRUNCHREGS	26
+#define PTRACE_GETCRUNCHREGS	25 /* obsolete */
+#define PTRACE_SETCRUNCHREGS	26 /* obsolete */
 #define PTRACE_GETVFPREGS	27
 #define PTRACE_SETVFPREGS	28
 #define PTRACE_GETHBPREGS	29
diff --git a/arch/arm/kernel/asm-offsets.c b/arch/arm/kernel/asm-offsets.c
index 70993af22d80..64944701bf6a 100644
--- a/arch/arm/kernel/asm-offsets.c
+++ b/arch/arm/kernel/asm-offsets.c
@@ -63,9 +63,6 @@ int main(void)
 #ifdef CONFIG_IWMMXT
   DEFINE(TI_IWMMXT_STATE,	offsetof(struct thread_info, fpstate.iwmmxt));
 #endif
-#ifdef CONFIG_CRUNCH
-  DEFINE(TI_CRUNCH_STATE,	offsetof(struct thread_info, crunchstate));
-#endif
 #ifdef CONFIG_STACKPROTECTOR_PER_TASK
   DEFINE(TI_STACK_CANARY,	offsetof(struct thread_info, stack_canary));
 #endif
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 0ea8529a4872..241b73d64df7 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -618,15 +618,9 @@ call_fpe:
 	W(b)	do_fpe				@ CP#1 (FPE)
 	W(b)	do_fpe				@ CP#2 (FPE)
 	ret.w	lr				@ CP#3
-#ifdef CONFIG_CRUNCH
-	b	crunch_task_enable		@ CP#4 (MaverickCrunch)
-	b	crunch_task_enable		@ CP#5 (MaverickCrunch)
-	b	crunch_task_enable		@ CP#6 (MaverickCrunch)
-#else
 	ret.w	lr				@ CP#4
 	ret.w	lr				@ CP#5
 	ret.w	lr				@ CP#6
-#endif
 	ret.w	lr				@ CP#7
 	ret.w	lr				@ CP#8
 	ret.w	lr				@ CP#9
diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index 2771e682220b..b008859680bc 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -318,32 +318,6 @@ static int ptrace_setwmmxregs(struct task_struct *tsk, void __user *ufp)
 
 #endif
 
-#ifdef CONFIG_CRUNCH
-/*
- * Get the child Crunch state.
- */
-static int ptrace_getcrunchregs(struct task_struct *tsk, void __user *ufp)
-{
-	struct thread_info *thread = task_thread_info(tsk);
-
-	crunch_task_disable(thread);  /* force it to ram */
-	return copy_to_user(ufp, &thread->crunchstate, CRUNCH_SIZE)
-		? -EFAULT : 0;
-}
-
-/*
- * Set the child Crunch state.
- */
-static int ptrace_setcrunchregs(struct task_struct *tsk, void __user *ufp)
-{
-	struct thread_info *thread = task_thread_info(tsk);
-
-	crunch_task_release(thread);  /* force a reload */
-	return copy_from_user(&thread->crunchstate, ufp, CRUNCH_SIZE)
-		? -EFAULT : 0;
-}
-#endif
-
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 /*
  * Convert a virtual register number into an index for a thread_info
@@ -815,16 +789,6 @@ long arch_ptrace(struct task_struct *child, long request,
 			ret = 0;
 			break;
 
-#ifdef CONFIG_CRUNCH
-		case PTRACE_GETCRUNCHREGS:
-			ret = ptrace_getcrunchregs(child, datap);
-			break;
-
-		case PTRACE_SETCRUNCHREGS:
-			ret = ptrace_setcrunchregs(child, datap);
-			break;
-#endif
-
 #ifdef CONFIG_VFP
 		case PTRACE_GETVFPREGS:
 			ret = copy_regset_to_user(child,
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index a3a38d0a4c85..1162bea3d66f 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -25,40 +25,6 @@ extern const unsigned long sigreturn_codes[17];
 
 static unsigned long signal_return_offset;
 
-#ifdef CONFIG_CRUNCH
-static int preserve_crunch_context(struct crunch_sigframe __user *frame)
-{
-	char kbuf[sizeof(*frame) + 8];
-	struct crunch_sigframe *kframe;
-
-	/* the crunch context must be 64 bit aligned */
-	kframe = (struct crunch_sigframe *)((unsigned long)(kbuf + 8) & ~7);
-	kframe->magic = CRUNCH_MAGIC;
-	kframe->size = CRUNCH_STORAGE_SIZE;
-	crunch_task_copy(current_thread_info(), &kframe->storage);
-	return __copy_to_user(frame, kframe, sizeof(*frame));
-}
-
-static int restore_crunch_context(char __user **auxp)
-{
-	struct crunch_sigframe __user *frame =
-		(struct crunch_sigframe __user *)*auxp;
-	char kbuf[sizeof(*frame) + 8];
-	struct crunch_sigframe *kframe;
-
-	/* the crunch context must be 64 bit aligned */
-	kframe = (struct crunch_sigframe *)((unsigned long)(kbuf + 8) & ~7);
-	if (__copy_from_user(kframe, frame, sizeof(*frame)))
-		return -1;
-	if (kframe->magic != CRUNCH_MAGIC ||
-	    kframe->size != CRUNCH_STORAGE_SIZE)
-		return -1;
-	*auxp += CRUNCH_STORAGE_SIZE;
-	crunch_task_restore(current_thread_info(), &kframe->storage);
-	return 0;
-}
-#endif
-
 #ifdef CONFIG_IWMMXT
 
 static int preserve_iwmmxt_context(struct iwmmxt_sigframe __user *frame)
@@ -205,10 +171,6 @@ static int restore_sigframe(struct pt_regs *regs, struct sigframe __user *sf)
 	err |= !valid_user_regs(regs);
 
 	aux = (char __user *) sf->uc.uc_regspace;
-#ifdef CONFIG_CRUNCH
-	if (err == 0)
-		err |= restore_crunch_context(&aux);
-#endif
 #ifdef CONFIG_IWMMXT
 	if (err == 0)
 		err |= restore_iwmmxt_context(&aux);
@@ -321,10 +283,6 @@ setup_sigframe(struct sigframe __user *sf, struct pt_regs *regs, sigset_t *set)
 	err |= __copy_to_user(&sf->uc.uc_sigmask, set, sizeof(*set));
 
 	aux = (struct aux_sigframe __user *) sf->uc.uc_regspace;
-#ifdef CONFIG_CRUNCH
-	if (err == 0)
-		err |= preserve_crunch_context(&aux->crunch);
-#endif
 #ifdef CONFIG_IWMMXT
 	if (err == 0)
 		err |= preserve_iwmmxt_context(&aux->iwmmxt);
diff --git a/arch/arm/mach-ep93xx/Kconfig b/arch/arm/mach-ep93xx/Kconfig
index f2db5fd38145..15c68a646d51 100644
--- a/arch/arm/mach-ep93xx/Kconfig
+++ b/arch/arm/mach-ep93xx/Kconfig
@@ -9,11 +9,6 @@ config EP93XX_SOC_COMMON
 	select SOC_BUS
 	select LEDS_GPIO_REGISTER
 
-config CRUNCH
-	bool "Support for MaverickCrunch"
-	help
-	  Enable kernel support for MaverickCrunch.
-
 comment "EP93xx Platforms"
 
 config MACH_ADSSPHERE
diff --git a/arch/arm/mach-ep93xx/Makefile b/arch/arm/mach-ep93xx/Makefile
index 86768495f61d..cfad517fac46 100644
--- a/arch/arm/mach-ep93xx/Makefile
+++ b/arch/arm/mach-ep93xx/Makefile
@@ -6,9 +6,6 @@ obj-y			:= core.o clock.o timer-ep93xx.o
 
 obj-$(CONFIG_EP93XX_DMA)	+= dma.o
 
-obj-$(CONFIG_CRUNCH)		+= crunch.o crunch-bits.o
-AFLAGS_crunch-bits.o		:= -Wa,-mcpu=ep9312
-
 obj-$(CONFIG_MACH_ADSSPHERE)	+= adssphere.o
 obj-$(CONFIG_MACH_EDB93XX)	+= edb93xx.o
 obj-$(CONFIG_MACH_GESBC9312)	+= gesbc9312.o
diff --git a/arch/arm/mach-ep93xx/adssphere.c b/arch/arm/mach-ep93xx/adssphere.c
index 57cfd8ebe04f..8d5e349a7a6d 100644
--- a/arch/arm/mach-ep93xx/adssphere.c
+++ b/arch/arm/mach-ep93xx/adssphere.c
@@ -36,6 +36,5 @@ MACHINE_START(ADSSPHERE, "ADS Sphere board")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= adssphere_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
index 6fb19a393fd2..4659132a0509 100644
--- a/arch/arm/mach-ep93xx/core.c
+++ b/arch/arm/mach-ep93xx/core.c
@@ -1004,8 +1004,3 @@ void ep93xx_restart(enum reboot_mode mode, const char *cmd)
 	while (1)
 		;
 }
-
-void __init ep93xx_init_late(void)
-{
-	crunch_init();
-}
diff --git a/arch/arm/mach-ep93xx/crunch-bits.S b/arch/arm/mach-ep93xx/crunch-bits.S
deleted file mode 100644
index fb2dbf76f09e..000000000000
--- a/arch/arm/mach-ep93xx/crunch-bits.S
+++ /dev/null
@@ -1,310 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * arch/arm/kernel/crunch-bits.S
- * Cirrus MaverickCrunch context switching and handling
- *
- * Copyright (C) 2006 Lennert Buytenhek <buytenh@wantstofly.org>
- *
- * Shamelessly stolen from the iWMMXt code by Nicolas Pitre, which is
- * Copyright (c) 2003-2004, MontaVista Software, Inc.
- */
-
-#include <linux/linkage.h>
-#include <asm/ptrace.h>
-#include <asm/thread_info.h>
-#include <asm/asm-offsets.h>
-#include <asm/assembler.h>
-#include <mach/ep93xx-regs.h>
-
-/*
- * We can't use hex constants here due to a bug in gas.
- */
-#define CRUNCH_MVDX0		0
-#define CRUNCH_MVDX1		8
-#define CRUNCH_MVDX2		16
-#define CRUNCH_MVDX3		24
-#define CRUNCH_MVDX4		32
-#define CRUNCH_MVDX5		40
-#define CRUNCH_MVDX6		48
-#define CRUNCH_MVDX7		56
-#define CRUNCH_MVDX8		64
-#define CRUNCH_MVDX9		72
-#define CRUNCH_MVDX10		80
-#define CRUNCH_MVDX11		88
-#define CRUNCH_MVDX12		96
-#define CRUNCH_MVDX13		104
-#define CRUNCH_MVDX14		112
-#define CRUNCH_MVDX15		120
-#define CRUNCH_MVAX0L		128
-#define CRUNCH_MVAX0M		132
-#define CRUNCH_MVAX0H		136
-#define CRUNCH_MVAX1L		140
-#define CRUNCH_MVAX1M		144
-#define CRUNCH_MVAX1H		148
-#define CRUNCH_MVAX2L		152
-#define CRUNCH_MVAX2M		156
-#define CRUNCH_MVAX2H		160
-#define CRUNCH_MVAX3L		164
-#define CRUNCH_MVAX3M		168
-#define CRUNCH_MVAX3H		172
-#define CRUNCH_DSPSC		176
-
-#define CRUNCH_SIZE		184
-
-	.text
-
-/*
- * Lazy switching of crunch coprocessor context
- *
- * r10 = struct thread_info pointer
- * r9  = ret_from_exception
- * lr  = undefined instr exit
- *
- * called from prefetch exception handler with interrupts enabled
- */
-ENTRY(crunch_task_enable)
-	inc_preempt_count r10, r3
-
-	ldr	r8, =(EP93XX_APB_VIRT_BASE + 0x00130000)	@ syscon addr
-
-	ldr	r1, [r8, #0x80]
-	tst	r1, #0x00800000			@ access to crunch enabled?
-	bne	2f				@ if so no business here
-	mov	r3, #0xaa			@ unlock syscon swlock
-	str	r3, [r8, #0xc0]
-	orr	r1, r1, #0x00800000		@ enable access to crunch
-	str	r1, [r8, #0x80]
-
-	ldr	r3, =crunch_owner
-	add	r0, r10, #TI_CRUNCH_STATE	@ get task crunch save area
-	ldr	r2, [sp, #60]			@ current task pc value
-	ldr	r1, [r3]			@ get current crunch owner
-	str	r0, [r3]			@ this task now owns crunch
-	sub	r2, r2, #4			@ adjust pc back
-	str	r2, [sp, #60]
-
-	ldr	r2, [r8, #0x80]
-	mov	r2, r2				@ flush out enable (@@@)
-
-	teq	r1, #0				@ test for last ownership
-	mov	lr, r9				@ normal exit from exception
-	beq	crunch_load			@ no owner, skip save
-
-crunch_save:
-	cfstr64		mvdx0, [r1, #CRUNCH_MVDX0]	@ save 64b registers
-	cfstr64		mvdx1, [r1, #CRUNCH_MVDX1]
-	cfstr64		mvdx2, [r1, #CRUNCH_MVDX2]
-	cfstr64		mvdx3, [r1, #CRUNCH_MVDX3]
-	cfstr64		mvdx4, [r1, #CRUNCH_MVDX4]
-	cfstr64		mvdx5, [r1, #CRUNCH_MVDX5]
-	cfstr64		mvdx6, [r1, #CRUNCH_MVDX6]
-	cfstr64		mvdx7, [r1, #CRUNCH_MVDX7]
-	cfstr64		mvdx8, [r1, #CRUNCH_MVDX8]
-	cfstr64		mvdx9, [r1, #CRUNCH_MVDX9]
-	cfstr64		mvdx10, [r1, #CRUNCH_MVDX10]
-	cfstr64		mvdx11, [r1, #CRUNCH_MVDX11]
-	cfstr64		mvdx12, [r1, #CRUNCH_MVDX12]
-	cfstr64		mvdx13, [r1, #CRUNCH_MVDX13]
-	cfstr64		mvdx14, [r1, #CRUNCH_MVDX14]
-	cfstr64		mvdx15, [r1, #CRUNCH_MVDX15]
-
-#ifdef __ARMEB__
-#error fix me for ARMEB
-#endif
-
-	cfmv32al	mvfx0, mvax0			@ save 72b accumulators
-	cfstr32		mvfx0, [r1, #CRUNCH_MVAX0L]
-	cfmv32am	mvfx0, mvax0
-	cfstr32		mvfx0, [r1, #CRUNCH_MVAX0M]
-	cfmv32ah	mvfx0, mvax0
-	cfstr32		mvfx0, [r1, #CRUNCH_MVAX0H]
-	cfmv32al	mvfx0, mvax1
-	cfstr32		mvfx0, [r1, #CRUNCH_MVAX1L]
-	cfmv32am	mvfx0, mvax1
-	cfstr32		mvfx0, [r1, #CRUNCH_MVAX1M]
-	cfmv32ah	mvfx0, mvax1
-	cfstr32		mvfx0, [r1, #CRUNCH_MVAX1H]
-	cfmv32al	mvfx0, mvax2
-	cfstr32		mvfx0, [r1, #CRUNCH_MVAX2L]
-	cfmv32am	mvfx0, mvax2
-	cfstr32		mvfx0, [r1, #CRUNCH_MVAX2M]
-	cfmv32ah	mvfx0, mvax2
-	cfstr32		mvfx0, [r1, #CRUNCH_MVAX2H]
-	cfmv32al	mvfx0, mvax3
-	cfstr32		mvfx0, [r1, #CRUNCH_MVAX3L]
-	cfmv32am	mvfx0, mvax3
-	cfstr32		mvfx0, [r1, #CRUNCH_MVAX3M]
-	cfmv32ah	mvfx0, mvax3
-	cfstr32		mvfx0, [r1, #CRUNCH_MVAX3H]
-
-	cfmv32sc	mvdx0, dspsc			@ save status word
-	cfstr64		mvdx0, [r1, #CRUNCH_DSPSC]
-
-	teq		r0, #0				@ anything to load?
-	cfldr64eq	mvdx0, [r1, #CRUNCH_MVDX0]	@ mvdx0 was clobbered
-	beq		1f
-
-crunch_load:
-	cfldr64		mvdx0, [r0, #CRUNCH_DSPSC]	@ load status word
-	cfmvsc32	dspsc, mvdx0
-
-	cfldr32		mvfx0, [r0, #CRUNCH_MVAX0L]	@ load 72b accumulators
-	cfmval32	mvax0, mvfx0
-	cfldr32		mvfx0, [r0, #CRUNCH_MVAX0M]
-	cfmvam32	mvax0, mvfx0
-	cfldr32		mvfx0, [r0, #CRUNCH_MVAX0H]
-	cfmvah32	mvax0, mvfx0
-	cfldr32		mvfx0, [r0, #CRUNCH_MVAX1L]
-	cfmval32	mvax1, mvfx0
-	cfldr32		mvfx0, [r0, #CRUNCH_MVAX1M]
-	cfmvam32	mvax1, mvfx0
-	cfldr32		mvfx0, [r0, #CRUNCH_MVAX1H]
-	cfmvah32	mvax1, mvfx0
-	cfldr32		mvfx0, [r0, #CRUNCH_MVAX2L]
-	cfmval32	mvax2, mvfx0
-	cfldr32		mvfx0, [r0, #CRUNCH_MVAX2M]
-	cfmvam32	mvax2, mvfx0
-	cfldr32		mvfx0, [r0, #CRUNCH_MVAX2H]
-	cfmvah32	mvax2, mvfx0
-	cfldr32		mvfx0, [r0, #CRUNCH_MVAX3L]
-	cfmval32	mvax3, mvfx0
-	cfldr32		mvfx0, [r0, #CRUNCH_MVAX3M]
-	cfmvam32	mvax3, mvfx0
-	cfldr32		mvfx0, [r0, #CRUNCH_MVAX3H]
-	cfmvah32	mvax3, mvfx0
-
-	cfldr64		mvdx0, [r0, #CRUNCH_MVDX0]	@ load 64b registers
-	cfldr64		mvdx1, [r0, #CRUNCH_MVDX1]
-	cfldr64		mvdx2, [r0, #CRUNCH_MVDX2]
-	cfldr64		mvdx3, [r0, #CRUNCH_MVDX3]
-	cfldr64		mvdx4, [r0, #CRUNCH_MVDX4]
-	cfldr64		mvdx5, [r0, #CRUNCH_MVDX5]
-	cfldr64		mvdx6, [r0, #CRUNCH_MVDX6]
-	cfldr64		mvdx7, [r0, #CRUNCH_MVDX7]
-	cfldr64		mvdx8, [r0, #CRUNCH_MVDX8]
-	cfldr64		mvdx9, [r0, #CRUNCH_MVDX9]
-	cfldr64		mvdx10, [r0, #CRUNCH_MVDX10]
-	cfldr64		mvdx11, [r0, #CRUNCH_MVDX11]
-	cfldr64		mvdx12, [r0, #CRUNCH_MVDX12]
-	cfldr64		mvdx13, [r0, #CRUNCH_MVDX13]
-	cfldr64		mvdx14, [r0, #CRUNCH_MVDX14]
-	cfldr64		mvdx15, [r0, #CRUNCH_MVDX15]
-
-1:
-#ifdef CONFIG_PREEMPT_COUNT
-	get_thread_info r10
-#endif
-2:	dec_preempt_count r10, r3
-	ret	lr
-
-/*
- * Back up crunch regs to save area and disable access to them
- * (mainly for gdb or sleep mode usage)
- *
- * r0 = struct thread_info pointer of target task or NULL for any
- */
-ENTRY(crunch_task_disable)
-	stmfd	sp!, {r4, r5, lr}
-
-	mrs	ip, cpsr
-	orr	r2, ip, #PSR_I_BIT		@ disable interrupts
-	msr	cpsr_c, r2
-
-	ldr	r4, =(EP93XX_APB_VIRT_BASE + 0x00130000)	@ syscon addr
-
-	ldr	r3, =crunch_owner
-	add	r2, r0, #TI_CRUNCH_STATE	@ get task crunch save area
-	ldr	r1, [r3]			@ get current crunch owner
-	teq	r1, #0				@ any current owner?
-	beq	1f				@ no: quit
-	teq	r0, #0				@ any owner?
-	teqne	r1, r2				@ or specified one?
-	bne	1f				@ no: quit
-
-	ldr	r5, [r4, #0x80]			@ enable access to crunch
-	mov	r2, #0xaa
-	str	r2, [r4, #0xc0]
-	orr	r5, r5, #0x00800000
-	str	r5, [r4, #0x80]
-
-	mov	r0, #0				@ nothing to load
-	str	r0, [r3]			@ no more current owner
-	ldr	r2, [r4, #0x80]			@ flush out enable (@@@)
-	mov	r2, r2
-	bl	crunch_save
-
-	mov	r2, #0xaa			@ disable access to crunch
-	str	r2, [r4, #0xc0]
-	bic	r5, r5, #0x00800000
-	str	r5, [r4, #0x80]
-	ldr	r5, [r4, #0x80]			@ flush out enable (@@@)
-	mov	r5, r5
-
-1:	msr	cpsr_c, ip			@ restore interrupt mode
-	ldmfd	sp!, {r4, r5, pc}
-
-/*
- * Copy crunch state to given memory address
- *
- * r0 = struct thread_info pointer of target task
- * r1 = memory address where to store crunch state
- *
- * this is called mainly in the creation of signal stack frames
- */
-ENTRY(crunch_task_copy)
-	mrs	ip, cpsr
-	orr	r2, ip, #PSR_I_BIT		@ disable interrupts
-	msr	cpsr_c, r2
-
-	ldr	r3, =crunch_owner
-	add	r2, r0, #TI_CRUNCH_STATE	@ get task crunch save area
-	ldr	r3, [r3]			@ get current crunch owner
-	teq	r2, r3				@ does this task own it...
-	beq	1f
-
-	@ current crunch values are in the task save area
-	msr	cpsr_c, ip			@ restore interrupt mode
-	mov	r0, r1
-	mov	r1, r2
-	mov	r2, #CRUNCH_SIZE
-	b	memcpy
-
-1:	@ this task owns crunch regs -- grab a copy from there
-	mov	r0, #0				@ nothing to load
-	mov	r3, lr				@ preserve return address
-	bl	crunch_save
-	msr	cpsr_c, ip			@ restore interrupt mode
-	ret	r3
-
-/*
- * Restore crunch state from given memory address
- *
- * r0 = struct thread_info pointer of target task
- * r1 = memory address where to get crunch state from
- *
- * this is used to restore crunch state when unwinding a signal stack frame
- */
-ENTRY(crunch_task_restore)
-	mrs	ip, cpsr
-	orr	r2, ip, #PSR_I_BIT		@ disable interrupts
-	msr	cpsr_c, r2
-
-	ldr	r3, =crunch_owner
-	add	r2, r0, #TI_CRUNCH_STATE	@ get task crunch save area
-	ldr	r3, [r3]			@ get current crunch owner
-	teq	r2, r3				@ does this task own it...
-	beq	1f
-
-	@ this task doesn't own crunch regs -- use its save area
-	msr	cpsr_c, ip			@ restore interrupt mode
-	mov	r0, r2
-	mov	r2, #CRUNCH_SIZE
-	b	memcpy
-
-1:	@ this task owns crunch regs -- load them directly
-	mov	r0, r1
-	mov	r1, #0				@ nothing to save
-	mov	r3, lr				@ preserve return address
-	bl	crunch_load
-	msr	cpsr_c, ip			@ restore interrupt mode
-	ret	r3
diff --git a/arch/arm/mach-ep93xx/crunch.c b/arch/arm/mach-ep93xx/crunch.c
deleted file mode 100644
index 757032d82f63..000000000000
--- a/arch/arm/mach-ep93xx/crunch.c
+++ /dev/null
@@ -1,86 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/kernel/crunch.c
- * Cirrus MaverickCrunch context switching and handling
- *
- * Copyright (C) 2006 Lennert Buytenhek <buytenh@wantstofly.org>
- */
-
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/signal.h>
-#include <linux/sched.h>
-#include <linux/init.h>
-#include <linux/io.h>
-
-#include <asm/thread_notify.h>
-
-#include "soc.h"
-
-struct crunch_state *crunch_owner;
-
-void crunch_task_release(struct thread_info *thread)
-{
-	local_irq_disable();
-	if (crunch_owner == &thread->crunchstate)
-		crunch_owner = NULL;
-	local_irq_enable();
-}
-
-static int crunch_enabled(u32 devcfg)
-{
-	return !!(devcfg & EP93XX_SYSCON_DEVCFG_CPENA);
-}
-
-static int crunch_do(struct notifier_block *self, unsigned long cmd, void *t)
-{
-	struct thread_info *thread = (struct thread_info *)t;
-	struct crunch_state *crunch_state;
-	u32 devcfg;
-
-	crunch_state = &thread->crunchstate;
-
-	switch (cmd) {
-	case THREAD_NOTIFY_FLUSH:
-		memset(crunch_state, 0, sizeof(*crunch_state));
-
-		/*
-		 * FALLTHROUGH: Ensure we don't try to overwrite our newly
-		 * initialised state information on the first fault.
-		 */
-		fallthrough;
-
-	case THREAD_NOTIFY_EXIT:
-		crunch_task_release(thread);
-		break;
-
-	case THREAD_NOTIFY_SWITCH:
-		devcfg = __raw_readl(EP93XX_SYSCON_DEVCFG);
-		if (crunch_enabled(devcfg) || crunch_owner == crunch_state) {
-			/*
-			 * We don't use ep93xx_syscon_swlocked_write() here
-			 * because we are on the context switch path and
-			 * preemption is already disabled.
-			 */
-			devcfg ^= EP93XX_SYSCON_DEVCFG_CPENA;
-			__raw_writel(0xaa, EP93XX_SYSCON_SWLOCK);
-			__raw_writel(devcfg, EP93XX_SYSCON_DEVCFG);
-		}
-		break;
-	}
-
-	return NOTIFY_DONE;
-}
-
-static struct notifier_block crunch_notifier_block = {
-	.notifier_call	= crunch_do,
-};
-
-int __init crunch_init(void)
-{
-	thread_register_notifier(&crunch_notifier_block);
-	elf_hwcap |= HWCAP_CRUNCH;
-
-	return 0;
-}
diff --git a/arch/arm/mach-ep93xx/edb93xx.c b/arch/arm/mach-ep93xx/edb93xx.c
index 7b7280c21ee0..af0e22471ebd 100644
--- a/arch/arm/mach-ep93xx/edb93xx.c
+++ b/arch/arm/mach-ep93xx/edb93xx.c
@@ -247,7 +247,6 @@ MACHINE_START(EDB9301, "Cirrus Logic EDB9301 Evaluation Board")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= edb93xx_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
 #endif
@@ -260,7 +259,6 @@ MACHINE_START(EDB9302, "Cirrus Logic EDB9302 Evaluation Board")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= edb93xx_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
 #endif
@@ -273,7 +271,6 @@ MACHINE_START(EDB9302A, "Cirrus Logic EDB9302A Evaluation Board")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= edb93xx_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
 #endif
@@ -286,7 +283,6 @@ MACHINE_START(EDB9307, "Cirrus Logic EDB9307 Evaluation Board")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= edb93xx_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
 #endif
@@ -299,7 +295,6 @@ MACHINE_START(EDB9307A, "Cirrus Logic EDB9307A Evaluation Board")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= edb93xx_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
 #endif
@@ -312,7 +307,6 @@ MACHINE_START(EDB9312, "Cirrus Logic EDB9312 Evaluation Board")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= edb93xx_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
 #endif
@@ -325,7 +319,6 @@ MACHINE_START(EDB9315, "Cirrus Logic EDB9315 Evaluation Board")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= edb93xx_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
 #endif
@@ -338,7 +331,6 @@ MACHINE_START(EDB9315A, "Cirrus Logic EDB9315A Evaluation Board")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= edb93xx_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
 #endif
diff --git a/arch/arm/mach-ep93xx/gesbc9312.c b/arch/arm/mach-ep93xx/gesbc9312.c
index 8905db1edd5a..d7f9890321eb 100644
--- a/arch/arm/mach-ep93xx/gesbc9312.c
+++ b/arch/arm/mach-ep93xx/gesbc9312.c
@@ -36,6 +36,5 @@ MACHINE_START(GESBC9312, "Glomation GESBC-9312-sx")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= gesbc9312_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-ep93xx/micro9.c b/arch/arm/mach-ep93xx/micro9.c
index b18ebf26da45..e6ead8ded6ee 100644
--- a/arch/arm/mach-ep93xx/micro9.c
+++ b/arch/arm/mach-ep93xx/micro9.c
@@ -80,7 +80,6 @@ MACHINE_START(MICRO9, "Contec Micro9-High")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= micro9_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
 #endif
@@ -93,7 +92,6 @@ MACHINE_START(MICRO9M, "Contec Micro9-Mid")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= micro9_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
 #endif
@@ -106,7 +104,6 @@ MACHINE_START(MICRO9L, "Contec Micro9-Lite")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= micro9_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
 #endif
@@ -119,7 +116,6 @@ MACHINE_START(MICRO9S, "Contec Micro9-Slim")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= micro9_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
 #endif
diff --git a/arch/arm/mach-ep93xx/platform.h b/arch/arm/mach-ep93xx/platform.h
index b4045a186239..5fb1b919133f 100644
--- a/arch/arm/mach-ep93xx/platform.h
+++ b/arch/arm/mach-ep93xx/platform.h
@@ -38,12 +38,5 @@ struct device *ep93xx_init_devices(void);
 extern void ep93xx_timer_init(void);
 
 void ep93xx_restart(enum reboot_mode, const char *);
-void ep93xx_init_late(void);
-
-#ifdef CONFIG_CRUNCH
-int crunch_init(void);
-#else
-static inline int crunch_init(void) { return 0; }
-#endif
 
 #endif
diff --git a/arch/arm/mach-ep93xx/simone.c b/arch/arm/mach-ep93xx/simone.c
index 8a53b74dc4b2..5291053023b2 100644
--- a/arch/arm/mach-ep93xx/simone.c
+++ b/arch/arm/mach-ep93xx/simone.c
@@ -123,6 +123,5 @@ MACHINE_START(SIM_ONE, "Simplemachines Sim.One Board")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= simone_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-ep93xx/snappercl15.c b/arch/arm/mach-ep93xx/snappercl15.c
index 703f25f19d51..e200d69471e9 100644
--- a/arch/arm/mach-ep93xx/snappercl15.c
+++ b/arch/arm/mach-ep93xx/snappercl15.c
@@ -157,6 +157,5 @@ MACHINE_START(SNAPPER_CL15, "Bluewater Systems Snapper CL15")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= snappercl15_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx.c
index e0e1b11032f1..12eff8c8074d 100644
--- a/arch/arm/mach-ep93xx/ts72xx.c
+++ b/arch/arm/mach-ep93xx/ts72xx.c
@@ -354,7 +354,6 @@ MACHINE_START(TS72XX, "Technologic Systems TS-72xx SBC")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= ts72xx_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
 
@@ -418,6 +417,5 @@ MACHINE_START(BK3, "Liebherr controller BK3.1")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= bk3_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-ep93xx/vision_ep9307.c b/arch/arm/mach-ep93xx/vision_ep9307.c
index cbcba3136d74..e46281e60bf7 100644
--- a/arch/arm/mach-ep93xx/vision_ep9307.c
+++ b/arch/arm/mach-ep93xx/vision_ep9307.c
@@ -306,6 +306,5 @@ MACHINE_START(VISION_EP9307, "Vision Engraving Systems EP9307")
 	.init_irq	= ep93xx_init_irq,
 	.init_time	= ep93xx_timer_init,
 	.init_machine	= vision_init_machine,
-	.init_late	= ep93xx_init_late,
 	.restart	= ep93xx_restart,
 MACHINE_END
diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwcap.h
index 9a5498c2c8ee..8c129db8232a 100644
--- a/arch/arm64/include/asm/hwcap.h
+++ b/arch/arm64/include/asm/hwcap.h
@@ -18,7 +18,7 @@
 #define COMPAT_HWCAP_EDSP	(1 << 7)
 #define COMPAT_HWCAP_JAVA	(1 << 8)
 #define COMPAT_HWCAP_IWMMXT	(1 << 9)
-#define COMPAT_HWCAP_CRUNCH	(1 << 10)
+#define COMPAT_HWCAP_CRUNCH	(1 << 10) /* Obsolete */
 #define COMPAT_HWCAP_THUMBEE	(1 << 11)
 #define COMPAT_HWCAP_NEON	(1 << 12)
 #define COMPAT_HWCAP_VFPv3	(1 << 13)
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210802141245.1146772-1-arnd%40kernel.org.
