FROM ubuntu:18.04

MAINTAINER Lucas Cardoso

USER root

RUN apt-get -y update
RUN apt-get install -y sudo wget curl vim 

WORKDIR /opt/
COPY downloadpacks downloadpacks/
COPY conf-scripts conf-scripts/
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
#hadoop


RUN tar xzf downloadpacks/target/downloadpacks/zookeeper.tar.gz && \
    mv apache-zookeeper-3.5.6 zookeeper
RUN bash conf-scripts/zookeeper.sh
RUN zookeeper/bin/zkServer.sh start; zookeeper/bin/zkServer.sh stop;

RUN groupadd -g "1001" lucas || true
RUN adduser --disabled-password --uid "1001" --gid "1001" --gecos lucas lucas
RUN groupadd -r supersudo && echo "%supersudo ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/supersudo
RUN usermod -a -G supersudo lucas

USER lucas
ENV HOME /home/lucas
ENV USER lucas
WORKDIR /home/lucas

EXPOSE 8085

CMD /bin/bash
