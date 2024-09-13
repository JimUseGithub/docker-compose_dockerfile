# 基础知识

构建 docker 镜像可以有下面两种方式

- 将全部组件及其依赖库的编译、测试、打包等流程封装进一个 docker 镜像中。但是这种方式存在一些问题， 比如 Dockefile 特别长，可护性降低；镜像的层次多，体积大，部署时间长等问题
- 将每个阶段分散到多个 Dockerfile。一个 Dockerfile 负责将项目及其依赖库编译测试打包好后，**然后将运行文件拷贝到运行环境中**，这种方式需要我们编写多个Dockerfile 以及一些自动化脚本才能将其两个阶段自动整合起来

# 实战步骤

1. 有一个 test.c 文件, 我们想用 docker 将 test.c 编译成可执行文件, 然后执行该文件.
2. 编译C语言文件, 需要用到 gcc, 这次选用 centos7, Dockerfile 文件就是一步构建上述要求的
```Dockerfile
FROM ubuntu:20.04

# 配置国内源
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

# 设置工作目录
WORKDIR /src

# 安装编译工具
RUN apt-get update && apt-get install -y gcc

# 编译源文件
RUN gcc test.c -o test

# 拷贝源文件
COPY test.c .

# 运行编译后的文件
CMD ["/src/test"]
```
3. 使用docker build -t multi:v1.0 构建镜像, 并使用 docker ps multi:v1.0, 发现大小有 270MB
```shell
root@zxj:~/docker-compose_dockerfile/实战镜像制作文件配置/4. 多阶段构建# docker images multi:v1.0
REPOSITORY   TAG       IMAGE ID       CREATED              SIZE
multi        v1.0      aeecdd34e18f   About a minute ago   270MB
```
4. 使用多阶段构建, 完成上述功能
```Dockerfile
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
```
5. 最后发现最终结果是一样的, 但是镜像大小区别很大
```shell
root@zxj:~/docker-compose_dockerfile/实战镜像制作文件配置/4. 多阶段构建# docker images multi
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
multi        v2.0      d57475bd5540   43 seconds ago   4.28MB
multi        v1.0      aeecdd34e18f   14 minutes ago   270MB
```