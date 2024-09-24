#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i "s/192.168.1.1/$1/g" package/base-files/files/bin/config_generate
echo "设备IP参数为：$1";
#cat package/base-files/files/bin/config_generate
#删除冲突的插件
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}
# Add luci-app-ssr-plus
# pushd package/lean
# git clone --depth=1 https://github.com/fw876/helloworld
# popd

# # Clone community packages to package/community
# mkdir package/community
# pushd package/community

# Add Lienol's Packages
#git clone --depth=1 https://github.com/SuLingGG/openwrt-package

# Add mentohust & luci-app-mentohust.
#git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
#git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add ServerChan
#git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add OpenClash
#git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add luci-app-onliner (need luci-app-nlbwmon)
#git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-adguardhome
#git clone --depth=1 https://github.com/rufengsuixing/luci-app-adguardhome

# Add Rclone-OpenWrt
# git clone --depth=1 https://github.com/ElonH/Rclone-OpenWrt

# Add luci-app-diskman
#git clone --depth=1 https://github.com/lisaac/luci-app-diskman
#mkdir parted
#cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-app-dockerman
#git clone --depth=1 https://github.com/KFERMercer/luci-app-dockerman
#mkdir luci-lib-docker
#curl -s -o ./luci-lib-docker/Makefile https://raw.githubusercontent.com/lisaac/luci-lib-docker/master/Makefile
#rm -rf ../lean/luci-app-docker

# Add luci-theme-argon
# git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
# rm -rf ../lean/luci-theme-argon

# Add tmate
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/tmate
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/msgpack-c

# Add gotop
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/gotop

# Subscribe converters
# svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/subconverter
# svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/jpcre2
# svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/rapidjson

# # Add smartdns
# svn co https://github.com/pymumu/smartdns/trunk/package/openwrt ../smartdns
# svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/luci-app-smartdns ../luci-app-smartdns

# Add udptools
# git clone --depth=1 https://github.com/bao3/openwrt-udp2raw
# git clone --depth=1 https://github.com/bao3/openwrt-udpspeeder
# git clone --depth=1 https://github.com/bao3/luci-udptools

# Add OpenAppFilter
# git clone --depth=1 https://github.com/destan19/OpenAppFilter
# popd

# Fix libssh
# pushd feeds/packages/libs
# rm -rf libssh
# svn co https://github.com/openwrt/packages/trunk/libs/libssh
# popd
#设置版本为当前时间
date=`date +%Y.%m.%d`
TEMP=$(date +"%Y%m%d_%H%M%S")
sed -i -e "/\(# \)\?REVISION:=/c\REVISION:=$date" -e '/VERSION_CODE:=/c\VERSION_CODE:=$(REVISION)' include/version.mk
sed -i "s/OpenWrt /v${TEMP}\/ /g" package/lean/default-settings/files/zzz-default-settings
# 删除自定义源默认的 argon 主题
rm -rf package/lean/luci-theme-argon
# 部分第三方源自带 argon 主题，上面命令删除不掉的请运行下面命令
find ./ -name luci-theme-argon | xargs rm -rf;
# 拉取 argon的源码
git clone --depth=1 https://github.com/cyh92/luci-theme-argon package/luci-theme-argon

#网络设置向导
git clone --depth=1 https://github.com/sirpdboy/luci-app-netwizard package/luci-app-netwizard
#高级设置-Plus
git clone --depth=1 https://github.com/sirpdboy/luci-app-advancedplus package/luci-app-advancedplus
#家长控制
git clone --depth=1 https://github.com/sirpdboy/luci-app-parentcontrol package/luci-app-parentcontrol

