#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Using independent sources for each key package instead of collection feeds.
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# --- Feed Management ---
# No community collection feeds like 'kenzo' or 'small' will be added.
# echo "Removing potentially conflicting default feeds if necessary..."
# Example: sed -i '/packages.mk/d' feeds.conf.default # Uncomment if needed

# --- Manual Package Cloning ---
# Clone required packages directly from their individual repositories.

echo 'Cloning OpenClash package from vernesong...'
# Clone OpenClash repository
git clone --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash
# Note: Sometimes cloning the repo under a simpler name like 'package/openclash' and letting make find 'luci-app-openclash' inside also works.
# Let's stick to a path that is more likely to be found directly. If build fails finding it, adjust the path.

echo 'Cloning TurboACC package...'
# Clone TurboACC package from immortalwrt-collections (often stable)
git clone --depth 1 https://github.com/immortalwrt-collections/luci-app-turboacc.git package/luci-app-turboacc
# Alternatively, try 'chenmoha' source if the above fails:
# git clone --depth 1 https://github.com/chenmoha/luci-app-turboacc.git package/luci-app-turboacc

echo 'Cloning Partexp (Partition Expansion Tool) package...'
# Clone Partexp package from sirpdboy
git clone --depth 1 https://github.com/sirpdboy/luci-app-partexp.git package/luci-app-partexp

# Add other packages clone commands here if needed
# echo 'Cloning luci-theme-argon...'
# git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

echo 'DIY script part 1 finished.'
