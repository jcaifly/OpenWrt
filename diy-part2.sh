#!/bin/bash
#
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# --- 1. 系统参数预设 ---
# 修改默认 IP 为 192.168.123.1 (Newifi 经典管理地址)
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# 修改主机名为 Newifi-D2
sed -i 's/hostname=".*"/hostname="Newifi-D2"/g' package/base-files/files/bin/config_generate

# 设置时区为中国上海 (避免 OpenClash 日志时间错误)
sed -i "s/timezone='.*'/timezone='CST-8'/g" package/base-files/files/bin/config_generate
sed -i "/timezone='.*'/a\\\t\tset system.@system[-1].zonename='Asia/Shanghai'" package/base-files/files/bin/config_generate

# --- 2. 插件源码下载 ---
# (A) OpenClash (使用 master 分支以获得最佳内核兼容性)
rm -rf package/luci-app-openclash
git clone --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# (B) 关机插件
rm -rf package/luci-app-poweroffdevice
git clone --depth 1 https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice

# --- 3. 硬件特异性优化 ---
# 默认开启 WiFi (Newifi D2 默认有时是关闭的)
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
