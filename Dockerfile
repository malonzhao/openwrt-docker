# 接收构建参数
ARG OW_TAG

# 第一阶段：构建基础 (使用官方 rootfs)
FROM openwrt/rootfs:x86-64-${OW_TAG}

# -------------------------
# 1. 基础初始化
# -------------------------
RUN mkdir -p /var/lock
RUN opkg update && opkg install coreutils

# -------------------------
# 2. 网络 & 防火墙
# -------------------------
RUN opkg install ip-full iptables-nft ip6tables-nft ipset

# -------------------------
# 3. DNS
# -------------------------
RUN opkg remove dnsmasq --force-removal-of-dependent-packages --autoremove
RUN opkg install dnsmasq-full --force-maintainer

# -------------------------
# 4. 容器 / 虚拟网络依赖
# -------------------------
RUN opkg install kmod-veth kmod-tun kmod-nft-socket kmod-nft-tproxy

# -------------------------
# 5. 其他
# -------------------------
RUN opkg install luci-app-ttyd coreutils-base64 coreutils-nohup curl libuci-lua lua luci-lua-runtime luci-compat luci-lib-jsonc microsocks resolveip

RUN rm -rf /var/opkg-lists/*

USER root
EXPOSE 80
CMD ["/sbin/init"]
