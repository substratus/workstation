#!/bin/bash -xe

sudo service nginx restart

sleep 3
sudo tail -f /var/log/nginx/error.log /var/log/nginx/access.log
