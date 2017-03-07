#!/bin/bash

ssh a@130.211.74.89 << EOF
docker pull qarlsson/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi qarlsson/sample-node:current || true
docker tag qarlsson/sample-node:latest qarlsson/sample-node:current
docker run -d --net app --restart always --name web -p 80:80 qarlsson/sample-node:current
EOF
