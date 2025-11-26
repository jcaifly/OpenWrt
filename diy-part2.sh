#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# 1. 修改默认 IP 为 192.168.123.1
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# 2. 修改主机名为 OpenWrt (Lede 源码默认可能是 Lede，强制改为 OpenWrt)
sed -i 's/hostname=".*"/hostname="OpenWrt"/g' package/base-files/files/bin/config_generate
