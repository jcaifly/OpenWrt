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
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# ==============================================================================
# 自定义软件包源和克隆
# 使用 --depth 1 减少下载量和时间
# 避免使用集合源，每个包使用单独的源
# ==============================================================================

# 添加 SmartDNS 软件包源
# 这个源通常包含 smartdns 二进制和 luci-app-smartdns
# 源地址: https://github.com/pymumu/openwrt-smartdns.git
echo 'src-git smartdns https://github.com/pymumu/openwrt-smartdns.git' >>feeds.conf.default

# 克隆 luci-app-openclash
# 源地址: https://github.com/vernesong/OpenClash.git
git clone --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# 克隆 luci-app-turboacc
# 源地址: https://github.com/chenmozhijin/turboacc.git
git clone --depth 1 https://github.com/chenmozhijin/turboacc.git package/luci-app-turboacc

# 克隆 luci-app-poweroffdevice (关机功能)
# 源地址: https://github.com/sirpdboy/luci-app-poweroffdevice.git
git clone --depth 1 https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice

# 克隆 kmod-nft-fullcone (配合 Firewall4 实现 FullCone NAT)
# 源地址: https://github.com/fullcone-nat-nftables/nft-fullcone.git
git clone --depth 1 https://github.com/fullcone-nat-nftables/nft-fullcone.git package/kmod-nft-fullcone

# 注意：luci-app-smartdns 将从上面添加的 smartdns feed 中获取，不再单独克隆。

# ==============================================================================
# 其他可能的自定义操作，例如修改默认 IP, 主题等，可在此处添加
# 例如：修改默认 IP 为 192.168.2.1
# sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
# ==============================================================================
