FROM jsimonetti/alpine-edge:latest

RUN apk --no-cache add git \
    && apk --no-cache add --virtual deps tar curl && \
    curl -L "https://caddyserver.com/download/linux/amd64?plugins=http.git,tls.dns.cloudflare&license=personal&telemetry=off" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy && \
    curl -L "https://github.com/gohugoio/hugo/releases/download/v0.74.3/hugo_0.74.3_Linux-64bit.tar.gz" \
    | tar --no-same-owner -C /usr/bin -xz hugo && \
    apk del deps

EXPOSE 80/tcp 443/tcp

CMD ["caddy", "--conf", "/Caddyfile"]
