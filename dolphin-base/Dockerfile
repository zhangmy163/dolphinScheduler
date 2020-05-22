FROM ubuntu:18.04

MAINTAINER zmy "zhang_my163@163.com"
ENV LANG=C.UTF-8

RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN  apt-get clean
RUN apt-get update && \
    apt-get -y install openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/*
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH
RUN apt-get update && \
        apt-get -y install wget
RUN cd /opt && \
    wget https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.4.14/zookeeper-3.4.14.tar.gz  && \
    tar -zxvf zookeeper-3.4.14.tar.gz  && \
    mv zookeeper-3.4.14 zookeeper && \
    rm -rf ./zookeeper-*tar.gz && \
    mkdir -p /tmp/zookeeper && \
    rm -rf /opt/zookeeper/conf/zoo_sample.cfg

RUN cd /opt && \
    wget http://mirror.bit.edu.cn/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar -zxvf apache-maven-3.3.9-bin.tar.gz && \
    mv apache-maven-3.3.9 maven && \
    rm -rf ./apache-maven-*tar.gz && \
    rm -rf /opt/maven/conf/settings.xml
RUN cd /opt && \
    wget https://nodejs.org/download/release/v8.9.4/node-v8.9.4-linux-x64.tar.gz && \
    tar -zxvf node-v8.9.4-linux-x64.tar.gz && \
    mv node-v8.9.4-linux-x64 node && \
    rm -rf ./node-v8.9.4-*tar.gz
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections

RUN apt-get update && \
        apt-get -y install mysql-server-5.7 && \
        mkdir -p /var/lib/mysql && \
        mkdir -p /var/run/mysqld && \
        mkdir -p /var/log/mysql && \
        chown -R mysql:mysql /var/lib/mysql && \
        chown -R mysql:mysql /var/run/mysqld && \
        chown -R mysql:mysql /var/log/mysql
RUN apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

RUN apt-get update && \
  apt-get -y install sudo && \
  apt-get -y install python && \
  apt-get -y install vim && \
  apt-get -y install iputils-ping && \
  apt-get -y install net-tools && \
  apt-get -y install openssh-server && \
  apt-get -y install python-pip && \
  pip install kazoo
# set env
ENV ZK_HOME=/opt/zookeeper
ENV MAVEN_HOME=/opt/maven
ENV NODE_HOME=/opt/node
ENV PATH $PATH:$MAVEN_HOME/bin:$ZK_HOME/bin:$NODE_HOME/bin
