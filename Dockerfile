FROM debian:stable-slim

RUN apt-get update && apt-get install -y shadowsocks-libev simple-obfs

ENV SERVER_ADDR=0.0.0.0
ENV SERVER_PORT=443
ENV PASSWORD=supersecret123
ENV METHOD=chacha20-ietf-poly1305

CMD ss-server -s $SERVER_ADDR -p $SERVER_PORT -k $PASSWORD -m $METHOD --plugin obfs-server --plugin-opts "obfs=http"
