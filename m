Return-Path: <devicetree+bounces-10400-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D04CE7D1065
	for <lists+devicetree@lfdr.de>; Fri, 20 Oct 2023 15:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ACA328228D
	for <lists+devicetree@lfdr.de>; Fri, 20 Oct 2023 13:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538BE1A73C;
	Fri, 20 Oct 2023 13:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnLk/WUF"
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A6213AC4
	for <devicetree@vger.kernel.org>; Fri, 20 Oct 2023 13:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5FFC433C9;
	Fri, 20 Oct 2023 13:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697807976;
	bh=wUfcAwVLdJLWQ59pK55y36rkG58zLUUKiGpO+djR8pw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UnLk/WUF84EUQpsMUd6yNJjo42cnb7280J89gX5Aj3jbS+UrSLYGWoS4HqAfTIbN1
	 tBRqyXAEns5KJMk0MrhFAMpo0Ob22UDy9eGtHKJyTyZ5AHYzOmFbRb1aniOt4E0/L6
	 1JN0r369Tqho4U6WftH0XMA+NMv59JcrsztYiU8K5FJofaqh3avWYYi0b4wGc9I7Gb
	 0OZgrjRcB2+J+CmWMr9cyKPd19k+h6/6ljM0CcwVXcSXvhez7kokuIDgcOcjXM0h8C
	 aYJ6u4GjawepamMaRPyaqnI+uw4MvtyvuUqxzGm+xL7Tp1Y+I6H5sfoaqvCq9Cw3fd
	 6gXDYnMmcGbbQ==
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
Subject: [PATCH v3 4/6] soc: microchip: mpfs: add auto-update subdev to system controller
Date: Fri, 20 Oct 2023 14:18:42 +0100
Message-Id: <20231020-greedless-raffle-ce74c897e505@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020-agreeably-filing-3d48708e6262@spud>
References: <20231020-agreeably-filing-3d48708e6262@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=BV6yRDmsm+YeyYo9mK3USWNMRZ0WU1kcSJPydVNBRrE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKlGdbo9npwyhrsLahMe77zPm7XKgqPNU/dg20cBh0071 Gf0iF/pKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwETecjH8j5SyWfmq7qbUjKf9 qyy6jb1Oz1wQnPCt5OHTCy0v9yk1PWRk2O20eXP+rbCrmokLD2ap8PSmC81b1Hdkscbid4r+x+N 5WQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The PolarFire SoC's system controller offers the ability to re-program
the FPGA from a user application via two, related, mechanisms.
In-Application Programming (IAP) is not ideal for use in Linux, as it
will immediately take down the system when requested. Auto Update is
preferred, as it will only take affect at device power up*, allowing the
OS (and potential applications in AMP) to be shut down gracefully.

* Auto Update occurs at device initialisation, which can also be
  triggered by device reset - possible with the v2023.02 version of the
  Hart Software Services (HSS) and reference design.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index f363f13567f0..35c03ded8501 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -118,7 +118,11 @@ static struct platform_device subdevs[] = {
 	{
 		.name		= "mpfs-generic-service",
 		.id		= -1,
-	}
+	},
+	{
+		.name		= "mpfs-auto-update",
+		.id		= -1,
+	},
 };
 
 static int mpfs_sys_controller_probe(struct platform_device *pdev)
@@ -160,7 +164,6 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sys_controller);
 
-	dev_info(&pdev->dev, "Registered MPFS system controller\n");
 
 	for (i = 0; i < ARRAY_SIZE(subdevs); i++) {
 		subdevs[i].dev.parent = dev;
@@ -168,6 +171,8 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 			dev_warn(dev, "Error registering sub device %s\n", subdevs[i].name);
 	}
 
+	dev_info(&pdev->dev, "Registered MPFS system controller\n");
+
 	return 0;
 }
 
-- 
2.39.2


