ARG ALPINE_BASE=3.21.2
ARG ROMPR_VERSION=2.18

FROM alpine:$ALPINE_BASE

ARG ROMPR_VERSION
ARG BUILD_DATE
ARG VERSION
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="docker-rompr" \
    org.label-schema.version=$VERSION \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/rugarci/docker-rompr" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.schema-version="1.0"

RUN apk add apache2 apache2-utils imagemagick php82-apache2 php82-sqlite3 php82-json php82-pdo php82-pdo_sqlite \
    php82-curl php82-gd php82-mbstring php82-xml php82-simplexml php82-session php82-mysqli php82-pdo_mysql php82-dom \
    php82-fileinfo
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
