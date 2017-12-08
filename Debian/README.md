

# 1、脚本地址

```
wget -N --no-check-certificate https://raw.githubusercontent.com/wsj195328/linux-profile/master/Debian/pBBR.sh
```


# 2、选择NO,然后提示重启

![1](http://ov2frenna.bkt.clouddn.com/2320108106.png)

# 3、运行bbr,一次运行，下次开机自启动的
```
bash bbr.sh start
```

# 4、查看魔改 BBR 状态
```
sysctl net.ipv4.tcp_available_congestion_control
```
![2](http://ov2frenna.bkt.clouddn.com/1512713968545.jpg)
