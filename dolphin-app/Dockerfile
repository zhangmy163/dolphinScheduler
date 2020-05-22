FROM dolphin-base:latest

ADD ./conf/zookeeper/zoo.cfg /opt/zookeeper/conf

# download   
RUN cd /opt && mkdir DolphinScheduler && \
    cd /opt/DolphinScheduler && \
	wget http://mirror.bit.edu.cn/apache/incubator/dolphinscheduler/1.2.0/apache-dolphinscheduler-incubating-1.2.0-dolphinscheduler-backend-bin.tar.gz && \
	tar -zxvf apache-dolphinscheduler-incubating-1.2.0-dolphinscheduler-backend-bin.tar.gz && \
        mv apache-dolphinscheduler-incubating-1.2.0-dolphinscheduler-backend-bin dolphinScheduler-backend && \
	cd /opt/DolphinScheduler && \
        wget http://mirror.bit.edu.cn/apache/incubator/dolphinscheduler/1.2.0/apache-dolphinscheduler-incubating-1.2.0-dolphinscheduler-front-bin.tar.gz && \
	tar -zxvf apache-dolphinscheduler-incubating-1.2.0-dolphinscheduler-front-bin.tar.gz && \
        mv apache-dolphinscheduler-incubating-1.2.0-dolphinscheduler-front-bin dolphinScheduler-ui && \
	rm -f /opt/DolphinScheduler/*.tar.gz

# setting
# backend setting  
ADD ./conf/dolphinscheduler/install-local.sh /opt/DolphinScheduler/dolphinScheduler-backend
ADD ./conf/dolphinscheduler/script/start-all-local.sh /opt/DolphinScheduler/dolphinScheduler-backend/script
ADD ./conf/dolphinscheduler/script/stop-all-local.sh /opt/DolphinScheduler/dolphinScheduler-backend/script
ADD ./conf/dolphinscheduler/script/cp-local.sh /opt/DolphinScheduler/dolphinScheduler-backend/script
ADD mysql-connector-java-5.1.34.jar /opt/DolphinScheduler/dolphinScheduler-backend/lib

# nginx config
ADD ./conf/nginx/default.conf /etc/nginx/conf.d


# mysql config

RUN sed -i -e "$ a [client]\n\n[mysql]\n\n[mysqld]"  /etc/mysql/my.cnf && \
        sed -i -e "s/\(\[client\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/my.cnf && \
        sed -i -e "s/\(\[mysql\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/my.cnf && \
        sed -i -e "s/\(\[mysqld\]\)/\1\ninit_connect='SET NAMES utf8'\ncharacter-set-server = utf8\ncollation-server=utf8_general_ci\nbind-address = 0.0.0.0/g" /etc/mysql/my.cnf

COPY ./startup.sh /root/startup.sh

# chomod
RUN chmod +x /root/startup.sh && \
  chmod +x /opt/DolphinScheduler/dolphinScheduler-backend/script/create-dolphinscheduler.sh  && \
  chmod +x /opt/zookeeper/bin/zkServer.sh && \
  chmod +x /opt/DolphinScheduler/dolphinScheduler-backend/bin/dolphinscheduler-daemon.sh && \
  mv /bin/sh /bin/sh.bak && \
  ln -s /bin/bash /bin/sh && \
  mkdir -p /tmp/xls && \
  cd /opt/DolphinScheduler/dolphinScheduler-backend/ && \
  bash install-local.sh

# port
EXPOSE 2181 2888 3888 3306 80 12345 8888

ENTRYPOINT ["/root/startup.sh"]
