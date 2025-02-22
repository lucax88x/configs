FROM fedora:latest

WORKDIR /build

COPY ./scripts /build

WORKDIR /build/scripts

RUN dnf module install nodejs:22/common
RUN npm i
RUN npx tsx install.mts --distro FED
