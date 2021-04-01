Return-Path: <clang-built-linux+bncBAABBL56S2BQMGQE5BNGQOA@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-io1-xd3d.google.com (mail-io1-xd3d.google.com [IPv6:2607:f8b0:4864:20::d3d])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8E235135C
	for <lists+clang-built-linux@lfdr.de>; Thu,  1 Apr 2021 12:23:44 +0200 (CEST)
Received: by mail-io1-xd3d.google.com with SMTP id d4sf3611153iop.19
        for <lists+clang-built-linux@lfdr.de>; Thu, 01 Apr 2021 03:23:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1617272623; cv=pass;
        d=google.com; s=arc-20160816;
        b=wU6qDcfTPHmEdpkibFeE2YKYoetWS0k3NKIlST1occFkI7Lk7VETeufjswDGfJ5MDm
         u7TNOqAepH/dklXE4ttYM1gnvoOcque2E+u7A4KoGIzGqcXolHem8U/q5HIKUFQx4V5C
         eN7VWe1Xrc+jIQG7kirQO95Kyf3n3bsSa+dVG08Jk+OfZ0ZKHv3q38VqQ1jL162dxtdt
         gyTHM/QQxgWdpdqPEKC1dBsFbjnMUOWsLtGZqRzPwV2oQsJAlZxxAj5Jbh/OC4+CyScp
         c+PmnWVJyKABI61aF8DvWH+Lp2NspvWs2sVmoGom5uNEoCAdaRYs6GVBGy3kMGu2LhjC
         uY+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc
         :list-id:to:from:sender:dkim-signature;
        bh=cJ4MVYQxtVxF2afXTqofQWygYOS+IO0EvEtMNwFUH74=;
        b=yKnyTKZUuL8nEm4vcnGXc1u7lFusOctAiVMWZK4OBfgAOQE6lB65kiDN+gbP+Ikzxd
         sr3EpxHcyEvdjpng6MFhej7X6doSCS+gVLGwzVAwQEqziTm7RvlY3VzQetCjtdjQSHA1
         aNmvJMAX9A27u+rrJNy3vVlC9ifYM91TULedGbr3qK3cLK0ekbIoj+0RxXc2R9rYbFzs
         QJ+GROYp8SSjPdTPXw7ypI+3NW/ifw+pYAn6+8M/V7yWVqlszhk0gl6otVS4Z2Ga13C7
         NNyJqW0bHLw4NnjtZW5g05BezCJXFxDQVtZ91BOo5rfpC08xuuK8+e0c5MBDavm+zXQ4
         VBTw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="Sm7za//q";
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:list-id:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results;
        bh=cJ4MVYQxtVxF2afXTqofQWygYOS+IO0EvEtMNwFUH74=;
        b=QEDg96JqBhLK2qC2ZXI5rF0ONfYlz6ZXWVa7X/zanRPcZDGI5FzHekrz7Zljrw1xEp
         8U31AbP1pnPmIEOa9V/ds+jnf1PB4WMxeMqjURPOPhjjDXrbcjRg4a1qJsbr58Ra6XdY
         2UE18/hebjRgerAeLWE2ekprjgq7Zdz2BB2vXFD+RJcglbSTszWYlcSCaZjkh8mizLg2
         G1ZdCqyrLFw+k06J0h0F0DzODZgVc53OpM5+SU++DIOP5VuA1GZlfbGcHmCSM0sfxPFw
         G+Jp+991lOyiYHnMWJ+FeSYGcYQT6X8243pWv7agMYw+N+LrDzrqu7Eaqoe8EOQ9yEzo
         SuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:list-id:cc:subject:date
         :message-id:in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results;
        bh=cJ4MVYQxtVxF2afXTqofQWygYOS+IO0EvEtMNwFUH74=;
        b=EcwofzajlrlEYnkkpvyQ36dXLgRTA37r45Ngc4+/WM/zx2YDeEqJFREk1thc67o9dW
         1B2raOTuvNqGDha+p1tjFX6q/HQhZmTw75ozJmsI02v9xEyPbjtkSkh9mpMMeoGYo7KL
         6GZShpxnxyqJk/KmXAlrXFe9GWtCMeEYmRpjmNf7/MxZN/ui2WQqCq4eokGRAc18Ysnv
         ea6ccQdBn0kdiLxXwCSNz/4W4ohx8bA91gDwLA6nyIeg1YyEm2AzygQ5eX/rl1JIkmpx
         E272/Py/htl5J/u958jFKlkjS8C1fmtuLnAUbDgZkgLdT99mkgqgdcghVVlmzUipM0eA
         dyUA==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM532ODkDaPIAC3A5jPPncQsvP4+DMDtAbNqTg7cZTo/bOoUcY2L1w
	e0tjpEazXq/rZxnVi1l28y0=
X-Google-Smtp-Source: ABdhPJyPpLP6mXaV8urxk5jg4hUT3MVvTwZvqL2qwLPPqvQs8qTCw/eqhFWbf+cvYTOR+knpjfpovA==
X-Received: by 2002:a6b:f719:: with SMTP id k25mr5944174iog.151.1617272623618;
        Thu, 01 Apr 2021 03:23:43 -0700 (PDT)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:a05:6638:248b:: with SMTP id x11ls688661jat.7.gmail; Thu, 01
 Apr 2021 03:23:43 -0700 (PDT)
X-Received: by 2002:a05:6638:371f:: with SMTP id k31mr7262693jav.143.1617272623369;
        Thu, 01 Apr 2021 03:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617272623; cv=none;
        d=google.com; s=arc-20160816;
        b=AQbK58CK17PQPDjYvCy5YDU+W16ljid4axHo3mt3Dz2kLbxijtwf5xzvxKGSDmOQ1k
         2zr8NX3TbR90SThmyoZ2O2nQoH92zoV9L2KQoIMrHwp8DjDF0oVXHX/acco6lmjtC9IF
         9IYfVF2VOX0LEh7UHIarWi3u2a/vXPKxhGuYFwEVTzLa7jejTwBLqbNBVNnqpHPk8r+n
         cMssTSI2ljiLuNN/5GkNkbBS2m3eAgBH7Qu1a5o2dJ43CMLTPe91ObzkQ7Uyu6Zo6sY0
         A4kw33su24EpNuXVNia4dWVQC88WQJ13gCdFrSmCTE+Cz/ycVBz37X0EkjOJ7FIZnjTG
         H3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:list-id:to:from:dkim-signature;
        bh=VpdpzmDGttNw9PJHqeh/QX63LtAHEg+FaWXS0sPPNBM=;
        b=d8DIzXJdxt7agmGX07G8T/p1/IGc232QisP85A0ba3pz39h2VFr00BT+JTgPiwCOG1
         0SGb2+MVzm6BWIGO083pQdqu32KJOw4+tcMF5j4cnqOZaA3WHGc9gKQ3v/NmMtC71Xq6
         o28DS2yuZ2alt5BoLMsEn3uou2HsuOpPUeCssZznpvqpkrW/5oD1dTO67JuHZ+6Sr5pz
         ZYG7XFMvYVvBLFEQFO5CQjNq/XZPGI1a+/rb6dAnw5G2xN8Kfqi4Bs/8pRWVjA6+pDUE
         ax8rgRR6PkoMdM+W5aFxjpVvFevlLfXoMVnF0lo/iqiPIZNLfH3oA0ZvHwD6V22b00bt
         Wwgg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="Sm7za//q";
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id i2si315516iov.2.2021.04.01.03.23.43
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Apr 2021 03:23:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0283F610CE;
	Thu,  1 Apr 2021 10:23:39 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Nick Desaulniers <ndesaulniers@google.com>,
	soc@kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	clang-built-linux@googlegroups.com,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] ARM: mvebu: avoid clang -Wtautological-constant warning
Date: Thu,  1 Apr 2021 12:23:27 +0200
Message-Id: <161727243811.583633.7548512731987590816.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323131952.2835509-1-arnd@kernel.org>
References: <20210323131952.2835509-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: arnd@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b="Sm7za//q";       spf=pass
 (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted
 sender) smtp.mailfrom=arnd@kernel.org;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=kernel.org

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 23 Mar 2021 14:19:42 +0100, Arnd Bergmann wrote:
> Clang warns about the comparison when using a 32-bit phys_addr_t:
> 
> drivers/bus/mvebu-mbus.c:621:17: error: result of comparison of constant 4294967296 with expression of type 'phys_addr_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>                 if (reg_start >= 0x100000000ULL)
> 
> Add a cast to shut up the warning.

Applied to arm/fixes.

[1/1] ARM: mvebu: avoid clang -Wtautological-constant warning
      commit: da03f523e83350caf2cf12f1169eca129efc445a

       Arnd

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/161727243811.583633.7548512731987590816.b4-ty%40arndb.de.
