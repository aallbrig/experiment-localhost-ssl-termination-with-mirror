FROM nginx:alpine

COPY etc/nginx/conf.d/ /etc/nginx/conf.d/
COPY game-web-client-build/ /usr/share/nginx/html/

RUN chown -R nginx:nginx /usr/share/nginx/html/
RUN rm /etc/nginx/conf.d/default.conf

EXPOSE 80
