FROM node:18.12-alpine3.15
LABEL maintainer="lagden@gmail.com"

# If Docker Host is Mac or Windows (deprecated - `node --watch`)
ENV ENTR_INOTIFY_WORKAROUND=1
COPY --from=lagden/entr:5.2-alpine3.15 /usr/local/bin/entr /usr/local/bin/.

# Shared libraries
RUN apk add --no-cache --update libc6-compat
RUN ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2

# Timezone
RUN apk add --no-cache --update tzdata
ENV TZ=America/Sao_Paulo
RUN ln -s /usr/share/zoneinfo/$TZ /etc/localtime

# Clear apk cache
RUN rm -rf /var/cache/apk/*

# pnpm
RUN npm i -g pnpm
