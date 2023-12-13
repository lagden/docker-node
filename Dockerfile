FROM node:lts-alpine as main
LABEL maintainer="lagden@gmail.com"

ARG TZ=America/Sao_Paulo

# Shared libraries
RUN apk add --no-cache --update libc6-compat libssl3 libcrypto3
# RUN ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2

# Timezone
RUN apk add --no-cache --update tzdata
ENV TZ=$TZ
RUN ln -s /usr/share/zoneinfo/$TZ /etc/localtime

# Clear apk cache
RUN rm -rf /var/cache/apk/*
