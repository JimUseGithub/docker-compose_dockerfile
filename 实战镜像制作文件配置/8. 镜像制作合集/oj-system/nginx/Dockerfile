FROM nginx:1.24.0
COPY ./bit.conf /etc/nginx/conf.d/
CMD ["nginx","-g","daemon off;"]
ENTRYPOINT ["/docker-entrypoint.sh"]