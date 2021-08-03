Return-Path: <clang-built-linux+bncBAABBCW7USEAMGQEJHE45MY@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-io1-xd3f.google.com (mail-io1-xd3f.google.com [IPv6:2607:f8b0:4864:20::d3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 593D83DED40
	for <lists+clang-built-linux@lfdr.de>; Tue,  3 Aug 2021 13:59:07 +0200 (CEST)
Received: by mail-io1-xd3f.google.com with SMTP id f3-20020a5ec7030000b029054f7bfa6d64sf14072631iop.13
        for <lists+clang-built-linux@lfdr.de>; Tue, 03 Aug 2021 04:59:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627991946; cv=pass;
        d=google.com; s=arc-20160816;
        b=G5AFFLV3BHGKNb662GlqdlhO6qTYe6iw+Fu8QmNIKAicb0PQ2obarEtYHyuOULKHIw
         kbabVqkMTntbIP3UoStqEtKlUaTNfFW9hGioWYYCamQmgdJPSOIzvsiegLQZLuBRm5eV
         tqJRsgJSphAyQx/ThTXSbYicNgqyt0zhxDlKXIHeCFwp9cyB9aH3voxjoVhXegkDS2aq
         CecSCG0UdxIk1MsWhbvlAMF7PYn1wIH3Su2NkZi2LSr4nx78sCbPWxW9YKcuUg6MLoDv
         h19pzavw19fImkBkopgVNHLACgQZjqtkTsngc9cKcRfAwx9en2XuK9lF4Vb1z5wYiFHN
         HZQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:list-id:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:sender:dkim-signature;
        bh=VgTB/D7fstsIc/B/QQKHJAgK1rE5fqLrAeIceXGwJ70=;
        b=nxFMK/DQSwX+v+ErjyakF9SD5Z9liZGUyiWJYShuUny7pEbG691Rz600tMmg2tq7lq
         OIf9aOZSBGPrfMxutPYKPeILJNjc6OSngb2mI1HqmYYkC6ciROLWC7PSHzeePlhxxJCa
         tSL+UzWixQM/9IThQZySaxKwxIfDybXSr5fM0Z5jptHsoBMVEjUM4oZvFUX3s5dAIi7m
         nKEWRiwF4EZw18Y0QTtWjyu2imN8M6052Qb+Y+aXOz6QYe80QzcygHV9suKEfCW0VDs7
         0snU1Gt53HNhav26neNBX8VN00QagD9NTDsRAOoRVvCO6Xk0muGJeVyoECCzKB+3S+ZF
         OMFg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ss2oGLsT;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:list-id:cc:x-original-sender
         :x-original-authentication-results;
        bh=VgTB/D7fstsIc/B/QQKHJAgK1rE5fqLrAeIceXGwJ70=;
        b=kvLHxQE+aeGIvRnU9283Vq7rqsEZifOmJ3AQ5daISuGgbHOoMZ8W3ufaQd+v+XoWih
         jzQ0H9eHX/fwX7KCGaYOvjufP4k4g2W4bfTB1wijs3p78Ya6JjwMD7bpY/P1lyq1oP7g
         DI1vVTU8bSSKLf3sKo8MV2JI2kpTW+6oyCO/DchORoEcCaIHOsYS8+Ay+tUhnqwXDCNZ
         OwTkIGIp65L3J1agrLn2nBPdEmSyJh305jjhSH1QEpTvO7cjWEiwRZm/6rVDIXIwznv2
         6eAjATOJ9flDYrj6dKxVa44l2WrT0+xa588W9YFqNXKFrHXOrBR4S7ZKTJRWibag1JhL
         A5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:list-id:cc:x-original-sender
         :x-original-authentication-results;
        bh=VgTB/D7fstsIc/B/QQKHJAgK1rE5fqLrAeIceXGwJ70=;
        b=nl+jqVPDb35bSmSJluq4mbPU/FvR7T5/IwDbrc8ZqodAkhafXogapAIPreHYFCo+EM
         YCWSr229am4IwVH0lyTXPIlnaLNi4+0H5/QD5z+WLlQ5ewFQPCyBuCUtxeJ2h1vwk/cW
         HmmVC95MFooLFaKuU42dL1CJXNOVcos3LpMqOUzcgw1UgLS4cV9BkDIckqotpJIbRord
         qX6Dj6iA/FccQBdD9eKQi+/oxXQCOpA13Tpf9ZSbP5tXRsPsF6mc1QvD1b2GNkQc9UmB
         qaudIO9YOpyTZwFbVPLDhBjcSu/nb3YE9PZ0MCZtEzEQmJThhbgm3V4UoNHBu2EVv+2D
         D4nQ==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM5304CVLdOe2s0kIMouSz1t+J6zbHusChm9UfJYuW0LnUr3aXrXNb
	ekZkjlaI/SFZ5lWztb2cuTI=
X-Google-Smtp-Source: ABdhPJy42v89cMVbIbCet5QCG1WyX1SDOZSrQH/FuGHKwQ2WaCYSl66otrbEXzUwzbgr/pxh2hqzuw==
X-Received: by 2002:a6b:3e8b:: with SMTP id l133mr21396ioa.137.1627991946075;
        Tue, 03 Aug 2021 04:59:06 -0700 (PDT)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:a05:6638:39c7:: with SMTP id o7ls2856114jav.0.gmail; Tue, 03
 Aug 2021 04:59:05 -0700 (PDT)
X-Received: by 2002:a05:6638:6ab:: with SMTP id d11mr11953159jad.33.1627991945791;
        Tue, 03 Aug 2021 04:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627991945; cv=none;
        d=google.com; s=arc-20160816;
        b=fXAC4dVzc44H0+WzHM9MYjrXGJwQ2smGoKe7pwZKsJ+cIVANnvKygpUBtO3NcOcu9i
         v8fRlcUJRHSPR3lYLB62VqrQwQUWaIqq28pBSWOQPlHN/l1z2LkClcrFOuQsOrdrOcIg
         uf/ZbKXaWLba3iRWpVKlSbj9f1MRwDZj2UfUAlziPMWzB9yXLsH2nKkxDx2t/jZXijkW
         0y2AA9Eb6xTnDmeLRhPdPJbn9MFSvuXxpzqtPd2mh7Nhy5YinPPnQA3/h+9icPktOMTq
         kcZIpo2jDVOuPfvFDDkvfA2BQz4Sb5F6iDnvJywzLCoz+t/Sl1L1nkouk/c5Lkvsv5gk
         MKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:list-id:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KjNpM28Iaw1xnEvElTS7HQMS0E7HZL5KqKF7kHh13cc=;
        b=Zd6NnIw4TwR1ZvkNM0ZWYj/ZMKJg3tqaJCEkJ4ckGcxcJI9Kq12t4KtiJqMBeHqrqs
         uXVYyZzWTdPHnZ3fdu4iVU1lxJdGX1NCBon0bNsHk0qpmGZwF+g8QhO42lSRmfDr1jCl
         /Vy+Ql5isQ69YeJQToHxTVuggOrCSf1TIn9TxT6U/eo7xPARlfn2hrmAU9n0DibGJ32R
         /m1KmcbcfNH79P3o7JPQdJmvxi+cA24SbZEWTfnd2wiK9mplO7NDA2WE/N/gXsc4v6D0
         NNM0UpPIgTROD7PYA4RVubMt+tjUdwfHGtATBohgTav8APk5Zjf83lLFS9TCUzA/XfY8
         nlXg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ss2oGLsT;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id e12si672236ile.4.2021.08.03.04.59.05
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Aug 2021 04:59:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3BB860EFD
	for <clang-built-linux@googlegroups.com>; Tue,  3 Aug 2021 11:59:04 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id k4so14212833wrc.0
        for <clang-built-linux@googlegroups.com>; Tue, 03 Aug 2021 04:59:04 -0700 (PDT)
X-Received: by 2002:adf:fd90:: with SMTP id d16mr23933088wrr.105.1627991943405;
 Tue, 03 Aug 2021 04:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210802141245.1146772-1-arnd@kernel.org> <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
 <CAL4-wQpKLtSj0xfNUXXLhbtN1wC051jpRneAuLYOi1riZfiinw@mail.gmail.com>
In-Reply-To: <CAL4-wQpKLtSj0xfNUXXLhbtN1wC051jpRneAuLYOi1riZfiinw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 3 Aug 2021 13:58:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2z_xxpz9hAYoBx5=bS81V=TkjEU6WHNhPi1UhQ3UScfw@mail.gmail.com>
Message-ID: <CAK8P3a2z_xxpz9hAYoBx5=bS81V=TkjEU6WHNhPi1UhQ3UScfw@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: remove MaverickCrunch support
To: Martin Guy <martinwguy@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, SoC Team <soc@kernel.org>, 
	Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>, 
	Oleg Nesterov <oleg@redhat.com>, Hubert Feurstein <hubert.feurstein@contec.at>, 
	Lukasz Majewski <lukma@denx.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, jerome.oufella@savoirfairelinux.com
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: arnd@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=ss2oGLsT;       spf=pass
 (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted
 sender) smtp.mailfrom=arnd@kernel.org;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=kernel.org

On Tue, Aug 3, 2021 at 1:41 PM Martin Guy <martinwguy@gmail.com> wrote:
>
> I forward opinion from people currently producing and supporting EP93XX boards:

Thanks a lot for bringing them in. I definitely don't want to remove support for
something that is actively being used, and we don't have to merge the patch
if they currently rely on MaverickCrunch on older platforms.

It does sound however like Jerome's customers are using a normal (softfloat)
Linus distro on EP93xx, rather than one using the original MaverickCrunch
FPU instructions. There are no plans to discontinue EP93xx support, there
is actually a good amount of recent work going into updating the platform.

Jerome, please let me know if I understood you correctly here. If your
customers do rely on MaverickCrunch support in user space, I would
leave that in the kernel for as long as ep93xx itself is supported, and instead
require building support with the GNU assembler to avoid having to
add support to the clang integrated assembler. If you don't know of anyone
using MaverickCrunch, I would go ahead with my patch to remove kernel
support.

      Arnd

> From: Technologic Systems Support Team <support@embeddedarm.com>
> To: martinwguy@gmail.com
> Cc: jerome.oufella@savoirfairelinux.com
>
> > I expect our customers would care if support was dropped.
> > Unfortunately I don't know to what extent.  I'd like to bring
> > Jerome Oufella of Savoir Faire Linux into the conversation here,
> > as he runs the software company who most of our customers
> > contract through when they need a modern Linux kernel running
> > on one of our Cirrus Logic EP93XX series single board computers.
> > I expect his opinion will be more valuable than mine.
> >
> > Good morning Jerome,
> >
> > A member of the Linux Kernel Development community reached out
> > to us this morning letting us know the community has suggested
> > dropping support for the MavericCrunch FPU on the EP9302 processor.
> > Would this impact any of the development your team has been doing
> > for some of our mutual customers?
>
> From: Jerome Oufella<jerome.oufella@savoirfairelinux.com>
> > I am aware of a few companies who rely on variants of the TS-7250
> > running not-too-old LTS releases (4.19, 5.4) to cope with their patch policies.
> >
> > With Linux 5.10 being the next "Super LTS", this presumably brings its
> > support lifespan until about 2030, which (I believe) they would be
> > comfortable with considering the age of the platform.
> >
> > Jerome Oufella
> > Vice-President, Technologies
> > www.savoirfairelinux.com

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAK8P3a2z_xxpz9hAYoBx5%3DbS81V%3DTkjEU6WHNhPi1UhQ3UScfw%40mail.gmail.com.
