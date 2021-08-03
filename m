Return-Path: <clang-built-linux+bncBAABBH7NUSEAMGQEP6GJUSY@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-io1-xd39.google.com (mail-io1-xd39.google.com [IPv6:2607:f8b0:4864:20::d39])
	by mail.lfdr.de (Postfix) with ESMTPS id B68113DEDD8
	for <lists+clang-built-linux@lfdr.de>; Tue,  3 Aug 2021 14:29:20 +0200 (CEST)
Received: by mail-io1-xd39.google.com with SMTP id d7-20020a6b6e070000b02904c0978ed194sf14115444ioh.10
        for <lists+clang-built-linux@lfdr.de>; Tue, 03 Aug 2021 05:29:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627993759; cv=pass;
        d=google.com; s=arc-20160816;
        b=mgWma8ny2QaJoNdKDBPgc4DM5/NFaGIiMQHPc9GAQ/CFLmo1XNbBkvVeWdNeN53Yqx
         +1JI4W470qxjCUjdgr6O9i7dViNwkhTQs4Z8J2ElW/8sRE6FfmM4Xeau/eMtgDAahZF9
         NoXFHKAHtYyqzkR43sbpOCTq4cMTObK9zJDo8TfXvtWWNLGdhR8dH0J/MFMOND6KNsSN
         Q5M9RKXNuhn90jPFMw/p48gxrQHykVQjXYRbSHQ0waKqx9DcvN9OfW6kc418KcJF9gyZ
         yhChpT/jGp54ylnWU7nGg0W2uW/YVN02kDqHdRUvldnuOE1rUNM0wuRCtVchAebi6qgC
         5gvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:list-id:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:sender:dkim-signature;
        bh=4Tn9CU+Hpy30xuHqJPqLtfvA/miVSprEGQG54DZgM1w=;
        b=YLh80Ge+E3GlStOPFiylUaB9bOPSiYC2EklLeKx1iPK1FmvoeI6eV+2Y9cInY5OrHI
         6ruF/BY3xlCAyw6mopLGzMzeXA7zhkCMZvmee73yWb2r57Jo26aXCUz2zXSA40Kz1AP+
         4isYg3b2c1SuRoXr1iAV4SOL3Os3hU7z9oV29DxdiuwFgSH6dT4P0UrC6l00SLXvtZBw
         fUmFj1Dbyo04naFpnBFuTA91XQEO9hdJQh8+uhEKtsk96mQkmIHGLZMoEm/CCucBUB3l
         awysm1KQ5gfVWG8BQIiwCi7uTUXunKL4+Si9lgozo5MmHV6NvoQuHTtSIsk+Wy+bUUvx
         2XMg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ULuqlMlp;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:list-id:cc:x-original-sender
         :x-original-authentication-results;
        bh=4Tn9CU+Hpy30xuHqJPqLtfvA/miVSprEGQG54DZgM1w=;
        b=fwevvRyh0I6u7BgxO+3VuN+vn8IRZ4M2NyzCLwN+xMkFSptq5BSuxwNFP8G3usnUDJ
         IPpRBAC3i2Mj0s3+h/UBF2oVdHP9R70+tlTHVAvLMTt6kUnoD8tv5aNdyYDY+aIiY+mR
         ykwOhEYuMjPPLD5/KGRrk188I+aCf3hS57E4dGdlKoawgdlpnZU6Fnzz0cDWd76q4DOV
         aR1/4VGNOxm0v38W+FQyTlXEzN6jehy87Hqi52qE1QhxjAefVdUQlR2tLqMiyXoL+Gtd
         7cyWTYgmpWrIEj0rfCOB4OS5Pka+s3gk2fN5L8ArWxdprBb5kPcmnPpYfluuXn2dobZ7
         D1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:list-id:cc:x-original-sender
         :x-original-authentication-results;
        bh=4Tn9CU+Hpy30xuHqJPqLtfvA/miVSprEGQG54DZgM1w=;
        b=gKuqQGVyHLuGzTzkVAqmzlMAfhZ5o9gn0ZOMtpCy9fLJPmvz0FvA7Vl8NPyJ03azxC
         x44tYtwQn7JpSskPDsv65CZ4pBkFHd5v3jcY84zVnT5exnRwe+eCq6J7OvugzEUwO0nC
         5/43e3OEQy6I3ovtg0gu9NTUmlejOe0HaLt4R5I9xZVi7vwofGADY7HIeXmqSUprixK7
         HsICkF3znPufl2H42DbapVLurlbCs4ijk3Hsj/JA2y7bmL0H8UF3yfdFMud2zmiHbdXT
         +ZgeooG2NkZVEYxco8ae7sVBJvfBxcdVrfaaL7Z5SIIanIR4QH30O9HmsssJ/ya9RweY
         Dg8Q==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM530c2A3KtkQ06YZHgkGqPz8UmtncycfmkVhSGyJRI2iR6bEToURF
	NP0s09SVt0W/zEG07I8Hz+4=
X-Google-Smtp-Source: ABdhPJz5itUyxxus9++tuiCs7BcH+6f4UawUgEIWpxI7Y2rWURxXvaus8yYtf1NBpFtKTqkn55jJAg==
X-Received: by 2002:a92:508:: with SMTP id q8mr216134ile.89.1627993759733;
        Tue, 03 Aug 2021 05:29:19 -0700 (PDT)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:a05:6e02:1e0d:: with SMTP id g13ls2680718ila.3.gmail; Tue,
 03 Aug 2021 05:29:19 -0700 (PDT)
X-Received: by 2002:a92:d346:: with SMTP id a6mr798570ilh.249.1627993759389;
        Tue, 03 Aug 2021 05:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627993759; cv=none;
        d=google.com; s=arc-20160816;
        b=WGCNjgXSpcw5Hd/gdy0HekVOppubccKiULNBcQVpcpR1tfF5l+1mQL+waGJ4eo93Bb
         4oYrredA/iEfcP7MJtKs0GM2rMyIY/9+6OhULMB3AMOFEbLfbGj1UFnI9lM5t5ukuz90
         2csc+OGaID8K8BFotTDQTKu+g9QLDgdSBCAJREa1iu08bYBheka8hIcwwmVkJptlD2gt
         N8f4MGkSO4RBIh2EAI2ykLk5hd+E69F+eaEgdUYdaEfdBGtBj1JDUzbE3PCcD1IF6Nhw
         /Tu/XdD+e0cEtlGV2B14Hg48zB/wNTQbQ1dssY7wWKIiSXx8a/6II6fM5lZMQMg17/Z4
         CSTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:list-id:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XhsTOcAeRG062Xo4aihE5egTYG1kZn1YxZWIJSIpwe8=;
        b=Gz9cQ26aKTsBb3g6LgM9WCUvq7bX6gLnkCO5IVDzgVp1Nn61HvcTIdbe/xU3iu5sYo
         3D3TtuECNl7sLhXYfcJPGsB9D7jdUFS3vVi1iZtIG9U/91+gekcmqqzdeFtnai5NY4Xr
         /8pZTFffySWYy/jscdPIjxW51mJF/GlI1vzf6YEmpOpGINboejF4/eS1qX6z8aL5TSOw
         u+kcwgn4IoewVjIM4kx8YsKDQqCzLhSYZpQQSDOHOrrub0L25RAQR3+yaJ5QEoPKowzn
         ZnOCH8Wywlsw5uug5pTWmwX2X4WVjlmPlBpt1NV0gE6CxJSFtONyUUzOqN/p4IqlUIG7
         o3XQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ULuqlMlp;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id e12si676086ile.4.2021.08.03.05.29.19
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Aug 2021 05:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id 821B861050
	for <clang-built-linux@googlegroups.com>; Tue,  3 Aug 2021 12:29:18 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id m19so12392832wms.0
        for <clang-built-linux@googlegroups.com>; Tue, 03 Aug 2021 05:29:18 -0700 (PDT)
X-Received: by 2002:a1c:208e:: with SMTP id g136mr4091091wmg.142.1627993756987;
 Tue, 03 Aug 2021 05:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210802141245.1146772-1-arnd@kernel.org> <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
 <CACRpkdbRbgjo1AkZVd0J1nhuo601o8=20rKR+ccaJR1+vqn6qg@mail.gmail.com>
In-Reply-To: <CACRpkdbRbgjo1AkZVd0J1nhuo601o8=20rKR+ccaJR1+vqn6qg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 3 Aug 2021 14:29:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0QTxd4ghTYz7kRWnxLrL8hBQ1PwNuR4ptLw-dOkKmPPg@mail.gmail.com>
Message-ID: <CAK8P3a0QTxd4ghTYz7kRWnxLrL8hBQ1PwNuR4ptLw-dOkKmPPg@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: remove MaverickCrunch support
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Martin Guy <martinwguy@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, SoC Team <soc@kernel.org>, 
	Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>, 
	Oleg Nesterov <oleg@redhat.com>, Hubert Feurstein <hubert.feurstein@contec.at>, 
	Lukasz Majewski <lukma@denx.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: arnd@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=ULuqlMlp;       spf=pass
 (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted
 sender) smtp.mailfrom=arnd@kernel.org;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=kernel.org

On Tue, Aug 3, 2021 at 2:12 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Aug 2, 2021 at 5:45 PM Martin Guy <martinwguy@gmail.com> wrote:
>
> > > was removed from gcc in its 4.8 release in 2012.
> >
> > I was sad about that, as I had managed to get it working correctly in
> > 4.2 4.3 and 4.4.
> > Unfortunately the GCC ARM maintainer at the time was paid by ARM, and
> > they had no interest in it, as I gather the ARM-Cirrus partnership
> > ended up disappointingly.
>
> Political issues aside, have you considered contributing support
> to LLVM instead?
>
> It currently doesn't even support ARMv4 AFAIK but reportedly
> has an easier to use and maintain back-end. (I do not know if
> this is true, I just browsed this:
> https://llvm.org/docs/WritingAnLLVMBackend.html )
> Current ARM Targets are here:
> https://github.com/llvm/llvm-project/tree/main/llvm/lib/Target/ARM
> And they have a very clear and straight-forward developer policy:
> https://llvm.org/docs/DeveloperPolicy.html
>
> If ARMv4 support could be added to LLVM, that would solve
> a lot of my headaches for ARM32, where we have things like
> SA110 being actively maintained.

I think for ARMv4 support, the only thing we need from llvm is
to have R_ARM_V4BX relocations, and for lld to support the
--fix-v4bx switch that turns 'bx' instructions into 'mov' when those
relocations are found. This is something that we have previously
discussed with the llvm developers and that may easily happen.

For the Crunch support, I don't think it's worth spending any effort
on adding that to llvm. If there are any remaining users, they have
probably stopped upgrading their user space long ago (to be
confirmed). The SoC itself has been "not recommended for new
design" since 2019, so we are unlikely to see new users of the platform
in the future, and I think existing users are equally unlikely to move
from softfp to crunch even if they have the option.

       Arnd

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAK8P3a0QTxd4ghTYz7kRWnxLrL8hBQ1PwNuR4ptLw-dOkKmPPg%40mail.gmail.com.
