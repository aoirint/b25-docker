FROM ubuntu:bionic

RUN apt-get update \
    && apt-get install -y \
        git \
        build-essential \
        autoconf \
        automake \
        cmake \
        pcscd \
        pcsc-tools \
        libpcsclite-dev

# Install libarib25
# License: Apache-2.0, https://github.com/stz2012/libarib25/blob/master/LICENSE
# https://github.com/stz2012/libarib25
ARG LIBARIB25_VERSION=v0.2.5-20190204
RUN mkdir -p /build \
    && cd /build \
    && git clone https://github.com/stz2012/libarib25.git ./libarib25 \
    && cd ./libarib25 \
    && git checkout "${LIBARIB25_VERSION}" \
    && cmake . \
    && make \
    && make install

WORKDIR /work

ADD entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "b25" ]
