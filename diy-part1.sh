#!/bin/bash

# 功能: 添加额外的 OpenWrt 软件包源代码
# 运行环境: OpenWrt GitHub Actions or 本地编译环境的根目录

# 参数说明:
# --depth 1: 只克隆最近一次 commit，减少下载时间和空间占用

# 1. 添加 OpenClash 软件包及其 LuCI 界面
echo '添加 OpenClash...'
git clone --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# 2. 添加 Turbo ACC 网络加速引擎软件包及其 LuCI 界面
echo '添加 Turbo ACC...'
git clone --depth 1 https://github.com/chenmozhijin/turboacc.git package/luci-app-turboacc

# 3. 添加关机功能 LuCI 界面
echo '添加 PoweroffDevice...'
git clone --depth 1 https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice

# 4. 添加kmod-nft-fullcone
echo '添加 kmod-nft-fullcone...'
git clone --depth 1 https://github.com/fullcone-nat-nftables/nft-fullcone.git package/kmod-nft-fullcone

# 5. SmartDNS (LuCI 界面)
echo '添加 SmartDNS 源...'
git clone --depth 1 https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

echo 'diy-part1.sh 执行完毕.'
