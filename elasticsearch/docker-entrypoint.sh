#!/bin/bash -e

# Start elasticsearch:
sudo /etc/init.d/elasticsearch restart
while ! nc -z localhost 9200; do
  echo "Waiting for ElasticSearch on localhost:9200..."
  sleep 1
done
echo "ElasticSearch now up - continuing..."

# Create the schoolblock index:
curl -XPUT "http://localhost:9200/$INDEX_NAME/"

tail -f /var/log/elasticsearch/*
