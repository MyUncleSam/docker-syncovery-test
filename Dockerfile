FROM alpine:3.9.6

ENV SYNCOVERY_HOME=/config
ENV SETUP_TEMP=/tmp/syncovery.tar.gz

ADD ./docker-entrypoint.sh /docker/entrypoint.sh

RUN apk update
RUN apk add bash wget openssl libressl-dev
RUN mkdir /syncovery && \
    wget -O "$SETUP_TEMP" 'https://www.syncovery.com/release/SyncoveryCL-x86_64-8.65-Web.tar.gz' && \
    tar -xvf "$SETUP_TEMP" --directory /syncovery && \
    rm -f "$SETUP_TEMP" && \
    chmod +x /syncovery/SyncoveryCL && \
    chmod +x /docker/entrypoint.sh
    
EXPOSE 8999

ENTRYPOINT [ "/docker/entrypoint.sh" ]
