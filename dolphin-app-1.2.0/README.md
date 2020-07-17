>参考[其他人的1.1版本docker](https://www.cqmaple.com/201909/incubator-dolphinscheduler-easyscheduler-docker-build.html)写的1.2版本docker

>https://github.com/ww1516123/incubator-dolphinscheduler-base

>https://github.com/ww1516123/incubator-dolphinscheduler-app

>1.2版本 http://www.mamicode.com/info-detail-2887911.html

一、构建基础镜像

```
cd dolphin-base
docker build -t dolphin-base -f Dockerfile .
```

二、构建运行镜像

```
cd dolphin-app
docker build -t dolphin-app:1.2.0 -f Dockerfile .
```

三、运行容器

```
docker run -d --name dolphinScheduler-1.2 -p 8888:8888 dolphin-app:1.2.0
```

http://xx.xx.xx.xx:8888/

admin/dolphinscheduler123

Dockerfile分开写的，后续有时间可以弄成分阶段构建的方式


# 一、前端

配置nginx访问前端目录下的dist

配置要访问的后台api服务的路径dolphinscheduler,127.0.0.1:12345

# 二、后端

因为原始的install.sh是根据文本前部分的配置，替换conf下相关文件的内容，然后根据ips，来ssh和scp，但是该Docker只是本机装，所以调整修改出一个install-local.sh的脚本，只做替换配置和cp。

**注意**：容器里相互访问，相关服务ip需写成127.0.0.1，或者写成宿主机ip的话，启动容器需要把端口映射出来（此方法未测试）
