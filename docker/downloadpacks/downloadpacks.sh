#!/bin/bash -xe

workdir="$(dirname "$0")"

_download_pack() {
  _output_file=${1?"output file"}
  _pack_url=${2?"output file"}
  mkdir -p "target/downloadpacks"
  wget --progress=dot -e dotbytes=1M -c \
    -O "target/downloadpacks/$_output_file" "$_pack_url" || true
}

cmd_download() {
  if ! cmd_hashcheck; then
    _download_pack "jdk.tar.gz" 'https://repoz.dextra.com.br/repoz/r/pub/jdk/oracle/jdk-8u91-linux-x64.tar.gz'
    _download_pack "zookeeper.tar.gz" 'http://ftp.unicamp.br/pub/apache/zookeeper/current/apache-zookeeper-3.5.6.tar.gz'
    _download_pack "kafka.tgz" 'http://ftp.unicamp.br/pub/apache/kafka/2.4.0/kafka_2.12-2.4.0.tgz'
    _download_pack "scala.tgz" 'https://downloads.lightbend.com/scala/2.12.8/scala-2.12.8.tgz'  
    _download_pack "spark.tgz" 'http://ftp.unicamp.br/pub/apache/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz'
    _download_pack "sbt.tgz" 'https://piccolo.link/sbt-1.3.8.tgz'
  fi
}

cmd_hashgen(){
  find target -type f | xargs sha256sum -b > SHA256.downloadpacks.txt
}

cmd_hashcheck(){
  sha256sum -c SHA256.downloadpacks.txt
}

cd "$workdir"
_cmd=${1?'command'}
shift
cmd_${_cmd} "$@"
cd -
