### 使用

修改配置文件，用certbot获取证书
```
docker-compose up -d
```

### 检验ECS
```
dig @127.0.0.1 edns-client-sub.net TXT +short

```

返回格式类似如下则ECS可用
```
"{'ecs_payload':{'family':'1','optcode':'0x08','cc':'CA','ip':'47.107.162.0','mask':'24','scope':'0'},'ecs':'True','ts':'1550146974.93','recursive':{'cc':'US','srcip':'173.194.171.8','sport':'51403'}}"
```

#### 配置文件
ts-dns.conf: ts-dns 配置文件，用于分流查询dns
doh-server: dns-over-https配置,默认不开启https，建议用nginx或caddy反代开启https
nginx-conf；nginx配置文件，用于dns-ovre-tls

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
