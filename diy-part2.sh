#!/bin/bash
#
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 1. 设置管理地址为 192.168.123.1
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# 2. 设置主机名为 OpenWrt
sed -i 's/hostname=".*"/hostname="OpenWrt"/g' package/base-files/files/bin/config_generate

# 3. 下载插件源码
# ----------------------------------------------------------

# (A) 下载 OpenClash
# 我们先清理可能存在的旧目录，确保干净
rm -rf package/luci-app-openclash
git clone --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# (B) 下载 luci-app-poweroffdevice
rm -rf package/luci-app-poweroffdevice
git clone --depth 1 https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice

# 4. 修复/调整 (针对 Lede 源码的优化)
# ----------------------------------------------------------
# 确保 luci-app-poweroffdevice 编译时能找到正确的路径
# 如果插件结构复杂，通常直接 clone 到 package 根目录即可被识别
