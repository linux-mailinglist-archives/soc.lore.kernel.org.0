Return-Path: <clang-built-linux+bncBAABBZ7RUWEAMGQEYRLSD4Y@googlegroups.com>
X-Original-To: lists+clang-built-linux@lfdr.de
Delivered-To: lists+clang-built-linux@lfdr.de
Received: from mail-pj1-x1040.google.com (mail-pj1-x1040.google.com [IPv6:2607:f8b0:4864:20::1040])
	by mail.lfdr.de (Postfix) with ESMTPS id E72713DF3A6
	for <lists+clang-built-linux@lfdr.de>; Tue,  3 Aug 2021 19:12:08 +0200 (CEST)
Received: by mail-pj1-x1040.google.com with SMTP id j22-20020a17090a7e96b0290175fc969950sf3638435pjl.4
        for <lists+clang-built-linux@lfdr.de>; Tue, 03 Aug 2021 10:12:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1628010727; cv=pass;
        d=google.com; s=arc-20160816;
        b=V3jQIaxXPZE1Kk416uSkEe0ZkBknidANUQ3E+usDTlsZqfB2UEaNTeB7jkwyeNEQux
         J5V6CEpJYuKuu1hi1m+5+1HVxgSw8no31XD06M+dXc8kUPuX0tqmAxG6ZoMVmspxMMjT
         NorMUk0XmQHflintv7YIkaIDA+7T6o0fRk3g3wiAqs8z9aH6c0jBmcYjCOuwTY8c38Wd
         h4mF6ElI3VbTfJjNtPiTWfb26BKpDSMXmuo/7ri7yH+4p+W4TMonlF5x/8BX7JYsSdtH
         kcXW6YhTqnIRuGowh6D/PJr+hSai5Xvu+7eqscUXSHFba0rwsANC6jH0uvFVZRNhj1zR
         OkQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:list-id:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:sender:dkim-signature;
        bh=wMPMx236/MITMiGnVvncj4q3wp2ogTjk9vqRPN/qtUY=;
        b=s+Wp9Yehz3UfZuJu0pdh0rcybQJlJ/c50Gn6wbkwTC289HnWcMypdM/1tA7YcPlsxq
         aRNOkAtugL4xvaJGx1954A4tLufH6VPpdY+ZN5IhnwKUDIH372aVvRK8HKYWFnRufmLT
         3o2c62K8phhFzbCk+x7YBnOrnGPVrouiWOjEimfkghfYOQtqjIntPeDweOKQXyoqa/YU
         mUQ8hnj5YRdLCKABNgv12XN7HzGNQ/ktf+oaY10qCEum/TkDoXy91iXRJY/kQnTN0+A8
         kZdI8+EIS+KkflQZplL6qklRTJs9+l7OCj+kqCWTrDKy/o0gd5fuvi+0l0TUn2rZ/85C
         HvDg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=hEyoyKRH;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:list-id:cc:x-original-sender
         :x-original-authentication-results;
        bh=wMPMx236/MITMiGnVvncj4q3wp2ogTjk9vqRPN/qtUY=;
        b=hn9ZeCcsm+mrmRTciLDzV9dVtDKsDwS+l7S+oNHPtxMvmrc1Dudx9Q1CVLB+sHspDI
         S6/7SaNX+mUwklCB2cnLAJhF4viN00iMWvBX/e4d+sztSvXSrLlSseiImxleBAuRuA4P
         70XQT94bR7eDvSIw5eYE1W6jAWD3Ey8etCShB++/y4UXQ3oi0vZCAlgR2qgdXKkScyb+
         +N1fWDMbfBP6ZUjpIX8Z808n6K8Ea2P26fwaLivajTWKy/xafHz3eJFCazKK0K3G3jFf
         jBZ+VuxNQmttcRosmBdUa7S0/oaS/tP5ueU7yUJM6RVNMYe1jL3X0A2GM9d6wZK2ZbAD
         TF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:list-id:cc:x-original-sender
         :x-original-authentication-results;
        bh=wMPMx236/MITMiGnVvncj4q3wp2ogTjk9vqRPN/qtUY=;
        b=Tv8yydL4qfp4mlBEKe1K1BF0PMT+nnnQE8bf3FHEx8tFHY0FLt1qxY0X21omUPV5LL
         8YuR9L5PoW2FmG/f951eipOp5FkPEJT26l6yxQHUxYMvo/CofXReYckQf0qHh4xdc8n2
         4MTGbR0IvR7V6qsWNuUWkiG9QL6OCFRJeoKNzZVTJ9PRwfeo6pIL67sq5yJywBFMIcNF
         e9bwPwHQuIwIFozxzir4+pWXZURJBucjvNF/yP3f+axXYNfgTVTdcF3J4PQevrjilyYE
         VisQ53j7JWcWZZTvJbCcxm2cpZ+1HragSxXugN7epTczuP2DhCOjrH/W1FdZ1E86UOXH
         OlZw==
Sender: clang-built-linux@googlegroups.com
X-Gm-Message-State: AOAM532MyIps8fcn8O//4NL8zZRg5ylQtQPeF6XfpYwfN+pl+ct4hg68
	KM/WXQGKBl/rDtRlGmHduKk=
X-Google-Smtp-Source: ABdhPJxs7dWT8gNw7Jq7v6h/BhuMlz6oFCnyV+mPi74NkY2nTfj0MXtbWxJEgOYrqMrRUL5dHp4c0Q==
X-Received: by 2002:a17:902:8544:b029:12c:5752:b0ef with SMTP id d4-20020a1709028544b029012c5752b0efmr19421409plo.18.1628010727432;
        Tue, 03 Aug 2021 10:12:07 -0700 (PDT)
X-BeenThere: clang-built-linux@googlegroups.com
Received: by 2002:a17:902:76c5:: with SMTP id j5ls7331256plt.7.gmail; Tue, 03
 Aug 2021 10:12:07 -0700 (PDT)
X-Received: by 2002:a17:902:dac1:b029:12c:61a8:1f4a with SMTP id q1-20020a170902dac1b029012c61a81f4amr19117207plx.37.1628010726940;
        Tue, 03 Aug 2021 10:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628010726; cv=none;
        d=google.com; s=arc-20160816;
        b=Goyl2wDSd4ut9ZxAYEehrc/VUeiUN65TQeDb8SJW9MpKnj9WNIKnQi561okiIUxPf7
         O1WMMUTE2sk1wf/Ke/wX5ioaTvB+BbsMMteq6uhq2uaHL6TCqCm5XSJ/qsJ2rX1vNmg6
         tSeHcsQ8TrHsKBnH/fJEvT4Ruh+OAKrrqD1zm552lCe97oZYrRoyc7wkVKv9xU5mrIkg
         WW22FuGN3gDxZwBjWK4i/UPEPBB6f+UbSnBM+iimZK4KvIBVRfIGFyiS8P0VEkOdOhJc
         oin9eUdoKnbyM0gO7ADcawtQJ4pXHWATEWD08qKcV7wH44E+qGCZCKHJrXrWa7Ku4t/4
         Nh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:list-id:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dBoXpdjLPyE3+ytmougN6kKfRsPMrU1RgLSWS/GgIlQ=;
        b=qmYsCDZ4y+I8kXMQFtTDCqpSLkuGrlrIsmed2jg6AeZ0xzwD57hxi3dYQ/2KiXmyJO
         IIK+ObhOJbmGV77JNSCSgpfTWCX0X1/2exvy8h32vN1WsX0yE7w2VKiLS6Yz9m8mhgM8
         S+aStbS+l8j6eei0IssRUNkbOoNelEalypZa1vTSTUH0tyIJEpGDVUNiSYdlgcU0ck8S
         0KjtUn60gFZsKjaqPwAtx9tetnZeE6riClMppokIHngFd4X4p1GNni5eXixhIZQB+sEI
         GLFB7VdB7LrwVhhkCUv1lAtokpH6hW/gvcvrzA3bjixnNBDPbtN+H+rJwdL3kQq8NTMb
         DOvw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=hEyoyKRH;
       spf=pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=arnd@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by gmr-mx.google.com with ESMTPS id e1si917748pgk.0.2021.08.03.10.12.06
        for <clang-built-linux@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Aug 2021 10:12:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5F26610FD
	for <clang-built-linux@googlegroups.com>; Tue,  3 Aug 2021 17:12:06 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id n12-20020a05600c3b8cb029025a67bbd40aso2225960wms.0
        for <clang-built-linux@googlegroups.com>; Tue, 03 Aug 2021 10:12:06 -0700 (PDT)
X-Received: by 2002:a1c:208e:: with SMTP id g136mr5372161wmg.142.1628010725128;
 Tue, 03 Aug 2021 10:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210802141245.1146772-1-arnd@kernel.org> <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
 <CAL4-wQpKLtSj0xfNUXXLhbtN1wC051jpRneAuLYOi1riZfiinw@mail.gmail.com>
 <CAK8P3a2z_xxpz9hAYoBx5=bS81V=TkjEU6WHNhPi1UhQ3UScfw@mail.gmail.com> <817752520.64672.1628005929651.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <817752520.64672.1628005929651.JavaMail.zimbra@savoirfairelinux.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 3 Aug 2021 19:11:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a042r2V10WY=M3mvhZS2Q9_iBHLDgSNzJpJEGgNJOD7zQ@mail.gmail.com>
Message-ID: <CAK8P3a042r2V10WY=M3mvhZS2Q9_iBHLDgSNzJpJEGgNJOD7zQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: remove MaverickCrunch support
To: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
List-Id: <soc.lore.kernel.org>
Cc: martinwguy <martinwguy@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, SoC Team <soc@kernel.org>, 
	Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>, 
	Oleg Nesterov <oleg@redhat.com>, Hubert Feurstein <hubert.feurstein@contec.at>, 
	Lukasz Majewski <lukma@denx.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: arnd@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=hEyoyKRH;       spf=pass
 (google.com: domain of arnd@kernel.org designates 198.145.29.99 as permitted
 sender) smtp.mailfrom=arnd@kernel.org;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=kernel.org

On Tue, Aug 3, 2021 at 5:52 PM Jerome Oufella
<jerome.oufella@savoirfairelinux.com> wrote:
>
> You are correct on assuming usage of softfloat toolchains and not
> using the MaverickCrunch unit. AFAIK, I am not aware of active users
> of this FPU on recent setups.

Ok, thank you for the confirmation, I'll queue it up in the soc tree then.

Of course, as there is nothing wrong with the feature other than it
probably having no users and breaking the build when using the
clang integrated assembler, I don't mind reverting it later if we end
up finding a user that does rely on ancient MaverickCrunch binaries
to run on future kernels.

       Arnd

-- 
You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAK8P3a042r2V10WY%3DM3mvhZS2Q9_iBHLDgSNzJpJEGgNJOD7zQ%40mail.gmail.com.
