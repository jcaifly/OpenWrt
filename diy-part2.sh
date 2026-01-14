#!/bin/bash
#
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 1. 修改默认 IP 为 192.168.123.1 (适合 Newifi 习惯)
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# 2. 修改主机名为 Newifi-D2
sed -i 's/hostname=".*"/hostname="Newifi-D2"/g' package/base-files/files/bin/config_generate

# 3. 下载插件源码
# ------------------------------------------------------------------

# (A) 下载 OpenClash (核心组件)
rm -rf package/luci-app-openclash
git clone --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# (B) 下载 关机插件 (luci-app-poweroffdevice)
rm -rf package/luci-app-poweroffdevice
git clone --depth 1 https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice

# 4. 针对 Newifi 3 (D2) 的 WiFi 信号优化
# ------------------------------------------------------------------
# 修改 wifi 默认开启
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
