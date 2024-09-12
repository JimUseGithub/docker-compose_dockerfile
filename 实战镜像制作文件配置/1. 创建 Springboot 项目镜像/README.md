# 目的

掌握 Springboot 微服务如何制作成容器并在容器中启动。

# 文件说明

- spring-docker-demo-jdk17-0.0.1-SNAPSHOT.jar
    - Spring 项目打包的 Java 包
    - 访问的路径是: /hello
    - 使用 openjdk17 的 Java 版本运行该包
    - 运行该 jar 包的命令是 java -jar ./spring-docker-demo-jdk17-0.0.1-SNAPSHOT.jar
- Dockerfile: 制作 springboot 镜像

# 使用步骤

1. cd 到 Dockerfile 对应的目录下
2. 使用下面的命令制作镜像
```shell
docker build -t springboot:v1.0 .
```
3. 运行镜像, 执行下面命令: 
```shell
docker run -d --name springboot1 -p 8888:8080 springboot:v1.0
```
4. 访问 URL `${your ip}:8888/hello`