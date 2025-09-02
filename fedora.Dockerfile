FROM fedora:latest

WORKDIR /build

COPY . /build

RUN sudo dnf install -y nodejs

RUN npm i

RUN npx tsx ./scripts/install.mts --distro FED
