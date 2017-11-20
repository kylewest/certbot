FROM certbot/certbot

RUN apk update

ENV PYMSSQL_BUILD_WITH_BUNDLED_FREETDS=1

RUN apk add --no-cache --virtual .mssql-deps \
        gcc \
        linux-headers \
        openssl-dev \
        musl-dev \
        libffi-dev \
    && pip install --no-cache-dir \
        pymssql \
    && apk del .mssql-deps
