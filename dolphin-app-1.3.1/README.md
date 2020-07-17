# 一、前端

配置nginx访问前端目录下

配置要访问的后台api服务的路径dolphinscheduler,127.0.0.1:12345

# 二、后端

因为原始的install.sh是根据文本前部分的配置，替换conf下相关文件的内容，然后根据ips，来ssh和scp，但是该Docker只是本机装，所以调整修改出一个install-local.sh的脚本，只做替换配置和cp。


