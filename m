Return-Path: <devicetree+bounces-5541-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 236B67B694C
	for <lists+devicetree@lfdr.de>; Tue,  3 Oct 2023 14:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id D01592815EC
	for <lists+devicetree@lfdr.de>; Tue,  3 Oct 2023 12:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBBF22EE5;
	Tue,  3 Oct 2023 12:45:09 +0000 (UTC)
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F65521A05
	for <devicetree@vger.kernel.org>; Tue,  3 Oct 2023 12:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FD9C433C7;
	Tue,  3 Oct 2023 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696337108;
	bh=RJXkdGT/Nhkeb2GuoSRT2fL7sCAwLnQPGvr69EUBjvI=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=pargP6MBcbO0eqbPYlG8SeUTvjfHoYjB1luHQfdbgcsf8F6ZbM8E4RQBJr98P7G+G
	 UQ+mBqa252CJuexEOSRcyLexoRoN21yqSDH5IY2UsrAdvyhuRaxLXWj2DKKcVasL4K
	 NaPu5ULcg/sSpMng2GlFSyQBnNuDnC5bRUzzQTigJ6OB6jzrKS58DWez8fMryIBxpw
	 5c61WelMqR7e/Kq3TRc9rDkh1gg0wdaDa0IrdMZO/9IcdPHCcx1gv91H97ggSV++u8
	 bTMMMpobvBosOOIkFuOHxB3fl2VFzKK9v00YhbNjQwgVn6SNlsBi8W5DUv4w1oICaM
	 jCLh7o2qwGMEw==
Date: Tue, 3 Oct 2023 08:45:07 -0400
From: Sasha Levin <sashal@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabien Parent <fparent@baylibre.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Jieyy Yang <jieyy.yang@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Seiya Wang <seiya.wang@mediatek.com>, soc@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	stable@vger.kernel.org, Eugen Hristev <eugen.hristev@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH 0/5] MediaTek: Update MAINTAINERS and dts fixes for v6.7
Message-ID: <ZRwM06dwpF/7wEs5@sashalap>
References: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>

On Tue, Oct 03, 2023 at 01:13:42PM +0200, AngeloGioacchino Del Regno wrote:
>Hello SoC maintainers,
>
>As suggested by Arnd in [1], I am sending an update to the MAINTAINERS
>file, adding myself to the MediaTek SoC maintainers, and some urgent
>bugfixes for MediaTek devicetrees.

Just curious: if it's urgent, and there are patches cc'ed to stable, why
wait for 6.7 rather than one of the 6.6 -rc cycles?

-- 
Thanks,
Sasha

