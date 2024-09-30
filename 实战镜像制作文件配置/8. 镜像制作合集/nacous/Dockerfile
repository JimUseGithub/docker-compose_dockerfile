# 基于 openjdk:17.0.2 作为基础镜像, 制作关于 nacos-server-2.2.3 单机版的镜像
FROM openjdk:17.0.2

# 作者信息
MAINTAINER nacos

# 设置时区
ENV TZ=Asia/Shanghai

# 设置环境变量
ENV MODE="standalone"

# 设置工作目录
WORKDIR /

# 复制 nacos-server-2.2.3.tar.gz 到镜像中
COPY nacos-server-2.2.3.tar.gz /

# 解压 nacos-server-2.2.3.tar.gz
RUN tar -zxf nacos-server-2.2.3.tar.gz

# 删除 nacos-server-2.2.3.tar.gz
RUN rm -rf nacos-server-2.2.3.tar.gz


# 暴露端口
EXPOSE 8848

# 启动 nacos-server-2.2.3
CMD ["sh", "/nacos/bin/startup.sh"]

# docker build -t nacous:2.2.3 .
# docker run -d -p 8848:8848 --name nacos nacous:2.2.3