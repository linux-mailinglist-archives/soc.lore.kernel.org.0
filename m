Return-Path: <clang-built-linux+bncBAABBLN6S2BQMGQEABHYUUI@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-qv1-xf39.google.com (mail-qv1-xf39.google.com [IPv6:2607:f8b0:4864:20::f39])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3DC35135B
	for <lists+clang-built-linux@lfdr.de>; Thu,  1 Apr 2021 12:23:42 +0200 (CEST)
Received: by mail-qv1-xf39.google.com with SMTP id a7sf3051755qvx.10
        for <lists+clang-built-linux@lfdr.de>; Thu, 01 Apr 2021 03:23:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1617272621; cv=pass;
        d=google.com; s=arc-20160816;
        b=ieAzS2VEyyqiQ6EJU1h1ncsg4xr9gMFppX+C/Jgi8E4F+JgedcMNdQIqfIbNFolKa5
         9luzzpR4r9096AjsHx0dNrSH+TnEvrh2C3niTeL8RBmh0rysR77X6Qsb6g5/8N7pJYvo
         1Q5eGZUZKVRP+2WpOos8B4V14WY+HlnCMC0nnIR++3zsomytTN/xBAHp7psvXqfwv/fu
         NFjHE9xDgrrkiWLtz1Wc98kI9DuKuYrHzc4FeDvi15Rb2p9OcZEkXQlHzFuC51fEdSZs
         w1x06aqyCWcF7uanoeE8M4zCQfCEJ2YCIazaCvyr2dJLAmrJnVzQD3xvnuSDV1A3nmJk
         AGEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc
         :list-id:to:from:sender:dkim-signature;
        bh=XjxwlJcvqaWy815cfZv4cR5HXUO8pTAjAgp3ZtUMx3s=;
        b=vIv0fFaf1x7tJxHimpj2O8Kv+EVPfQmdprlE8a0i7w6H7LgLJNfqsDj0HFYZ5xN8xb
         EvDauFPzqsW597DuXkjQd2/DUXiBuE+NRY904HXfesgF+8FJCweRCLfq22ssRULlBihP
         7BWS8P5y2HDpjuY4bhtj/ZGvZECSGEGH1NkCe/P1G0+DNxMdkS8ChOcgSTlPtLky6nNF
         SY9A7vGtIAWfPzj2niZLNvxV8roles4myhqiBVugLIU3kTGIzoZzrdbN2JltrH3EZQZZ
         6X3pW0tIHwqt3ZE1e9icdIjnwn3S4p/GN27hii/WEOTQXXlF/XgmLhbu3fvupCKcsM50
         wKlQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=SsBBm0EM;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:list-id:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results;
        bh=XjxwlJcvqaWy815cfZv4cR5HXUO8pTAjAgp3ZtUMx3s=;
        b=WmVAfTPDR4y+W3CBAH5NU0CEySn7ND/dnr1fZsLFYTOXsUmHJ5/6Fu9q78afHrUto9
         D7P7NFrfDTlZGgOgNm2p7JR01Y1lJLb/Wc7lqGPeZMVmsY+fgDGWNXYbn7r+vbRK4HE/
         a3dQ1fAen23ohJHg/e42HquKHqcpmwXkPF8ubEBfCLfBML46cD2QmXjniB39S8dYOQOa
         +rUiR3Vhzrh1xjYiCENH1711255le263ND5FblWhXaEflQ/tY3UI34Zy9Eg/N2hgHyrv
         rADt67ohEXnCzi9/cUg7xlfla3rcsGh4yk1epyNd90L2qi2oB6yEZSB9CCnLrsi0sApA
         R7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:list-id:cc:subject:date
         :message-id:in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results;
        bh=XjxwlJcvqaWy815cfZv4cR5HXUO8pTAjAgp3ZtUMx3s=;
        b=d+gr1ajgIf13r9kLKAmJOm6nNhiTFuvH80EnzXN61SPQo2cJ/W4xwdVgjx0ebNWCK5
         eskK4UaA0jq8cwAaRvihxA5a8rsoMvWEuBM+beIFqr0TPdG5pLmTqbJlgYA49+UcE7Fu
         kObexbXxCvgNwtpbrsUBKy0wGTIRuigFN09MPFMBisobY/s6B8FT2X69QVpGqOKklexR
         WsB5n/algmUTLxAbujLGg1VJphjGcpPbAajXfi0BewY9ZZ6HuWZx9y1ZF/nW3d5s7LmW
         510qdAel1AMt4NTA/iUpGJ1H6TYwzCKKDQPcjazMIONWinaQBkfzE5H2wvxuuRsLxDlL
         Dz0g==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM531l3aYenRbYAc1Vxwu2uFDwK53gYTrKkckubQ/l9aonL5VMtiRm
	Vwda1HIzV7xG+UDvCGQJ/c0=
X-Google-Smtp-Source: ABdhPJzkbb7zaUAuqqwUPnd9VNuGeF4EGKKAuYR/iYIZeZwBDD7Ml5BqmmzjHRBGtw/6Jro3CeSXAQ==
X-Received: by 2002:ac8:7e95:: with SMTP id w21mr6429153qtj.244.1617272621219;
        Thu, 01 Apr 2021 03:23:41 -0700 (PDT)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:a05:620a:400e:: with SMTP id h14ls3002904qko.11.gmail; Thu,
 01 Apr 2021 03:23:40 -0700 (PDT)
X-Received: by 2002:a37:e16:: with SMTP id 22mr7351892qko.145.1617272620824;
        Thu, 01 Apr 2021 03:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617272620; cv=none;
        d=google.com; s=arc-20160816;
        b=UVP3bjOmLu0BxXxW41nORwaAgQ4YUh6NYkEfXZRfeNYNXr2IFhRTXx6yN5uQY5g3Xg
         BvnD+mcX/6eozGjMlNtqjVUugnjDcOsC9sdLNRGGCUq+w5GqZ63zVGSrl3TI2UWjDKLM
         e/f+v8sNkwqRWQER8Ft2Kx95eGq5eG/zzt3zybMwx/1tj/aNspGDzKeM8W002AtnjaF0
         7jqSfsVaUjfhOIwYcSWXSG75uMhrQEW+hgdSzLAkCSMICTT0UZe1/KJD5qYtzA6yjFJK
         uWgCDinhmI6h91J50mbCRnXToEF+PPYyX6j5k1uezjt39Mll79ZfvmFhNpL8e6RIpnwp
         34Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:list-id:to:from:dkim-signature;
        bh=8j9203l/cqZrggLLOF9C/kVAofExiWBwbbbuQ1iW4PA=;
        b=bQjymL5/Dc+TR9iU0tYWqqouNjION2NbBqqPvpqinnaRF2nHTVBRTegIrVZvhag2Jb
         KGCnttcv2K23pGAeemDtmxo1RdAC0gLh8fhieDvMD26UdpI2xSum8GzY/6brE1vK882e
         +EzWD9sMHkfJl/Z77B6hGr0VrEy6L7vlqH7C1tEQn90OFPahXuU0OartZ+WdgrJ7S10s
         Y6RWna7hrFk/EHBBYJtIY9NjneM2CuJE8hwupfx9TXLyChdm0i0ik1snxpem5euFxCK0
         ExJBmfI5NAh5voKzzgpk5njgE3sCah7pchTzBfOEwGz4PMU2rTm9eoiO9RF5BjP1MtJw
         52nQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=SsBBm0EM;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id b2si836127qtq.5.2021.04.01.03.23.40
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Apr 2021 03:23:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF8116105A;
	Thu,  1 Apr 2021 10:23:36 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Maxime Ripard <maxime@cerno.tech>,
	soc@kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	clang-built-linux@googlegroups.com,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: keystone: fix integer overflow warning
Date: Thu,  1 Apr 2021 12:23:26 +0200
Message-Id: <161727243810.583633.10194693313914787410.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323131814.2751750-1-arnd@kernel.org>
References: <20210323131814.2751750-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: arnd@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=SsBBm0EM;       spf=pass
 (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted
 sender) smtp.mailfrom=arnd@kernel.org;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=kernel.org

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 23 Mar 2021 14:18:05 +0100, Arnd Bergmann wrote:
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
> [...]

Applied to arm/fixes

[1/1] ARM: keystone: fix integer overflow warning
      commit: 04e18e1cc319f453a6d752d4553bb3f29fde5f76

       Arnd

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/161727243810.583633.10194693313914787410.b4-ty%40arndb.de.
