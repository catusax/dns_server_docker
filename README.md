### 使用

docker pull coolrc/overture
docker run -itd --restart=always -v $PWD/config:/overture -p 53:53/udp coolrc/overture
