#!/bin/bash

# 构建基础镜像
docker build -t my-base:22.04 -f Dockerfile.base .

# 构建Redis镜像
cp /var/lib/redis/dump.rdb .
docker build -t my-redis:6.2 -f Dockerfile.redis .

# 构建Supervisor镜像
docker build -t my-supervisor -f Dockerfile.supervisor .

# 拉取其他需要的镜像
docker pull prom/prometheus
docker pull grafana/grafana
docker pull prom/node-exporter
