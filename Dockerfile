FROM debian:stable-slim

RUN apt-get update && apt-get install -y shadowsocks-libev wget unzip && apt-get clean

# v2ray-plugin indir
RUN wget https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.3.2/v2ray-plugin-linux-amd64-v1.3.2.tar.gz \
    && tar -xzf v2ray-plugin-linux-amd64-v1.3.2.tar.gz \
    && mv v2ray-plugin_linux_amd64 /usr/local/bin/v2ray-plugin \
    && rm v2ray-plugin-linux-amd64-v1.3.2.tar.gz

ENV SERVER_ADDR=0.0.0.0
ENV SERVER_PORT=443
ENV PASSWORD=sifre12345
ENV METHOD=chacha20-ietf-poly1305
ENV PORT=3000

CMD ss-server -s $SERVER_ADDR -p $PORT -k $PASSWORD -m $METHOD --plugin v2ray-plugin --plugin-opts "server"
