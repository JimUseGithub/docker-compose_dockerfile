# 目的
理解 Dockerfile 中配置项 CMD 和 ENTRYPOINT 联系和区别

# 基础知识

## 覆盖
在写 Dockerfile 时, ENTRYPOINT 或者 CMD 命令会自动覆盖之前的 ENTRYPOINT 或者 CMD 命令.

在 docker 镜像运行时, 用户也可以在命令指定具体命令, 覆盖在 Dockerfile 里的命令.

如果你希望你的 docker 镜像只执行一个具体程序, 不希望用户在执行 docker run 的时候随意覆盖默认程序. 建议用 ENTRYPOINT.

## Shell 和 Exec 模式
ENTRYPOINT 和 CMD 指令支持 2 种不同的写法: shell 表示法和 exec 表示法.

> CMD 命令语法

```shell
# EXEC 语法
CMD ["executable","param1","param2"] (exec form, this is the preferred form : 执行形式，这是首选形式。)
#用于给 ENTRYPOINT 传入参数，推荐使用
CMD ["param1","param2"] (as default parameters to ENTRYPOINT: 作为 ENTRYPOINT 的默认参数)
#shell 语法
CMD command param1 param2 (shell form)
```

> ENTRYPOINT 语法

```shell
# EXEC 语法
ENTRYPOINT ["executable", "param1", "param2"] (exec form, preferred)
# Shell 语法
ENTRYPOINT command param1 param2 (shell form)
```

当使用 shell 表示法时, 命令行程序作为 sh 程序的子程序运行, docker 用/bin/sh -c 的语法调用. 如果我们用 docker ps 命令查看运行的 docker, 就可以看出实际运行的是/bin/sh -c 命令。这样运行的结果就是我们启动的程序的 PID 不是 1，如果从外部发送任何 POSIX 信号到 docker 容器, 由于/bin/sh 命令不会转发消息给实际运行的命令, 则不能安全得关闭 docker 容器。EXEC 语法没有启动/bin/sh 命令, 而是直接运行提供的命令, 命令的 PID 是 1. 无论你用的是 ENTRYPOINT 还是 CMD 命令, 都强烈建议采用 exec 表示法。


## 组合模式
组合使用 ENTRYPOINT 和 CMD, ENTRYPOINT 指定默认的运行命令, CMD 指定默认的运行参数.ENTRYPOINT 和 CMD 同时存在时, docker 把 CMD 的命令拼接到ENTRYPOINT 命令之后, 拼接后的命令才是最终执行的命令.

# 文件说明

- Dockerfile1, Dockerfile2 演示的多次覆盖
- 参数覆盖: 我们通过指定后面的启动参数，可以覆盖 CMD 的指令，但是 EntryPoint 的无法覆盖

# Shell VS Exec

Shell 模式的 PID 为 1 是 /bin/sh

Exec 模式的 PID 为 1 是 对应的启动命令对应的进程

# 组合
1. 我们新建 Dockerfile5,同时设置 ENTRYPOINT 和 CMD

```Dockerfile
FROM ubuntu:22.04
RUN apt-get update -y && apt install -y iputils-ping
ENTRYPOINT ["/bin/ping","-c","3"]
CMD ["localhost"]
```

2. 此时我们编译镜像然后启动运行看下效果是什么，可以看到 CMD 的内容作为 ENTRYPOINT 的参数添加到了后面
```shell
docker build -t cmd1:v0.5 -f Dockerfile5 .

root@139-159-150-152:/data/myworkdir/dockerfile/cmd# docker run --name shell3 --rm cmd1:v0.5
PING localhost (127.0.0.1) 56(84) bytes of data.

64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.113ms

64 bytes from localhost (127.0.0.1): icmp_seq=2 ttl=64 time=0.032ms

64 bytes from localhost (127.0.0.1): icmp_seq=3 ttl=64 time=0.032ms
```

3. 因为 CMD 的内容可以被替换，如果我们运行的时候替换成另外的一个网站，我们可以看到他会 ping 的是另外一个网站，也就是说 CMD 的参数被替换掉了。

```shell
root@139-159-150-152:/data/myworkdir/dockerfile/cmd# docker run --name shell3 --rm cmd1:v0.5 www.baidu.com

PING www.a.shifen.com (14.119.104.189) 56(84) bytes of data.
```