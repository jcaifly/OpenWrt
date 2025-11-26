#!/bin/bash
#
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# 取消注释 helloworld 源 (某些特殊插件可能需要依赖)
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 如果你需要添加其他第三方源，可以在这里添加，例如：
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
