# 指定 java 环境基础镜像
FROM openjdk:17
# 指定作者， 在公司内编写的时候最好写上 方便维护
LABEL company="ncepu" app="dockerfile" author="zxj" email="123@qq.com"
# 拷贝 jar 包到容器中
ADD ./spring-docker-demo-jdk17-0.0.1-SNAPSHOT.jar /app.jar
# 运行 jar 包
CMD ["java", "-jar", "/app.jar"]
# 声明暴露的端口
EXPOSE 8080