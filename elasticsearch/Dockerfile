
##
# build via:
#   docker build -t substratus/elasticsearch:$(date +"%Y%m%d") .

FROM ubuntu:15.04

ADD ./docker-entrypoint.sh /docker-entrypoint.sh

RUN \
  apt-get update && \
  apt-get install -y \
  sudo \
  wget \
  curl \
  net-tools \
  netcat \
  openjdk-7-jre-headless

# Make sure the 'ubuntu' user has sudo privileges:
RUN \
  useradd -d /home/ubuntu -m -s /bin/bash ubuntu && \
  echo "ubuntu:changeme" | chpasswd && \
  echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
  sed -i s#/home/ubuntu:/bin/false#/home/ubuntu:/bin/bash# /etc/passwd

RUN \
  wget -O /tmp/elasticsearch.deb https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.4.deb && \
  dpkg --install /tmp/elasticsearch.deb && \
  mkdir -p /data/elasticsearch && \
  chown -R elasticsearch:elasticsearch /data/elasticsearch && \
  update-rc.d elasticsearch defaults 95 10 && \
  echo 'path.data: /data/elasticsearch' | tee -a /etc/elasticsearch/elasticsearch.yml

# ElasticSearch does some kernel config tweaking which breaks under Docker.
RUN \
  perl -p -i -e 's{sysctl}{echo "SKIPPING sysctl because /proc/sys/vm/max_map_count is readonly."\n\t\t\#sysctl}sg' /etc/init.d/elasticsearch

USER ubuntu

ENTRYPOINT ["/docker-entrypoint.sh"]
