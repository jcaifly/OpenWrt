#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# 文件名: diy-part1.sh
# 描述: OpenWrt DIY 脚本第 1 部分 (在更新 feeds 之前执行)
# 为必要的第三方软件包使用独立源，不添加聚合型 feed。
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# 本软件依据 MIT 许可证自由分发。
# 更多信息请参阅 /LICENSE 文件。
#

echo "开始执行 diy-part1.sh: 从独立源克隆软件包..."

# --- Feed 管理 ---
# 此处有意不添加任何外部的聚合型 Feed (如 kenzo, small)。
# 确保基础的 feeds.conf.default 文件足以满足核心依赖。

# --- 手动克隆软件包 ---
# 直接从各自的独立仓库克隆所需的软件包。

# 1. OpenClash
echo "克隆 OpenClash 软件包 (来自 vernesong)..."
# 克隆到 'package/' 下，指定明确的目录名有助于查找。
git clone --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash
echo "OpenClash 克隆完成。"

# 2. Turbo ACC 网络加速
echo "克隆 TurboACC 软件包 (来自 immortalwrt-collections)..."
# immortalwrt-collections 中的版本通常比较稳定。
git clone --depth 1 https://github.com/immortalwrt-collections/luci-app-turboacc.git package/luci-app-turboacc
echo "TurboACC 克隆完成。"

# 3. Partexp (分区扩容工具)
echo "克隆 Partexp 软件包 (来自 sirpdboy)..."
git clone --depth 1 https://github.com/sirpdboy/luci-app-partexp.git package/luci-app-partexp
echo "Partexp 克隆完成。"

# 4. Diskman (图形化磁盘管理)
echo "克隆 Diskman 软件包 (来自 lloyd18)..."
# 这个仓库通常同时包含 LuCI 应用和后端的 diskman 工具。
git clone https://github.com/lloyd18/luci-app-diskman.git package/luci-app-diskman
echo "Diskman 克隆完成。"

# 5. Advanced Reboot (替代 Shutdown)
echo "克隆 Advanced Reboot 软件包 (来自 stangri)..."
git clone --depth 1 https://github.com/stangri/luci-app-advanced-reboot.git package/luci-app-advanced-reboot
echo "Advanced Reboot 克隆完成。"

# --- 如果需要其他独立的软件包，请在下方添加相应的 git clone 命令 ---
# 例如:
# echo "克隆 AdGuardHome 软件包..."
# git clone --depth 1 https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

echo "DIY 脚本第 1 部分执行完毕: 已克隆必要的独立软件包。"
