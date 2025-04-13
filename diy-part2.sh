#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP using uci-defaults (Recommended Method)
echo "Setting default IP to 192.168.123.1 using uci-defaults..."
# 创建一个 uci-defaults 脚本来在首次启动时设置 IP
cat <<EOF > package/base-files/files/etc/uci-defaults/99-default-network-ip
#!/bin/sh
uci -q delete network.lan.ipaddr
uci set network.lan.ipaddr='192.168.123.1'
uci commit network
exit 0
EOF
echo "Default IP will be set to 192.168.123.1 via uci-defaults on first boot."

# --- 以下是您原来文件中被注释掉或无效的部分，根据需要选择性保留或修改 ---

# 【无效/不推荐】原始的修改默认 IP 的方式 (已被上面的 uci-defaults 方式取代)
# sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# 修改默认主题 (如果需要修改主题，取消下面一行的注释，并确保已在 .config 中选中主题)
# echo "Setting default theme..."
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改主机名 (使用 uci-defaults 设置为 "OpenWrt")
echo "Setting default hostname to 'OpenWrt' using uci-defaults..."
cat <<EOF > package/base-files/files/etc/uci-defaults/98-default-hostname
#!/bin/sh
uci -q delete system.@system[0].hostname
uci set system.@system[0].hostname='OpenWrt' # **在这里将主机名设置为 OpenWrt**
uci commit system
exit 0
EOF
echo "Default hostname will be set to 'OpenWrt' via uci-defaults on first boot."

# 【无效/不推荐】原始的修改主机名的方式
# sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# --- 在这里可以添加其他您需要的修改 ---

echo "diy-part2.sh finished."
