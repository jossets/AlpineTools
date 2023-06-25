FROM alpine:3.17


RUN sed -i '/#http:\/\/dl-cdn.alpinelinux.org\/alpine\/v3.17\/community/c\http:\/\/dl-cdn.alpinelinux.org\/alpine\/v3.17\/community' /etc/apk/repositories
RUN apk update
RUN apk --no-cache add make gcc g++ musl-dev binutils autoconf automake libtool pkgconfig check-dev file patch openssl-dev perl

COPY john-1.9.0-jumbo-1.tar.gz /tmp/john/john-1.9.0-jumbo-1.tar.gz
COPY john_param.h /tmp/john/
COPY go_compile.sh /tmp/john/ 

RUN  chmod a+x /tmp/go_compile.sh && cd tmp/john && ./go_compile.sh



