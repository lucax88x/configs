FROM archlinux:base-devel

WORKDIR /build

COPY ./scripts /build

WORKDIR /build/scripts

RUN install.mts --distro ARCH
