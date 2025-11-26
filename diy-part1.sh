#!/bin/bash
#
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# 取消注释 helloworld 源 (如果你需要 shadowsocksr 等其他协议，可能需要这个)
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 注意：你要求的插件我们在 Part 2 直接下载源码，这里保持干净即可
