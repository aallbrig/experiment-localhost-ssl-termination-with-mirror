FROM alpine:latest AS certs

# optional build args
# below is used as cert file prefixes
ARG SSL_FILE_PREFIX=tanks-apache-reverse-proxy
# below are values passed into self signed cert subject
ARG CERT_COUNTRY=US
ARG CERT_STATE=PacificRim
ARG CERT_CITY=Atlantis
ARG CERT_ORGANIZATION=AwesomeCorp
ARG CERT_ORGANIZATIONAL_UNIT=AtlantisEngineering
ARG CERT_COMMON_NAME=localhost

RUN apk update && apk add openssl

# generate self-signed certificates (support https)
# warning: do not use self-signed certificates in production (this project is merely an experiment)
RUN mkdir -p /etc/ssl && mkdir -p /etc/ssl/private && mkdir -p /etc/ssl/certs && \
    openssl genrsa -out /etc/ssl/private/${SSL_FILE_PREFIX}.key 2048 && \
    openssl req \
      -new \
      -key /etc/ssl/private/${SSL_FILE_PREFIX}.key \
      -out /etc/ssl/private/${SSL_FILE_PREFIX}.csr \
      -subj "/C=${CERT_COUNTRY}/ST=${CERT_STATE}/L=${CERT_CITY}/O=${CERT_ORGANIZATION}/OU=${CERT_ORGANIZATIONAL_UNIT}/CN=${CERT_COMMON_NAME}" && \
    openssl x509 \
      -req \
      -days 365 \
      -in /etc/ssl/private/${SSL_FILE_PREFIX}.csr \
      -signkey /etc/ssl/private/${SSL_FILE_PREFIX}.key \
      -out /etc/ssl/certs/${SSL_FILE_PREFIX}.crt

FROM httpd:alpine

ARG SSL_FILE_PREFIX=tanks-apache-reverse-proxy

COPY usr/local/apache2/htdocs /usr/local/apache2/htdocs
COPY usr/local/apache2/conf/httpd.apache.conf /usr/local/apache2/conf/httpd.conf

# place certs in expected default location (consumed by /usr/local/apache2/conf/extra/httpd-ssl.conf)
COPY --from=certs /etc/ssl/private/${SSL_FILE_PREFIX}.key /usr/local/apache2/conf/server.key
COPY --from=certs /etc/ssl/certs/${SSL_FILE_PREFIX}.crt /usr/local/apache2/conf/server.crt
