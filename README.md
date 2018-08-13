# Pcap_DNSProxy_docker
Dockerfile for Pcap_DNSProxy

[Dockerhub repo](https://hub.docker.com/r/coolrc/pcap_dnsproxy_docker/)

# 运行
```
docker run -v /path/to/pcapdns:/etc/pcapdns -p 53:53/tcp -p53:53/udp coolrc/pcap_dnsproxy_docker
```

### 注意
由于dns服务器使用了`udp53`端口，而一般的`-p 53:53` 只能绑定`tcp`，所以需要使用`-p 53:53/tcp -p53:53/udp`参数
