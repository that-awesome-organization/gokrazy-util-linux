FROM debian:latest

WORKDIR /build

RUN apt-get update -y && apt-get install -y wget build-essential bison automake pkg-config libtool gettext autopoint

COPY build.sh .

ENTRYPOINT ["/build/build.sh"]
