FROM ubuntu:20.04
LABEL company="ncepu" app="dockerfile" author="zxj" email="123@qq.com"
ENV WEB_ROOT=/data/web/www/
ENV NGINX_VERSION=nginx-1.26.2
# COPY index.html /data/web/html/index.html
COPY index.html ${WEB_ROOT}
WORKDIR /usr/local

# https://nginx.org/download/nginx-1.26.2.tar.gz
ADD https://nginx.org/download/${NGINX_VERSION}.tar.gz ./src1
ADD ${NGINX_VERSION}.tar.gz ./src2

