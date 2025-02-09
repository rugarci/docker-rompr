ARG ALPINE_BASE=3.21.2
ARG ROMPR_VERSION=2.18

FROM alpine:${ALPINE_BASE}
RUN apk add apache2 apache2-utils php8-apache2 php8-sqlite3 php8-json php8-pdo php8-pdo_sqlite php8-curl php8-gd php8-mbstring imagemagick php8-xml php8-simplexml php8-session php8-mysqli php8-pdo_mysql php8-dom php8-fileinfo
COPY rompr.conf /etc/apache2/conf.d
COPY run.sh /run.sh

ARG ZIP_FILE=rompr-$ROMPR_VERSION.zip
ARG FETCH_URL=https://github.com/fatg3erman/RompR/releases/download/$ROMPR_VERSION/$ZIP_FILE
ADD $FETCH_URL /
RUN unzip $ZIP_FILE && \
    mkdir -p /rompr/prefs /rompr/albumart && \
    chown -R root:root /rompr && \
    chown apache:apache /rompr/prefs /rompr/albumart

EXPOSE 80
ENTRYPOINT ["/run.sh"]
