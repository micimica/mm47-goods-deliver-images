FROM alpine:latest

RUN apk update && \
#    apk add imagemagick~=6.9.6 --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.5/main && \
    apk add imagemagick --no-cache && \
    apk add pngquant --no-cache
