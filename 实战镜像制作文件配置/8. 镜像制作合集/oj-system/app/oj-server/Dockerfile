# 指定 java 环境基础镜像
FROM openjdk:17
# 拷贝 jar 包到容器中
ADD ./oj-server-3.3.4.jar /app.jar

# 暴露端口
EXPOSE 8080

# 运行 jar 包
# CMD ["java", "-jar", "/app.jar","--spring.profiles.active=docker"]
CMD ["java", "-jar", "/app.jar"]
