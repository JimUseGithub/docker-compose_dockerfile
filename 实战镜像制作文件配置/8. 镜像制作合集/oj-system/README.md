# 介绍

使用 dockerfile 和 docker-compose.yml 部署在线oj系统




# 目录介绍



[对应的 sql 语句](./mysql/oj-init.sql)





目录说明

- nginx: 负载均衡
- app: 
    - oj-system: 存放 java Spring oj-system微服务
- redis: 缓存
- mysql: 持久化



# 使用说明

### 1. 创建容器

在当前目录下: 
1. docker compose build
2. docker compose up -d

### 2. 数据库数据的准备

进入 mysql-master 容器: 
```shell
docker exec -it mysql-master bash
```

连接数据库: 
```shell
mysql -uroot -proot
```

执行 sql 语句

[对应的 sql 语句](./mysql/oj-init.sql)

### 3. 服务使用

访问网页: http://172.20.45.60:8888/  

这是使用了 nginx 反向代理功能
