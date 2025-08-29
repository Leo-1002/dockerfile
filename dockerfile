# Dockerfile.base
FROM ubuntu:22.04

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 安装基础工具
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gnupg \
    software-properties-common \
    systemd \
    sudo \
    vim \
    && rm -rf /var/lib/apt/lists/*

# 禁用不必要的systemd服务
RUN systemctl mask \
    getty@.service \
    systemd-logind.service \
    systemd-remount-fs.service \
    udev.service \
    sys-kernel-config.mount \
    sys-kernel-debug.mount
