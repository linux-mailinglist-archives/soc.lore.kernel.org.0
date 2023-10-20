Return-Path: <devicetree+bounces-10399-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3597D1066
	for <lists+devicetree@lfdr.de>; Fri, 20 Oct 2023 15:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDC97B213F8
	for <lists+devicetree@lfdr.de>; Fri, 20 Oct 2023 13:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8E41A72F;
	Fri, 20 Oct 2023 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMlWGu23"
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B080D13AC4
	for <devicetree@vger.kernel.org>; Fri, 20 Oct 2023 13:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7771DC433C8;
	Fri, 20 Oct 2023 13:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697807972;
	bh=ZL13PrWw5K3xVCLgO+me6aIcFTm6lSJbzGmhVs6/ZiE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RMlWGu237ManMtlJWnwlP0qpAkbhHWhU2AnDlm6+N8PLK5ULCZ1TI0dyacKHw+ceI
	 N1m9/nLUF/02XqZITqhVL+4gm0BqcTmU1kokvxQizpQff0iH4PCvtVOFNMg6pLFtK4
	 /BuOQ/abF7/yPmDK+rkPsVB6GJuukjHQSAqZBXBU5JdPjvEqr4vBoQ2gDaZgJA8mlX
	 H5fI1dJXtKEegK6qzdChoyEFKhmfK8vKT/f9WJ4c+/uRo0c9s06XQc5EwpJDk84N7X
	 n4PB0I5JWXqUk2uNzNf4+U2aSyFTAA6aGvYKNoiCzCMro5Jgufb8aII10mQVAsI8At
	 3nrQFS8Y/EecQ==
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
Subject: [PATCH v3 3/6] soc: microchip: mpfs: print service status in warning message
Date: Fri, 20 Oct 2023 14:18:41 +0100
Message-Id: <20231020-algebra-marbling-eb4bc6cafe0b@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020-agreeably-filing-3d48708e6262@spud>
References: <20231020-agreeably-filing-3d48708e6262@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=rzntulbyy2as8lB0cjqZuWUxOpdX+a/pktMf8WEg89o=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKlGdbo8X/pbQzjXlDurtV9UenixcHH0FeuSP4fDnkul/ vsdlV/YUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgImsWcHwP6njJO+Kny9UbY57 Xy9ce6ri9JdfbRMtJs3Slr/n18hob8rIcI/dzMsjRPhiAd/8/w/d5Gs2frxwe37czbStj6Puz5b w5gAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Now that resp_status is set for failed services, print the status in the
error path's warning.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 829d6c511efc..f363f13567f0 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -66,7 +66,9 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, struct
 	 */
 	if (!wait_for_completion_timeout(&sys_controller->c, timeout)) {
 		ret = -EBADMSG;
-		dev_warn(sys_controller->client.dev, "MPFS sys controller service failed\n");
+		dev_warn(sys_controller->client.dev,
+			 "MPFS sys controller service failed with status: %d\n",
+			 msg->response->resp_status);
 	} else {
 		ret = 0;
 	}
-- 
2.39.2


