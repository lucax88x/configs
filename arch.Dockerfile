FROM archlinux:latest

WORKDIR /build

COPY ./scripts /build

WORKDIR /build/scripts

RUN install.mts --distro ARCH
