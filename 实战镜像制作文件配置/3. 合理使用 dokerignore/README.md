# 实战目的
了解 dockerignore 的作用

# 文件说明

使用 Dockerfile 制作镜像, 并 docker run 创建容器, 进去之后发现 文本文件都没有拷贝进行去

指令步骤: 

1. docker build -t dockerignore:v1.0 .
2. docker run -it --rm dockerignore:v1.0  bash