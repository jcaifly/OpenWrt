#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# 文件名: diy-part1.sh
# 描述: OpenWrt DIY 脚本第 1 部分 (在更新 feeds 之前执行)
# 为必要的第三方软件包使用独立源。
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# 本软件依据 MIT 许可证自由分发。
# 更多信息请参阅 /LICENSE 文件。
#

echo "开始执行 diy-part1.sh: 从独立源克隆软件包..."

# --- Feed 管理 ---
# 此处不添加任何外部聚合型 Feed。

# --- 手动克隆软件包 ---

# 1. OpenClash
echo "克隆 OpenClash 软件包 (来自 vernesong)..."
git clone --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash
echo "OpenClash 克隆完成。"

# 2. Turbo ACC 网络加速 (使用 chenmozhijin 源)
echo "克隆 TurboACC 软件包 (来自 chenmozhijin)..."
# 注意：此 URL 似乎是当前有效的 TurboACC 来源
git clone --depth 1 https://github.com/chenmozhijin/turboacc.git package/luci-app-turboacc
echo "TurboACC 克隆完成。"

# 3. PoweroffDevice (替代 Advanced Reboot/Shutdown)
echo "克隆 PoweroffDevice 软件包 (来自 sirpdboy)..."
git clone --depth 1 https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice
echo "PoweroffDevice 克隆完成。"

# 4. 手动添加 nft-fullcone 内核模块 (来自 fullcone-nat-nftables) *** 实验性尝试 ***
echo "克隆 nft-fullcone 内核模块 (来自 fullcone-nat-nftables)..."
echo "警告：需要确认此仓库是否为标准 OpenWrt 包且与内核兼容！"
# 尝试克隆到 kmod-nft-fullcone 目录，寄希望于其内部 Makefile 定义包名为 kmod-nft-fullcone
# 如果失败，可能需要检查该仓库结构并调整目录名或手动创建 Makefile
git clone --depth 1 https://github.com/fullcone-nat-nftables/nft-fullcone.git package/kmod-nft-fullcone
echo "nft-fullcone (fullcone-nat-nftables) 内核模块克隆完成。"

# --- 如果需要其他独立的软件包，请在下方添加 ---
# echo "克隆 xxx 软件包..."
# git clone --depth 1 <你的仓库URL> package/<软件包目录名>
# echo "xxx 克隆完成。"

echo "DIY 脚本第 1 部分执行完毕: 已克隆必要的独立软件包。"
