
##
# build via:
#   docker build -t substratus/kibana:$(date +"%Y%m%d") .

FROM ubuntu:15.04

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN \
  apt-get update && \
  apt-get install -y \
  sudo \
  nginx

COPY ./nginx.default.conf /etc/nginx/sites-enabled/default

# Make sure the 'ubuntu' user has sudo privileges:
RUN \
  mkdir -p /var/www/kibana && \
  useradd -d /home/ubuntu -m -s /bin/bash ubuntu && \
  echo "ubuntu:changeme" | chpasswd && \
  echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
  sed -i s#/home/ubuntu:/bin/false#/home/ubuntu:/bin/bash# /etc/passwd

COPY ./public /var/www/kibana/public

USER ubuntu

ENTRYPOINT ["/docker-entrypoint.sh"]
