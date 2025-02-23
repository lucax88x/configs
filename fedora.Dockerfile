FROM fedora:latest

WORKDIR /build

COPY ./scripts /build

WORKDIR /build/scripts

RUN sudo dnf nodejs
RUN npm i
RUN npx tsx install.mts --distro FED
