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
todo:由于国内tls查询会有概率被阻断，等待overture正式版支持https查询后，上游dns改为https。

#### 配置文件
config: overture 配置文件，用于分流查询dns
doh-server: dns-over-https配置
nginx-conf；nginx配置文件，用于配置反代

### 使用方法
#### 安卓
打开系统私人dns设置，填入域名

#### windows/linux
推荐使用`dnscrypt-proxy`，windows端有`simple dnscrypt-proxy`。直接安装即可。

`dnscrypt-proxy`使用的是`DNS Stamp`链接，所以我们要到这个网站[https://dnscrypt.info/stamps/](https://dnscrypt.info/stamps/)，填入自己的ip地址和域名，得到一个`sdns`开头的链接

然后找到`dnscrypt-proxy`的配置文件`dnscrypt-proxy.toml`,在文件最后填入

```
[static]
  [static.'my-server-name']
    stamp = 'sdns://AQECAAAAAAAADzUxLjE1LjM4LjYyOjQ0MyAoYoU8wLCvBo9-4ZoJZg_zGYPC0uWTQl9fdRTDpgn7xsyLmRuc2NyeXB0LWNlcnQuZXhhbXBsZS5jb20'
```

然后`server_names = ['my-server-name']`填入你自定义的服务器名称
