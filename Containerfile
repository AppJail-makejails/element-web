ARG FREEBSD_RELEASE

FROM ghcr.io/appjail-makejails/nginx:${FREEBSD_RELEASE}

ARG NO_PKGCLEAN

LABEL org.opencontainers.image.title="Element" \
    org.opencontainers.image.description="Glossy Matrix collaboration client for the web" \
    org.opencontainers.image.source="https://github.com/AppJail-makejails/element-web" \
    org.opencontainers.image.url="https://github.com/AppJail-makejails/element-web" \
    org.opencontainers.image.vendor="DtxdF" \
    org.opencontainers.image.authors="Jesús Daniel Colmenares Oviedo <dtxdf@disroot.org>"

RUN set -xe; \
    \
    pkg update; \
    pkg install -U element-web jq moreutils; \
    \
    if [ -z "${NO_PKGCLEAN}" ]; then \
        pkg clean -a; \
        rm -rf /var/cache/pkg/*; \
    fi; \
    rm -rf /var/db/pkg/repos/*

RUN set -xe; \
    \
    cd /usr/local/www/element; \
    cp -a config.sample.json config.json

RUN mkdir -p /usr/local/etc/nginx/templates

COPY 18-load-element-modules.sh /entrypoint.d
COPY default.conf.template /usr/local/etc/nginx/templates

ENV ELEMENT_WEB_PORT=80
ENV ELEMENT_WEB_HOST=localhost
