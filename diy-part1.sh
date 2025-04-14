#!/bin/bash

#=================================================
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: Your Name
# Blog: https://example.com
#=================================================

# 设置固件源码根目录（如果脚本不在源码根目录执行，可能需要调整）
# WORKDIR=$PWD

# 1. 添加软件包源码

# 添加 OpenClash 源码
# 注意：请确保 OpenClash 及其依赖与你编译的 OpenWrt 版本兼容
echo 'Adding OpenClash source...'
# 进入 package 目录（如果当前目录不是源码根目录，需要调整路径）
# cd $WORKDIR/package
git clone --depth 1 https://github.com/vernesong/OpenClash.git luci-app-openclash
# 如果上一个地址访问有问题，可以尝试镜像
# git clone --depth 1 https://github.com/repo-holder/OpenClash.git luci-app-openclash

# 添加 TurboACC 网络加速源码 (包含 HwNAT 和 SFE)
# 注意：TurboACC 的兼容性可能随 OpenWrt 版本变化，确保它支持你的内核版本
echo 'Adding TurboACC source...'
# cd $WORKDIR/package
git clone --depth 1 https://github.com/chenmozhijin/turboacc.git luci-app-turboacc

# 添加 PoweroffDevice 关机助手源码
echo 'Adding PoweroffDevice source...'
# cd $WORKDIR/package
git clone --depth 1 https://github.com/sirpdboy/luci-app-poweroffdevice.git luci-app-poweroffdevice

# (可选) 如果需要添加其他独立软件包，在此处继续添加 git clone 命令
# 例如:
# echo 'Adding xxx package...'
# git clone --depth 1 <xxx_package_repo_url> package/luci-app-xxx

echo 'diy-part1.sh execution finished.'

# 注意：此脚本只负责添加源码，软件包的选择和编译需要在后续的 .config 文件或 menuconfig 中完成。
# 此脚本默认认为它在 OpenWrt 源码的根目录下运行，GitHub Actions 的 workflow 通常就是这样设置的。
