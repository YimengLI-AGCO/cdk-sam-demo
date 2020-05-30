#!/bin/bash

docker network create sam-demo
docker run --network sam-demo --name dynamodb -p 8000:8000 amazon/dynamodb-local
