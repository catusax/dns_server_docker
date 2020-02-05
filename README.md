### 使用

```
docker pull coolrc/overture
docker run -itd --restart=always -v $PWD/config:/overture -p 53:53/udp coolrc/overture
```

### 检验ECS
```
dig @127.0.0.1 edns-client-sub.net TXT +short
```

返回格式类似如下则ECS可用
```
"{'ecs_payload':{'family':'1','optcode':'0x08','cc':'CA','ip':'47.107.162.0','mask':'24','scope':'0'},'ecs':'True','ts':'1550146974.93','recursive':{'cc':'US','srcip':'173.194.171.8','sport':'51403'}}"
```

### other
更新：增加docker-compose，支持使用nginx部署doh和dot

#### 配置文件
config: overture 配置文件，用于分流查询dns
doh-server: dns-over-https配置
nginx-conf；nginx配置文件，用于配置反代
