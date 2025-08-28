#!/bin/bash
yum update -y
yum install -y nginx
systemctl start nginx
systemctl enable nginx
echo -e "Hello from Nginx!\n<h1>Deployed via Terraform</h1>" > /usr/share/nginx/html/index.html
