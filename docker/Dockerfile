FROM ubuntu:18.04

MAINTAINER Lucas Cardoso

USER root

RUN apt-get -y update
RUN apt-get install -y sudo wget curl vim 

WORKDIR /opt/
COPY downloadpacks downloadpacks/
RUN downloadpacks/downloadpacks.sh download

ENV JAVA_HOME /opt/jdk
ENV PATH $JAVA_HOME/bin:$PATH
RUN tar xzf downloadpacks/target/downloadpacks/jdk.tar.gz && \
    mv jdk1.8.0_91 jdk && \
    java -version

ENV SCALA_HOME /opt/scala
ENV PATH $SCALA_HOME/bin:$PATH
RUN tar xzf downloadpacks/target/downloadpacks/scala.tgz && \
    mv scala-2.12.8 scala && \
    scala -version

ENV SPARK_HOME /opt/spark
ENV PATH $SPARK_HOME/bin:$PATH
RUN tar xzf downloadpacks/target/downloadpacks/spark.tgz && \
    mv spark-2.4.5-bin-hadoop2.7 spark && \
    spark-shell --version


#kafka
#zookeeper
#hadoop


RUN tar xzf downloadpacks/target/downloadpacks/zookeeper.tar.gz && \
    mv apache-zookeeper-3.5.6 zookeeper

CMD /bin/bash
