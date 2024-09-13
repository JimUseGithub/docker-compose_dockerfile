# 第一阶段构建
# AS 给第一阶段镜像取别名
FROM ubuntu:20.04 as builder

# 配置国内源
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

# 设置工作目录
WORKDIR /src

# 安装编译工具
RUN apt-get update && apt-get install -y gcc

# 拷贝源文件
COPY test.c .

# 编译源文件
RUN gcc test.c -o test

# 运行编译后的文件
CMD ["/src/test"]

# 第二阶段构建
FROM busybox
# 拷贝第一阶段生成的可执行程序
COPY --from=builder /src/test /src/test
# 运行可执行程序
CMD ["/src/test"]
