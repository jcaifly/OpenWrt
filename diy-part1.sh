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

# 2. Turbo ACC 网络加速
echo "克隆 TurboACC 软件包 (来自 immortalwrt-collections)..."
git clone --depth 1 https://github.com/chenmozhijin/turboacc.git package/luci-app-turboacc
echo "TurboACC 克隆完成。"

# 3. Partexp (分区扩容工具)
echo "克隆 Partexp 软件包 (来自 sirpdboy)..."
git clone --depth 1 https://github.com/sirpdboy/luci-app-partexp.git package/luci-app-partexp
echo "Partexp 克隆完成。"

# 4. Diskman (图形化磁盘管理)
echo "克隆 Diskman 软件包 (来自 lloyd18)..."
git clone --depth 1 https://github.com/lisaac/luci-app-diskman.git package/luci-app-diskman
echo "Diskman 克隆完成。"

# 5. PoweroffDevice (替代 Advanced Reboot/Shutdown)
echo "克隆 PoweroffDevice 软件包 (来自 sirpdboy)..."
git clone --depth 1 https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice
echo "PoweroffDevice 克隆完成。"

# --- 如果需要其他独立的软件包，请在下方添加 ---
# echo "克隆 xxx 软件包..."
# git clone --depth 1 <你的仓库URL> package/<软件包目录名>
# echo "xxx 克隆完成。"

echo "DIY 脚本第 1 部分执行完毕: 已克隆必要的独立软件包。"
