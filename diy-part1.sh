#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Using independent sources for each key package. NO aggregate feeds used.
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# --- Feed Management ---
# No community collection feeds like 'kenzo' or 'small' will be added from this script.
# Ensure your base feeds.conf.default is sufficient for base dependencies.
echo "Starting diy-part1.sh: Managing packages from independent sources..."

# --- Manual Package Cloning ---
# Clone required packages directly from their individual repositories.

echo "Cloning OpenClash package from vernesong..."
# 克隆 OpenClash 仓库到 'package/' 下，构建系统会自动查找
git clone --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash
echo "OpenClash cloned."

echo "Cloning TurboACC package from immortalwrt-collections..."
# 克隆 TurboACC 仓库
git clone --depth 1 https://github.com/immortalwrt-collections/luci-app-turboacc.git package/luci-app-turboacc
echo "TurboACC cloned."

echo "Cloning Partexp (Partition Expansion Tool) package from sirpdboy..."
# 克隆 Partexp 仓库
git clone --depth 1 https://github.com/sirpdboy/luci-app-partexp.git package/luci-app-partexp
echo "Partexp cloned."

# Add other independent package clone commands here if needed.
# Example:
# echo "Cloning AdGuardHome package..."
# git clone --depth 1 https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

echo "DIY script part 1 finished successfully."
