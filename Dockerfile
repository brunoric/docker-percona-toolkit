FROM alpine:3.5
MAINTAINER Bruno Ricardo Siqueira <brunoric@gmail.com>

ENV PERCONA_TOOLKIT_VERSION 3.0.4
ENV PERCONA_TOOLKIT_MD5_CHECKSUM a2a3c67ade741ebbb8cd3bf54380cd61

RUN set -x \
  && apk add --update perl perl-dbi perl-dbd-mysql perl-io-socket-ssl perl-term-readkey make ca-certificates wget \
  && update-ca-certificates \
  && wget -O /tmp/percona-toolkit.tar.gz https://www.percona.com/downloads/percona-toolkit/${PERCONA_TOOLKIT_VERSION}/source/tarball/percona-toolkit-${PERCONA_TOOLKIT_VERSION}.tar.gz \
  && echo "${PERCONA_TOOLKIT_MD5_CHECKSUM}  /tmp/percona-toolkit.tar.gz" | md5sum -c - \
  && tar -xzvf /tmp/percona-toolkit.tar.gz -C /tmp \
  && cd /tmp/percona-toolkit-${PERCONA_TOOLKIT_VERSION} \
  && perl Makefile.PL \
  && make \
  && make test \
  && make install \
  && apk del make ca-certificates wget \
  && rm -rf /var/cache/apk/* /tmp/percona-toolkit*