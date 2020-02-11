#!/bin/bash -xe

mv /opt/zookeeper/conf/zoo_sample.cfgas zoo.cfg
./opt/zookeeper/bin/zkServer.sh start
