# 指定 java 环境基础镜像
FROM openjdk:17
# 拷贝 jar 包到容器中
ADD ./docker-compose_Dockerfile_nginx_springboot_redis_mysql-0.0.1-SNAPSHOT.jar /app.jar
# 运行 jar 包
CMD ["java", "-jar", "/app.jar","--spring.profiles.active=docker"]