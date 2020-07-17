# 安装

一、构建基础镜像

```
cd dolphin-base
docker build -t dolphin-base -f Dockerfile .
```

二、构建运行镜像

构建1.2.0版本
```
cd dolphin-app-1.2.0
docker build -t dolphin-app:1.2.0 -f Dockerfile .
```

构建1.3.1版本
```
cd dolphin-app-1.3.1
docker build -t dolphin-app:1.3.1 -f Dockerfile .
```

三、运行容器

以1.3.1版本为例
```
docker run -d --name dolphinScheduler-1.3 -p 8888:8888 dolphin-app:1.3.1
```

`docker logs -f dolphinScheduler-1.3`等出现如下日志即可登录服务

```
...
End start alert-server.
启动nginx
 * Stopping nginx nginx
   ...done.
```

http://xx.xx.xx.xx:8888/

admin/dolphinscheduler123

**注意：** 登录系统后，如果要创建流程图需要使用其他用户，admin创建流程图会报错


如果设置流程执行一些命令可能容器里没安装，需自行进入容器docker exec -it dolphinScheduler-1.3 bash，安装需要的命令。


# 1.3.1与1.2.0部署时的差异

1.代码包位置调整

`1.2.0` 前后端分别打包的
>http://mirror.bit.edu.cn/apache/incubator/dolphinscheduler/1.2.0/

`1.3.1` 前后端放在一起
>http://mirror.bit.edu.cn/apache/incubator/dolphinscheduler/1.3.1/

2.前端代码跳转逻辑调整

`1.3.1`相比`1.2.0`的变化,index.html和其调用的js的一些跳转路径都增加了`/dolphinscheduler/ui/`,所以nginx的配置需要有所调整.
>见[nginx配置](dolphin-app-1.3.1/conf/nginx/default.conf)

# 容器里相关部署路径及配置

```
/root
     /startup.sh                                    #docker容器运行的脚本
/opt
    /DolphinScheduler
                     /dolphinScheduler-backend      #后端解压的代码包
                     /dolphinScheduler-ui           #前端代码
                     /ds-backend-run                #后端运行的代码,实际上就是dolphinScheduler-backend拷贝过来的一些目录脚本
    /zookeeper                                      #zookeeper服务
/etc/nginx/conf.d/default.conf                      #配置连接前端目录dolphinScheduler-ui,访问api端口12345
```

`/opt/DolphinScheduler/ds-backend-run/conf`  
```
application-api.properties     #api-server的端口
zookeeper.properties           #zookeeper服务的IP:端口
datasource.properties          #数据库连接的配置
alert.properties               #可配置邮箱服务器
master.properties和worker.properties    #应该时分布式部署时使用的,直在一台服务器启动master和worker则没设置,如果需要分布式,可以尝试修改
```

