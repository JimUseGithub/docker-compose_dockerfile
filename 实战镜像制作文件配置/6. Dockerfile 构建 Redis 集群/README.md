# 实战目的
通过 dockerfile 和 docker compose 完成 redis 集群的搭建，对 dockerfile 和 compose 有进一步的掌握。

# 实战步骤

1. 下载Redis源码: https://download.redis.io/releases/redis-7.0.15.tar.gz 。目的是为了修改相关配置

将 redis.conf 中配置修改如下
```conf
daemonize no
#端口
port 6379
#持久化
dir /data/redis
#启用集群
cluster-enabled yes
#集群参数配置
cluster-config-file nodes.conf
#集群超时时间
cluster-node-timeout 5000
#密码配置
requirepass 123456
#主节点密码配置
masterauth 123456
#表示远端可以连接
bind * -::*
```

2. 创建 ./redis 目录, 在里面编写 Dockerfile 文件, 用于创建自己的 redis 镜像, 见 redis 目录

3. 编写 docker-compose.yml

4. docker compose up -d 即可

