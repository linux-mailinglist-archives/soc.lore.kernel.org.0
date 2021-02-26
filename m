Return-Path: <clang-built-linux+bncBAABB27O4SAQMGQE3EKG6OA@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id B85F33266A0
	for <lists+clang-built-linux@lfdr.de>; Fri, 26 Feb 2021 19:01:16 +0100 (CET)
Received: by mail-yb1-xb3d.google.com with SMTP id v62sf10658045ybb.15
        for <lists+clang-built-linux@lfdr.de>; Fri, 26 Feb 2021 10:01:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1614362475; cv=pass;
        d=google.com; s=arc-20160816;
        b=O3A6dpyN426VfA0b9a/zvfYQavSlWeLNntaSmVg90GCCYQ+1IteY7TEsNK4syQ8z8g
         MVZyu1NRkTohw2L7gMlZOe3gvxIkPoNSZUOo/YFcg54+lZH5pBqfWIKbueF8NysLqRKj
         Utq5mED49mi3cUMQ1wQ+sMv6A7ghZoeWOnOCXYBwMYiydW9QDmyMnQ6nsYupILy6yQTM
         YmKxhiY5dd0HOO64y1QDHscS0+Zmi8DgUv2QifUoyT4nVt9bCk4I6+akwHhyuZ/wGI3P
         b54kLk79A8VwYtP+/ypAu2iH1x46u9pX8k/G/kL4qTk1RSFoCZexFDHvP9ey28NhfjVw
         RFxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:list-id:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:sender:dkim-signature;
        bh=0X+5Dr8PjcA+qHR4mSmovs0KatT0Aa+HW3Z902yLnNY=;
        b=e3bqINtPYsiqT+4cBlONhFnrHJJ+bKkaHAnv6TKJ4WbSbzDOo9lWVQq8UYdKCMKaJp
         ilrbvz+++fT+1F/lm2a8q6gO66C+s3dlww1mxMu7ZNyC+IONpVnqBBSzFte4vX+611ip
         ieU4RViPyZZKERe8G95vSbXn2Z/9z35sdw+XIcQ13/nOdHNRdfPhzF8dXva/uVQiwV7D
         Q1wlv5z++oJbATCJgYpq6pGpk1sMK8lWGrSUFKYcjSf3emXxx0x/w+Ccakh0TjDk6oOc
         rAU9pZQDtvz1fv9PbHJkyfXhyYP2rQFYzOkockSadelFP+mdh1L9pqu78C/igG/37nft
         dzug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=DO3RSA62;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:list-id:cc:x-original-sender
         :x-original-authentication-results;
        bh=0X+5Dr8PjcA+qHR4mSmovs0KatT0Aa+HW3Z902yLnNY=;
        b=U6XLQ8clx5et7xnCmMOpISm9IKdAbwVNVbW7nbe4ZS2TtKXNbMic8+hzGqkAnOP5te
         q/nVeV1IHP1eS1cGM2rDp1rqi6N97cwA11q0NNHTY4GbzoKGxeIpcrK4IaSbd/Ve1P7I
         WfGLu7GfygxOIj3qkEIQkVaiGsvOkaGTYLIcblKTuXmNcywi/ZTCcc0hmQj4qjKmr+7v
         TxXprU4vCpreJ1G7F1v+J0yEyS6UxNIR8GLsooCZJ/rM+oHjnWfmvcsy3cJIZGtw6nkG
         k4fhvh5caJgjsPafSb3QwjwiwMg1B2bGAtG4YeOX9fMlIfooyG8LD5B9m7iVR5XPIXjU
         8x7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:list-id:cc:x-original-sender
         :x-original-authentication-results;
        bh=0X+5Dr8PjcA+qHR4mSmovs0KatT0Aa+HW3Z902yLnNY=;
        b=orgcOsjkPrYTm81y6mm0hOpbLwH655+UF++mSJdFXBqpuItvyi8O7Ybr5yf2GZE2Tf
         aTzvG8cfbO8p28zBjvQNZEWyLGJYT+YL3pkFyabRvhEqvDz4Qtga78qTRSoDKX5HSx25
         gu85ck0zAFuFRrUvo2OLJHT52PCAn9CR9CvaY6PL5Qj5jBAjfD46nq9Z61u+n6hHUyPH
         SO7o8eT82AjTuyqYHsInrHXwOmFsZNhomSqpEZeK73lfeCxXGe2cec2hHjhXCHM774Ct
         Eo1ksIn9eqxR1p3Sxeq0Re7ERVSncMn+id1Qpfv7cIxQIy8nzMWz/Bwzu/rhP5eo+xFY
         v4sA==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM531AjG8ROPTCEfGCwIdZUtSTecACSoJcjQOFCc4OrKdZrXrJIry7
	mxK5TtgjOsbKkswerjEjzRo=
X-Google-Smtp-Source: ABdhPJwronY6Fm5fM7aInILseFo4OfCoGgFnMsqhSOU4gXwguff3dOKUknAZdUfGN2WoJ8e60gvbBw==
X-Received: by 2002:a05:6902:4b3:: with SMTP id r19mr5870760ybs.432.1614362475744;
        Fri, 26 Feb 2021 10:01:15 -0800 (PST)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:a25:7807:: with SMTP id t7ls4582490ybc.10.gmail; Fri, 26 Feb
 2021 10:01:15 -0800 (PST)
X-Received: by 2002:a25:8143:: with SMTP id j3mr6003981ybm.237.1614362475321;
        Fri, 26 Feb 2021 10:01:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614362475; cv=none;
        d=google.com; s=arc-20160816;
        b=l8+EumHEoGAhDO4cQPE0sMV0CIm5Gf2iC3/JTPIIrj3fxA7guI/uHSS8F2xa+5F+zj
         IoBGY6xb3MFj9dg8SkE32IK3kUi8+eCzX+/AAgpHWQSaaGo0Xpl1XNcvhoUpXlGlz/rr
         UC4LcQQwhYiXVlyOlz8MKisdj2mGwt3T/SD5/1d+6VrK2LAEoS5T6pGkMTURTstRUko9
         3x6kjRsVZr6Pzze++/c5p+TuA42tk2dh+PcRfUCZ+kvJt/WMwj2ivWmRFmzOHP1b5rel
         flhjkBm5QD4l82zKVXqf7sFPv0S2USAELew8MS+X1r+2iULDGQhWn38gk7FSwdLf5c64
         +NfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:list-id:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JnC9TgZz6DiYE6dmMIWCQUKg5MPsgC+606//YwL4Lto=;
        b=H5Fee8yEIyy6tmXQAanWSMvqLZjhbU93xBlWWfsD+NUkhNUS9ygXvHFXOtGLuZbjuf
         YHka1iyk4YFU5A5CUqrlKWUQHyKjxNMjd3w7AV7lyF80MyziwPWgubxUBFn1DmssGWrN
         hRsoBdFtHiso5HJi7O2ISdGVdYrADYno5U9dqm77Zm51beKhhjR3W0TXXy/quJ/2CwhH
         mf+5XHrmS+osIe43AZO9RwSPhnyCCdIdKwFUgudSDbbjzSJZQAxzHFGWljSJzV9BfO5y
         KGji6Cq56TEgoQG+6ESXOLwZ58m+Q9UrM13E83jIWWqeao1UjgOFbOe4lX7GGAjKRVuK
         XTIA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=DO3RSA62;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id x7si768352ybm.0.2021.02.26.10.01.15
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Feb 2021 10:01:15 -0800 (PST)
Received-SPF: pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B00E64F24
	for <clang-built-linux@googlegroups.com>; Fri, 26 Feb 2021 18:01:14 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id h17so10601890oih.5
        for <clang-built-linux@googlegroups.com>; Fri, 26 Feb 2021 10:01:14 -0800 (PST)
X-Received: by 2002:aca:4a47:: with SMTP id x68mr2769592oia.67.1614362473428;
 Fri, 26 Feb 2021 10:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20210226164345.3889993-1-arnd@kernel.org>
In-Reply-To: <20210226164345.3889993-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 26 Feb 2021 19:00:56 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2E0pv6PKzcCoRZH0G_gGrhWeiDwN7h090iQpd6c=XG1Q@mail.gmail.com>
Message-ID: <CAK8P3a2E0pv6PKzcCoRZH0G_gGrhWeiDwN7h090iQpd6c=XG1Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: don't use clang IAS for crunch
To: Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: arnd@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=DO3RSA62;       spf=pass
 (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted
 sender) smtp.mailfrom=arnd@kernel.org;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=kernel.org

On Fri, Feb 26, 2021 at 5:44 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
>  obj-$(CONFIG_CRUNCH)           += crunch.o crunch-bits.o
> -AFLAGS_crunch-bits.o           := -Wa,-mcpu=ep9312
> +AFLAGS_crunch-bits.o           := -Wa,-mcpu=ep9312 $(cc-option, -fno-integrated-as)

I reworked that patch just before sending it out, and ended up with two typos
in there, it should be

+AFLAGS_crunch-bits.o           := -Wa,-mcpu=ep9312 $(call cc-option,
-no-integrated-as)

I'll wait for others to comment before I send the fixed version.

      Arnd

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAK8P3a2E0pv6PKzcCoRZH0G_gGrhWeiDwN7h090iQpd6c%3DXG1Q%40mail.gmail.com.
