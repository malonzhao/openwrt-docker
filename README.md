# openwrt-container-builder
本项目基于 GitHub Actions 实现 OpenWrt 容器镜像的自动同步与构建。通过定时追踪 OpenWrt 官方 Release，自动编译生成支持 amd64 架构的轻量化路由镜像。

## 🚀 项目特性
1. 极致精简：基于官方 rootfs 打造，仅集成核心插件，移除无用驱动，体积小巧。
2. 全自动同步：每天 00:00 自动检查官方发布，新版本秒速跟进。
3. 配置持久化：配合 Docker Compose，实现系统升级而配置不丢失。
