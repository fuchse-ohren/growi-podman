#!/bin/bash
cd ./growi-docker-compose/elasticsearch

#elasticsearchのビルド
podman build -t elasticsearch .
