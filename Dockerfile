FROM alpine

LABEL maintainer="https://github.com/coolrc136/Pcap_DNSProxy_docker"

ENV TZ "Asia/Shanghai"
ENV VERSION v1.6.1
ENV DOWNLOAD_URL https://github.com/shawn1m/overture/releases/download/${VERSION}/overture-linux-amd64.zip

RUN apk add --no-cache ca-certificates \
    && wget ${DOWNLOAD_URL} \
    && unzip overture-linux-amd64.zip "overture-linux-amd64"\
    && mkdir overture \
    && rm overture-linux-amd64.zip

CMD /overture-linux-amd64 -c /overture/config.json
    
