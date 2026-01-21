#!/bin/bash
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)

# Modify default IP
sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default hostname
sed -i 's/OpenWrt/K2-Campus/g' package/base-files/files/bin/config_generate

# 添加校园网认证插件（核心）
 1. 锐捷认证（大部分校园网用这个）
git clone https://github.com/ysc3839/luci-app-rp.git package/luci-app-rp
# 2. Dr.COM 认证（部分学校用）
git clone https://github.com/iamybj/luci-app-drcom.git package/luci-app-drcom

# 精简非必要插件
# 注释掉 argon 主题，用默认的 bootstrap
 sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 注释掉其他非必要插件
 git clone https://github.com/EOYOHOO/U2F.git package/U2F
 git clone https://github.com/EOYOHOO/rkp-ipid.git package/rkp-ipid
 
