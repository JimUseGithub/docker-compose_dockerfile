FROM ubuntu:20.04 as buildstage
# 配置国内镜像源
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
# 更新源
RUN apt-get update
# 下载软件
RUN apt-get update && apt-get install -y \
    gcc \
    make \
    && rm -rf /var/lib/apt/lists/*


# 添加相关文件
# 添加redis-7.0.15.tar.gz
ADD redis-7.0.15.tar.gz /
# 添加 redis.conf
ADD redis.conf /redis/
# 设置工作目录
WORKDIR /redis-7.0.15

RUN make
RUN mv /redis-7.0.15/src/redis-server /redis/ && mv /redis-7.0.15/src/redis-cli /redis/
ENTRYPOINT ["/redis/redis-server", "/redis/redis.conf"]

FROM ubuntu:20.04
RUN mkdir -p /data/redis && mkdir -p /redis
COPY --from=buildstage /redis /redis
EXPOSE 6379
ENTRYPOINT ["/redis/redis-server", "/redis/redis.conf"]