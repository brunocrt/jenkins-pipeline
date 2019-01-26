#!/bin/sh

CONTAINER_NAME=brunocrt/demo-boot

echo Building $CONTAINER_NAME

sudo docker build -t $CONTAINER_NAME:build -f Dockerfile.build .

sudo mkdir -p app

sudo docker create --name extract $CONTAINER_NAME:build  
sudo docker cp extract:/build/target/*.jar ./app  
sudo docker rm -f extract

echo Building $CONTAINER_NAME:latest

sudo docker build --no-cache -t $CONTAINER_NAME:latest .
sudo rm -rf ./app
