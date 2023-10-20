Return-Path: <devicetree+bounces-10398-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B077D1064
	for <lists+devicetree@lfdr.de>; Fri, 20 Oct 2023 15:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1058C2822E8
	for <lists+devicetree@lfdr.de>; Fri, 20 Oct 2023 13:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47D61A73A;
	Fri, 20 Oct 2023 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V28Owap/"
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F75913AC4
	for <devicetree@vger.kernel.org>; Fri, 20 Oct 2023 13:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026B7C433CB;
	Fri, 20 Oct 2023 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697807969;
	bh=s9lAxVx/i8gVhbCv8vLi9IgysjBUEs18NVeWcNYj0Ec=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V28Owap/115KRZtkoCQubejXzzzg6bOYaD0AOjNoqdvDVQhqjblDi/pRNwp/RtXe4
	 TV9nryX4zRaKt8EQx4SouxE0TGlGUjsAgAIVcdFg7LTfqIiSIZTEXfy/ogHEn94rCl
	 qs+w93fOQ8KdwkEqYFUrrFLJNBh4EaAqJ2155djj4dB29yJQSX+7HXtuzh2yJGn6pB
	 qwa5Jia+FOGUfzKSMCvscYN6EfuKupbgXjSVyghQLJp+l9D/fK9QL0Nyzw8OFg6p3g
	 GmJPTZ/trSPImGPqAqzLcTiWhZoMlztL8zNTlkXZnsCFIAINThdLPQniGj3qA4jAbM
	 BAWI+m3/kKroQ==
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
Subject: [PATCH v3 2/6] soc: microchip: mpfs: enable access to the system controller's flash
Date: Fri, 20 Oct 2023 14:18:40 +0100
Message-Id: <20231020-resigned-discourse-02c29c98b1f5@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020-agreeably-filing-3d48708e6262@spud>
References: <20231020-agreeably-filing-3d48708e6262@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3433; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Q11Jo2EG71WcgZFIltWFHfbZ08soufDP+iiZnaYdgts=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKlGdbomjU0aG0QObtz1KrZm9sUXvywaQ6b5HDqosiBxK ot+4fITHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiIhCojwwbBrTWsqnmLQmaw ML2Lm7et+Vj6zl1GPdMaZd6Le7EvjGJk2Jn1O0297/k0yzDtnr2eT0+t+lTWdiulcvLyVQ+y03+ /ZQIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The system controller has a flash that contains images used to reprogram
the FPGA using IAP (In-Application Programming).
Introduce a function that allows a driver with a reference to the system
controller to get one to a flash device attached to it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/Kconfig               |  1 +
 drivers/soc/microchip/mpfs-sys-controller.c | 20 ++++++++++++++++++++
 include/soc/microchip/mpfs.h                |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/drivers/soc/microchip/Kconfig b/drivers/soc/microchip/Kconfig
index eb656b33156b..9b0fdd95276e 100644
--- a/drivers/soc/microchip/Kconfig
+++ b/drivers/soc/microchip/Kconfig
@@ -1,6 +1,7 @@
 config POLARFIRE_SOC_SYS_CTRL
 	tristate "POLARFIRE_SOC_SYS_CTRL"
 	depends on POLARFIRE_SOC_MAILBOX
+	depends on MTD
 	help
 	  This driver adds support for the PolarFire SoC (MPFS) system controller.
 
diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index fbcd5fd24d7c..829d6c511efc 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -12,6 +12,8 @@
 #include <linux/kref.h>
 #include <linux/module.h>
 #include <linux/jiffies.h>
+#include <linux/mtd/mtd.h>
+#include <linux/spi/spi.h>
 #include <linux/interrupt.h>
 #include <linux/of.h>
 #include <linux/mailbox_client.h>
@@ -30,6 +32,7 @@ struct mpfs_sys_controller {
 	struct mbox_client client;
 	struct mbox_chan *chan;
 	struct completion c;
+	struct mtd_info *flash;
 	struct kref consumers;
 };
 
@@ -99,6 +102,12 @@ static void mpfs_sys_controller_put(void *data)
 	kref_put(&sys_controller->consumers, mpfs_sys_controller_delete);
 }
 
+struct mtd_info *mpfs_sys_controller_get_flash(struct mpfs_sys_controller *mpfs_client)
+{
+	return mpfs_client->flash;
+}
+EXPORT_SYMBOL(mpfs_sys_controller_get_flash);
+
 static struct platform_device subdevs[] = {
 	{
 		.name		= "mpfs-rng",
@@ -114,12 +123,23 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mpfs_sys_controller *sys_controller;
+	struct device_node *np;
 	int i, ret;
 
 	sys_controller = kzalloc(sizeof(*sys_controller), GFP_KERNEL);
 	if (!sys_controller)
 		return -ENOMEM;
 
+	np = of_parse_phandle(dev->of_node, "microchip,bitstream-flash", 0);
+	if (!np)
+		goto no_flash;
+
+	sys_controller->flash = of_get_mtd_device_by_node(np);
+	of_node_put(np);
+	if (IS_ERR(sys_controller->flash))
+		return dev_err_probe(dev, PTR_ERR(sys_controller->flash), "Failed to get flash\n");
+
+no_flash:
 	sys_controller->client.dev = dev;
 	sys_controller->client.rx_callback = mpfs_sys_controller_rx_callback;
 	sys_controller->client.tx_block = 1U;
diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
index f916dcde457f..09722f83b0ca 100644
--- a/include/soc/microchip/mpfs.h
+++ b/include/soc/microchip/mpfs.h
@@ -38,6 +38,8 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, struct mp
 
 struct mpfs_sys_controller *mpfs_sys_controller_get(struct device *dev);
 
+struct mtd_info *mpfs_sys_controller_get_flash(struct mpfs_sys_controller *mpfs_client);
+
 #endif /* if IS_ENABLED(CONFIG_POLARFIRE_SOC_SYS_CTRL) */
 
 #if IS_ENABLED(CONFIG_MCHP_CLK_MPFS)
-- 
2.39.2


