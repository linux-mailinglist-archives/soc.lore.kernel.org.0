Return-Path: <devicetree+bounces-1349-lists+devicetree=lfdr.de@vger.kernel.org>
X-Original-To: lists+devicetree@lfdr.de
Delivered-To: lists+devicetree@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E857A5FC6
	for <lists+devicetree@lfdr.de>; Tue, 19 Sep 2023 12:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10752281B7D
	for <lists+devicetree@lfdr.de>; Tue, 19 Sep 2023 10:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF82915BC;
	Tue, 19 Sep 2023 10:38:22 +0000 (UTC)
X-Original-To: devicetree@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E6A15A6
	for <devicetree@vger.kernel.org>; Tue, 19 Sep 2023 10:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F41C433C7;
	Tue, 19 Sep 2023 10:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695119902;
	bh=Gkr5rArFwD9ZFW+s7UGeG65VF4lv2F9rQQnXUqefg8c=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=a93wZNf1Vd+g13F94BO6VOjIc4ainr7T6GMB2vc6fw1NulFOPwfZjuajtYX7TdN9t
	 MMal76u7TxIU85c3RMJOZ3M9rIGbIvQZslTZ/FFBUuF/ROIBxnj1kyFrsBy9IytYm+
	 xaw1diBqghL+yN5OYtXCwmBO9MdVKvobuT5EKRbbXY9r17ylZ6g1gRhAcdMglpZj/S
	 0/HXMAbqebOT0f0wZPfMtvYpdsp5RHszJbhw8SMjiDAjf9yib9XymYmowVwF7XMnmf
	 vMY8ajrf66Cpd5VlSyoLnOobwfd/4YtFahfuMBnGEdj0XtXtn56imkylYilczbL3R2
	 LxmAzsxLDgAeg==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	devicetree@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 0/7] Turris Omnia MCU driver
Date: Tue, 19 Sep 2023 12:38:08 +0200
Message-ID: <20230919103815.16818-1-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Arnd, Gregorgy and others,

this is v2 of series adding support for Turris Omnia MCU. See the cover
letter from v1:
  https://patchwork.kernel.org/project/linux-soc/cover/20230823161012.6986-1-kabel@kernel.org/

I am also sending this to specific subsystem maintainers as requested by
Krzysztof.

Changes since v1:
- incorporated small changes requested by Krzysztof Kozlowski
- in order to make reviewing simpler, I split the second patch, which
  implements the MCU driver, into four incremental patches:
  - patch 2/7 adds basic driver skeleton
  - patch 3/7 adds GPIO support
  - patch 4/7 adds board poweroff and wakeup support
  - patch 5/7 adds MCU watchdog support

Marek

Marek Behún (7):
  dt-bindings: arm: add cznic,turris-omnia-mcu binding
  platform: cznic: Add preliminary support for Turris Omnia MCU
  platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs
  platform: cznic: turris-omnia-mcu: Add support for poweroff and wakeup
  platform: cznic: turris-omnia-mcu: Add support for MCU watchdog
  ARM: dts: turris-omnia: Add MCU system-controller node
  ARM: dts: turris-omnia: Add GPIO key node for front button

 .../sysfs-bus-i2c-devices-turris-omnia-mcu    |  77 ++
 .../bindings/arm/cznic,turris-omnia-mcu.yaml  |  67 ++
 MAINTAINERS                                   |   4 +
 .../dts/marvell/armada-385-turris-omnia.dts   |  35 +-
 drivers/platform/Kconfig                      |   2 +
 drivers/platform/Makefile                     |   1 +
 drivers/platform/cznic/Kconfig                |  47 +
 drivers/platform/cznic/Makefile               |   7 +
 .../platform/cznic/turris-omnia-mcu-base.c    | 273 +++++
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 971 ++++++++++++++++++
 .../cznic/turris-omnia-mcu-sys-off-wakeup.c   | 245 +++++
 .../cznic/turris-omnia-mcu-watchdog.c         | 126 +++
 drivers/platform/cznic/turris-omnia-mcu.h     | 164 +++
 include/linux/turris-omnia-mcu-interface.h    | 194 ++++
 14 files changed, 2212 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
 create mode 100644 Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml
 create mode 100644 drivers/platform/cznic/Kconfig
 create mode 100644 drivers/platform/cznic/Makefile
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-base.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-gpio.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-watchdog.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu.h
 create mode 100644 include/linux/turris-omnia-mcu-interface.h

-- 
2.41.0


