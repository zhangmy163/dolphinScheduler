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
