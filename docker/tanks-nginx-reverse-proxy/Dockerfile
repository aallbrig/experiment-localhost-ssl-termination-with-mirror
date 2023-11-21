FROM nginx:alpine

# optional build args
# below is used as cert file prefixes
ARG SSL_FILE_PREFIX=tanks-nginx-reverse-proxy
# below are values passed into self signed cert subject
ARG CERT_COUNTRY=US
ARG CERT_STATE=PacificRim
ARG CERT_CITY=Atlantis
ARG CERT_ORGANIZATION=AwesomeCorp
ARG CERT_ORGANIZATIONAL_UNIT=AtlantisEngineering
ARG CERT_COMMON_NAME=localhost

RUN mkdir -p /etc/nginx/logs

RUN apk update && apk add openssl

# generate self-signed certificates (https)
# warning: do not use self-signed certificates in production (this project is merely an experiment)
RUN mkdir -p /etc/nginx/ssl && \
    openssl genrsa -out /etc/nginx/ssl/${SSL_FILE_PREFIX}.key 2048 && \
    openssl req \
      -new \
      -key /etc/nginx/ssl/${SSL_FILE_PREFIX}.key \
      -out /etc/nginx/ssl/${SSL_FILE_PREFIX}.csr \
      -subj "/C=${CERT_COUNTRY}/ST=${CERT_STATE}/L=${CERT_CITY}/O=${CERT_ORGANIZATION}/OU=${CERT_ORGANIZATIONAL_UNIT}/CN=${CERT_COMMON_NAME}" && \
    openssl x509 \
      -req \
      -days 365 \
      -in /etc/nginx/ssl/${SSL_FILE_PREFIX}.csr \
      -signkey /etc/nginx/ssl/${SSL_FILE_PREFIX}.key \
      -out /etc/nginx/ssl/${SSL_FILE_PREFIX}.crt

COPY etc/nginx/conf.d/ /etc/nginx/conf.d/

