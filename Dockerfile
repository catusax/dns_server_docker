FROM alpine

LABEL maintainer="https://github.com/coolrc136/Pcap_DNSProxy_docker"

ENV TZ "Asia/Shanghai"
ENV VERSION 1.5-rc3
ENV DOWNLOAD_URL https://github.com/shawn1m/overture/releases/download/v${VERSION}/overture-linux-amd64.zip

RUN apk add --no-cache ca-certificates \
    && wget ${DOWNLOAD_URL} \
    && unzip overture-linux-amd64.zip \
    && mkdir overture \
    && unzip overture-linux-amd64.zip -d overture \
    && rm overture-linux-amd64.zip

CMD /overture-linux-amd64 -c /overture/config.json
    
