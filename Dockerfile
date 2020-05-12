FROM ubuntu:20.04

ENV SYNCOVERY_HOME=/config
ENV SETUP_TEMP=/tmp/syncovery.tar.gz

# prepare folder(s)
RUN mkdir -p /syncovery

# copy files
ADD ./docker-entrypoint.sh /docker/entrypoint.sh

# install packages
RUN apt-get update 
RUN apt-get install -y bash wget openssl libcrypto++6 libssl-dev sqlite3 libsqlite3-0 libsmbclient

RUN wget -O "$SETUP_TEMP" 'https://www.syncovery.com/release/SyncoveryCL-x86_64-8.67c-Web.tar.gz'
RUN tar -xvf "$SETUP_TEMP" --directory /syncovery
RUN rm -f "$SETUP_TEMP"
RUN chmod +x /syncovery/SyncoveryCL
RUN chmod +x /docker/entrypoint.sh
    
EXPOSE 8999

ENTRYPOINT [ "/docker/entrypoint.sh" ]
