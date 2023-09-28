Return-Path: <devicetree+bounces-4397-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BDA7B25AD
	for <lists+devicetree@lfdr.de>; Thu, 28 Sep 2023 21:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 0EFDD281C1A
	for <lists+devicetree@lfdr.de>; Thu, 28 Sep 2023 19:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A712C347A8;
	Thu, 28 Sep 2023 19:09:36 +0000 (UTC)
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972CB320E
	for <devicetree@vger.kernel.org>; Thu, 28 Sep 2023 19:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A92AC433C7;
	Thu, 28 Sep 2023 19:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695928176;
	bh=NNBARFfyUVxajH47uEvpoDKyKg7LrRKhbZajQk0wqWs=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=Jpeng7OPk/BJh4sB9WqNmp6Bgex33CbfWEJvn51eQuVZKN0mGcuo5d9B98ToPOoab
	 DvmHV1FUqe6Kcxwi1MHZNAGiNKFUytxXGSr8gDlTf6+89MVrxKg7fU9FVx5sVHzA7T
	 Iu3MS9iIb6E88fBayNjO6s5fEmulwPbf54YakNVNLCXiGrIgMtuXvw9EswtynzLHOT
	 idiyiPX2y4VCh8LXM/vpoXAtoS7cSDqC13oS6nPZ1LEfPaWUVrpzdUr9QcDARh9vHG
	 sPctY5p/FyWWUxJjjd3eNSZKK5rRjlQ+WHPcniyhfIjVHJI45AmrQdXK4XElQZ5GAE
	 GqZipGd02dHyA==
Received: (nullmailer pid 1073441 invoked by uid 1000);
	Thu, 28 Sep 2023 19:09:32 -0000
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm/arm64: dts: Removed undocumented and unused "pl022,hierarchy" property
Date: Thu, 28 Sep 2023 14:08:45 -0500
Message-Id: <20230928190859.1072420-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "pl022,hierarchy" is not documented, all instances use are 0 and
isn't handled in the kernel driver, so let's just remove it.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Arnd, Please apply this directly.

 arch/arm/boot/dts/st/spear1310-evb.dts              | 2 --
 arch/arm/boot/dts/st/spear1340-evb.dts              | 2 --
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts    | 1 -
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts    | 1 -
 arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts | 2 --
 5 files changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/st/spear1310-evb.dts b/arch/arm/boot/dts/st/spear1310-evb.dts
index 05408df38203..18191a87f07c 100644
--- a/arch/arm/boot/dts/st/spear1310-evb.dts
+++ b/arch/arm/boot/dts/st/spear1310-evb.dts
@@ -352,7 +352,6 @@ stmpe610@0 {
 					#size-cells = <0>;
 					spi-max-frequency = <1000000>;
 					spi-cpha;
-					pl022,hierarchy = <0>;
 					pl022,interface = <0>;
 					pl022,slave-tx-disable;
 					pl022,com-mode = <0>;
@@ -385,7 +384,6 @@ flash@1 {
 					spi-max-frequency = <12000000>;
 					spi-cpol;
 					spi-cpha;
-					pl022,hierarchy = <0>;
 					pl022,interface = <0>;
 					pl022,slave-tx-disable;
 					pl022,com-mode = <0x2>;
diff --git a/arch/arm/boot/dts/st/spear1340-evb.dts b/arch/arm/boot/dts/st/spear1340-evb.dts
index 7700f2afc128..cea624fc745c 100644
--- a/arch/arm/boot/dts/st/spear1340-evb.dts
+++ b/arch/arm/boot/dts/st/spear1340-evb.dts
@@ -445,7 +445,6 @@ flash@0 {
 					spi-max-frequency = <12000000>;
 					spi-cpol;
 					spi-cpha;
-					pl022,hierarchy = <0>;
 					pl022,interface = <0>;
 					pl022,slave-tx-disable;
 					pl022,com-mode = <0x2>;
@@ -461,7 +460,6 @@ stmpe610@1 {
 					spi-max-frequency = <1000000>;
 					spi-cpha;
 					reg = <1>;
-					pl022,hierarchy = <0>;
 					pl022,interface = <0>;
 					pl022,slave-tx-disable;
 					pl022,com-mode = <0>;
diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
index 21149acb6b31..1a65f1ec183d 100644
--- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
+++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
@@ -64,7 +64,6 @@ sdcard0: sdcard@0 {
 		reg = <0>;
 		spi-max-frequency = <20000000>;
 		voltage-ranges = <3200 3400>;
-		pl022,hierarchy = <0>;
 		pl022,interface = <0>;
 		pl022,com-mode = <0x0>;
 		pl022,rx-level-trig = <0>;
diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
index 99205ae1b46b..52f8d36295a8 100644
--- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
+++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
@@ -76,7 +76,6 @@ sdcard0: sdcard@0 {
 		reg = <0>;
 		spi-max-frequency = <20000000>;
 		voltage-ranges = <3200 3400>;
-		pl022,hierarchy = <0>;
 		pl022,interface = <0>;
 		pl022,com-mode = <0x0>;
 		pl022,rx-level-trig = <0>;
diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
index fbf0392b8371..dec5a110f1e8 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
@@ -113,7 +113,6 @@ slic@0 {
 		spi-max-frequency = <5000000>;
 		spi-cpha;
 		spi-cpol;
-		pl022,hierarchy = <0>;
 		pl022,interface = <0>;
 		pl022,slave-tx-disable = <0>;
 		pl022,com-mode = <0>;
@@ -137,7 +136,6 @@ at25@0 {
 		at25,page-size = <64>;
 		spi-cpha;
 		spi-cpol;
-		pl022,hierarchy = <0>;
 		pl022,interface = <0>;
 		pl022,slave-tx-disable = <0>;
 		pl022,com-mode = <0>;
-- 
2.40.1


