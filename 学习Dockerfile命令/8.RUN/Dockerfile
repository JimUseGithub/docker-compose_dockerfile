FROM ubuntu:20.04
LABEL company="ncepu" app="dockerfile" author="zxj" email="123@qq.com"
ENV WEB_ROOT=/data/web/www/
ENV NGINX_VERSION=nginx-1.26.2

#1.安装 build-essential 构建工具
#2.安装依赖包 libpcre3 libpcre3-dev zlib1g-dev 依赖库
RUN apt-get update -y && apt install -y build-essential libpcre3 libpcre3-dev zlib1g-dev

# COPY index.html /data/web/html/index.html
COPY index.html ${WEB_ROOT}
WORKDIR /usr/local

# https://nginx.org/download/nginx-1.26.2.tar.gz
ADD https://nginx.org/download/${NGINX_VERSION}.tar.gz ./src
ADD ${NGINX_VERSION}.tar.gz ./src2
#解压
RUN cd ./src && tar zxvf ${NGINX_VERSION}.tar.gz

#3.进入 nginx 目录
#4.执行编译和构建
RUN cd ./src/${NGINX_VERSION} && \
    ./configure --prefix=/usr/local/nginx && \
    make && make install
COPY nginx.conf ./nginx/conf
