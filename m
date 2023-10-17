Return-Path: <devicetree+bounces-9296-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB677CC8A6
	for <lists+devicetree@lfdr.de>; Tue, 17 Oct 2023 18:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF7FE2818F8
	for <lists+devicetree@lfdr.de>; Tue, 17 Oct 2023 16:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C4D45F78;
	Tue, 17 Oct 2023 16:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nnmqwu0e"
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39AB45F53
	for <devicetree@vger.kernel.org>; Tue, 17 Oct 2023 16:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D911C433C8;
	Tue, 17 Oct 2023 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697559733;
	bh=BGLcQJ1AIS+kHLin3KQTBMCUf5EKbNVI9D++C1CMJyM=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=Nnmqwu0eZrEhF5zWXqPVOFVakwQjkftnq6TzOp+QYI2fjmBZvkwzbNoSGjQr/YFeQ
	 aD5lG9oCgefLhW7Jlf/GqcLkXj0EqJ/3jogA/i5hVUtYjuzH0Hyb8QwwbouqjY7z/x
	 RhQ1WEX3lB5UHScD2YotQoWWHqBvUCwQQXFcD/lhQVrKjVfeFV7cnxLUxg62BPHUGh
	 zdA6ZYR3ezwFCbp/U0MxxTPIyKeiFE7wmdRwYteL+zCqAjJPtj8YW9nF33x74UeGfF
	 WU3jUD1rG1PO0jUQuiSOFtvGFLrWbWh/Vx3QOnDJdAwFQvt0uF5gfO3Mf3sC+3/ceT
	 AeD3jwh6gXlfA==
Date: Wed, 18 Oct 2023 00:09:59 +0800
From: Jisheng Zhang <jszhang@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Drew Fustini <dfustini@baylibre.com>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus
Message-ID: <ZS6x18XEJXmB7FFL@xhacker>
References: <20230912072232.2455-1-jszhang@kernel.org>
 <20230912-trailing-pampered-52738ec6f009@spud>
 <ZQHSLdPufI6CXApg@xhacker>
 <20230913-faster-spotted-9df41a0d7787@spud>
 <20230920-pesky-stalemate-88f5036b8084@wendy>
 <ZQwL6fxi6IkUEIMc@xhacker>
 <20230921-4a1fe80384e083c67f38dc27@fedora>
 <ZS1uiXORq2IRPnId@x1>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZS1uiXORq2IRPnId@x1>

On Mon, Oct 16, 2023 at 10:10:33AM -0700, Drew Fustini wrote:
> On Thu, Sep 21, 2023 at 11:08:28AM +0100, Conor Dooley wrote:
> > On Thu, Sep 21, 2023 at 05:24:57PM +0800, Jisheng Zhang wrote:
> > > On Wed, Sep 20, 2023 at 09:36:19AM +0100, Conor Dooley wrote:
> > > > Hey Jisheng,
> > > > 
> > > > On Wed, Sep 13, 2023 at 04:44:18PM +0100, Conor Dooley wrote:
> > > > > On Wed, Sep 13, 2023 at 11:15:57PM +0800, Jisheng Zhang wrote:
> > > > > > On Tue, Sep 12, 2023 at 05:27:31PM +0100, Conor Dooley wrote:
> > > > > > > On Tue, Sep 12, 2023 at 03:22:32PM +0800, Jisheng Zhang wrote:
> > > > > > > > riscv select ARCH_DMA_DEFAULT_COHERENT by default, and th1520 isn't
> > > > > > > > dma coherent, so set dma-noncoherent to reflect this fact.
> > > > > > > > 
> > > > > > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > > > > > Tested-by: Drew Fustini <dfustini@baylibre.com>
> > > > > > > > ---
> > > > > > > > 
> > > > > > > > Since v1:
> > > > > > > >  - rebase on v6.6-rc1
> > > > > > > >  - collect Tested-by tag
> > > > > > > 
> > > > > > > Does this mean you're expecting me to take this?
> > > > > > 
> > > > > > Hi Conor,
> > > > > > 
> > > > > > I think I will take this and send PR to soc people. The reason
> > > > > > I send v2 is the rebasing on new rc1 and v1 wasn't in linux-riscv
> > > > > > mailist due to typo;
> > > > > 
> > > > > Great, thanks. Please ask SFR to add your tree to linux-next.
> > > 
> > > Hi Conor,
> > > 
> > > I'm not sure how to do this. When MAINTAINERS patch is merged, send
> > > an email to Stephen Rothwell, are these steps correct?
> > 
> > Sorta, yeah. You don't need to have the MAINTAINERS patch merged first
> > though, just send him a link to your tree and the branch name(s) & he
> > will include it in linux-next.
> > 
> > > > I lost my main x86 box over the weekend (looks like probably a dead
> > > > motherboard), so I may have missed a response to this.
> > > > 
> > > > Did you see this email? Additionally, can you add that git tree to the
> > > > maintainers entry for the thead devicetrees?
> > > 
> > > I just created a tree in
> > > git://git.kernel.org/pub/scm/linux/kernel/git/jszhang/linux.git
> > > 
> > > But it needs time for cgit to take place. I will send a patch
> > > once it appears.
> > 
> > Looks to be there for me now. Thanks for doing this!
> 
> Hi Jisheng, I'm writing the cover letter for v2 of my th1520 mmc series
> and I am wondering if this dma-noncoherent patch is in any tree yet?

Hi Drew,

I forget this patch. Thanks for reminding.

Hi Arnd

This is the only one dt fix for thead SoC, can you please pick it up
for the upcoming -rcN? I knew soc people can directly ask for pick
up for only one fix in the past. Let me know if I need to generate a
formal PR.

Thanks in advace 

