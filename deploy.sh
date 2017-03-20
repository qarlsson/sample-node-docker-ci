#!/bin/bash

ssh -i key alekskosterin@130.211.89.73  << EOF
docker pull qarlsson/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi qarlsson/sample-node:current || true
docker tag qarlsson/sample-node:latest qarlsson/sample-node:current
docker run -d --net app --name web --restart always  -p 80:80 qarlsson/sample-node:current
EOF
