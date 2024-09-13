# 实战目的
通过 Dockerfile，配合 docker compose 完成 mysql 主从集群的搭建


[mysql 主从同步知识](https://blog.csdn.net/weixin_44772566/article/details/136139096)



# mysql 主从集群搭建步骤
1. 创建主库，并在主库中创建单独的 mysql 用户用于同步数据,授予该用户数据同步权限
2. 创建从库，配置从库的数据同步的主库信息
3. 启动从库，开始同步

# 实战操作
要求: 创建一个一主二从的 mysql 集群


# 使用指南
- 启动: 在 ./ 下直接使用 docker compose up -d 即可