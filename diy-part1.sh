#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# 添加 OpenClash 源码仓库 (Add OpenClash repository)
# 参数 --depth 1 表示只克隆最近一次提交，减小下载量 (Parameter --depth 1 clones only the latest commit to reduce download size)
git clone --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash
echo "Cloned OpenClash repository."

# 添加 PoweroffDevice 源码仓库 (Add PoweroffDevice repository)
git clone --depth 1 https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice
echo "Cloned PoweroffDevice repository."

# 注意：请确保你的编译环境中网络连接正常，以便克隆这些仓库。
# Note: Ensure your build environment has a working internet connection to clone these repositories.

# 可以在此添加更多独立的软件包仓库，遵循一行一个仓库的原则
# You can add more independent package repositories here, following the one-repo-per-line principle.
# 例如: git clone --depth 1 <repo_url> package/<package_name>
# Example: git clone --depth 1 <repo_url> package/<package_name>
