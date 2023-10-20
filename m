Return-Path: <devicetree+bounces-10402-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D257D1068
	for <lists+devicetree@lfdr.de>; Fri, 20 Oct 2023 15:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27DED1F242FD
	for <lists+devicetree@lfdr.de>; Fri, 20 Oct 2023 13:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4281B27F;
	Fri, 20 Oct 2023 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCulQFNp"
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D56213AC4
	for <devicetree@vger.kernel.org>; Fri, 20 Oct 2023 13:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B9AC433CC;
	Fri, 20 Oct 2023 13:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697807983;
	bh=FKjt/KaFmJSI46WhJ7pa3S/RkyWT3yD5hiIlePpYrXo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iCulQFNpfIK7kBwKZymvsAuuZ2LOpWlbpONcikPr2Btc1TznyMkwjnED6+11czztO
	 qGJuFTgGyETwcqkIteMTrSiFzS6gojKCuMtyeYT28JMTNYd4kAkEXPs6QyxmztTyn2
	 PQdtyWvm06GQrorpYehsgmZM/t0zMUsOxVRo+wyqCDy1wtO8dlXWlVFcWItThaKfE+
	 WTgo6OLFa/tnMYWU+eFVWfy2Ie3U/L0oFvNmhLVWmLZt0QoNKDcfzvNmBhono6Kasm
	 pPqYA6WnKY0tkJ0mSRnkLQC+60Xa/pl1OoDSQBzhEQ5Ke9cki+pqIU8LZiXEQpTZAj
	 5Z9YR9tk2QLpQ==
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Russ Weight <russell.h.weight@intel.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: [PATCH v3 6/6] riscv: dts: microchip: add the mpfs' system controller qspi & associated flash
Date: Fri, 20 Oct 2023 14:18:44 +0100
Message-Id: <20231020-unrated-uproar-c911c6185ae9@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020-agreeably-filing-3d48708e6262@spud>
References: <20231020-agreeably-filing-3d48708e6262@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2959; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=4BpbR+GTABE/n+qrmeRTFWq39N6/xk809jQKmLcvzW4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKlGdXpC/Sz7dEVmnffJS+SVmr5h1fHmBo/gBVUvqtyFV s77v3J5RykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbC/oeRoXvPFq3XF+c+DVxu PUvBpjP5x5YlD/muH3m70+FN8dn66qUM/7TOiNaZeps+t1fTOdygceJ4T7zxb9/uMve/niyJTr7 XuQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The system controller's flash can be accessed via an MSS-exposed QSPI
controller sitting, which sits between the mailbox's control & data
registers. On Icicle, it has an MT25QL01GBBB8ESF connected to it.

The system controller and MSS both have separate QSPI controllers, both
of which can access the flash, although the system controller takes
priority.
Unfortunately, on engineering sample silicon, such as that on Icicle
kits, the MSS' QSPI controller cannot write to the flash due to a bug.
As a workaround, a QSPI controller can be implemented in the FPGA
fabric and the IO routing modified to connect it to the flash in place
of the "hard" controller in the MSS.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../boot/dts/microchip/mpfs-icicle-kit.dts    | 21 +++++++++++++++++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       | 17 +++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 90b261114763..2dae3f8f33f6 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -199,6 +199,27 @@ &syscontroller {
 	status = "okay";
 };
 
+&syscontroller_qspi {
+	/*
+	 * The flash *is* there, but Icicle kits that have engineering sample
+	 * silicon (write?) access to this flash to non-functional. The system
+	 * controller itself can actually access it, but the MSS cannot write
+	 * an image there. Instantiating a coreQSPI in the fabric & connecting
+	 * it to the flash instead should work though. Pre-production or later
+	 * silicon does not have this issue.
+	 */
+	status = "disabled";
+
+	sys_ctrl_flash: flash@0 { // MT25QL01GBBB8ESF-0SIT
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <20000000>;
+		spi-rx-bus-width = <1>;
+		reg = <0>;
+	};
+};
+
 &usb {
 	status = "okay";
 	dr_mode = "host";
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 104504352e99..8f66e2c839ef 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -178,6 +178,12 @@ syscontroller: syscontroller {
 		mboxes = <&mbox 0>;
 	};
 
+	scbclk: mssclkclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <80000000>;
+	};
+
 	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -508,5 +514,16 @@ mbox: mailbox@37020000 {
 			#mbox-cells = <1>;
 			status = "disabled";
 		};
+
+		syscontroller_qspi: spi@37020100 {
+			compatible = "microchip,mpfs-qspi", "microchip,coreqspi-rtl-v2";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x37020100 0x0 0x100>;
+			interrupt-parent = <&plic>;
+			interrupts = <110>;
+			clocks = <&scbclk>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.39.2


