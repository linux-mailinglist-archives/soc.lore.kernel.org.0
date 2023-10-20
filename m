Return-Path: <devicetree+bounces-10397-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 530EA7D1063
	for <lists+devicetree@lfdr.de>; Fri, 20 Oct 2023 15:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30A181F24141
	for <lists+devicetree@lfdr.de>; Fri, 20 Oct 2023 13:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D181A72E;
	Fri, 20 Oct 2023 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3cIYqEr"
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1E413AC4
	for <devicetree@vger.kernel.org>; Fri, 20 Oct 2023 13:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542EAC433C7;
	Fri, 20 Oct 2023 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697807965;
	bh=W8LXgG2ewDrzWiWrLL7NGWaY6JIzkSkX561ng7/xqFk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h3cIYqErJepDbcFvotvs+dD9sDJOIxPNjIr9G0G0gO2dTLcPPBd/Q4lWc8rD40/jQ
	 GHhV0+lHhUhhepWoIokW5u0UiuWBXVUVNv+W8I6PZeQwpv8ayrjfIkG5jjLKuvGh6/
	 q8L/zU4UNZl2DRFOtmtAZup+6dmV1qOSeHnfkYTeZoGITqn2HToe/0eQ94ytmq1oTs
	 TwvyH0MEYxZv3tOJHhjv/4LhWpU8rqSYjqG+QVwkwXMxoHm+O6LiEODEjr/0qEanC/
	 qyApLdQCv5eAu29lg55ryg2M+M4UU8XWwteu6TiF9L+LwYOQfPfFkGjn5/AamgB03X
	 PAcLTODHfMrdw==
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
	linux-fpga@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: soc: microchip: add a property for system controller flash
Date: Fri, 20 Oct 2023 14:18:39 +0100
Message-Id: <20231020-womanless-doorstop-758bb24e3c8d@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020-agreeably-filing-3d48708e6262@spud>
References: <20231020-agreeably-filing-3d48708e6262@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=QYNqtQRmqa8m1trQZrvsN3s3jWAmJoYnG1s4wHfPYp4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKlGdTpOMQmfSiarRtQZTPukd3Se5pEspmK2pXJpZ/3Lo vvqWY90lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCKaMxh+Mj4snGTN5ivkzmIv s9MyKXzNpi7ZeWEcE18nbLgYUXfQipFhuU7oyujkPwJsdnvuCL58bxHesZMh73jb7MDe6tbIM37 MAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The system controller "shares" a SPI flash device with a QSPI controller
in the MSS. This flash is used to store FPGA bitstreams & other
metadata. IAP and Auto Upgrade both write images to this flash that the
System Controller will use to re-program the FPGA.

Add a phandle property signifying which flash device is connected to the
system controller.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../soc/microchip/microchip,mpfs-sys-controller.yaml   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index 365a9fed5914..a3fa04f3a1bd 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -26,6 +26,16 @@ properties:
   compatible:
     const: microchip,mpfs-sys-controller
 
+  microchip,bitstream-flash:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The SPI flash connected to the system controller's QSPI controller.
+      The system controller may retrieve FPGA bitstreams from this flash to
+      perform In-Application Programming (IAP) or during device initialisation
+      for Auto Update. The MSS and system controller have separate QSPI
+      controllers and this flash is connected to both. Software running in the
+      MSS can write bitstreams to the flash.
+
 required:
   - compatible
   - mboxes
-- 
2.39.2


