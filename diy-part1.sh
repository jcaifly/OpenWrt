#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Using independent sources for required third-party packages.
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

echo "Starting diy-part1.sh: Cloning individual package repositories..."

# --- Feed Management ---
# No community collection feeds added.

# --- Manual Package Cloning ---

# 1. OpenClash
echo "Cloning OpenClash package from vernesong..."
git clone --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash
echo "OpenClash cloned."

# 2. Turbo ACC Network Acceleration
echo "Cloning TurboACC package from immortalwrt-collections..."
git clone --depth 1 https://github.com/immortalwrt-collections/luci-app-turboacc.git package/luci-app-turboacc
echo "TurboACC cloned."

# 3. Partexp (Partition Expansion Tool)
echo "Cloning Partexp package from sirpdboy..."
git clone --depth 1 https://github.com/sirpdboy/luci-app-partexp.git package/luci-app-partexp
echo "Partexp cloned."

# 4. Diskman (图形化磁盘管理)
echo "Cloning Diskman packages from lloyd18..."
git clone https://github.com/lloyd18/luci-app-diskman.git package/luci-app-diskman
echo "Diskman cloned."

# --- Add other necessary independent packages below if required ---

echo "DIY script part 1 finished: Cloned necessary independent packages."
