#!/bin/bash

echo -e "\n\033[31mCreate custom docker network to run the dynamodb \033[0m"
echo -e "[RUN]\033[35m docker network create sam-demo \033[0m\n"
docker network create sam-demo

echo -e "\n\033[31mStart the local dynamodb \033[0m"
echo -e "[RUN]\033[35m docker run --network sam-demo --name dynamodb -p 8000:8000 amazon/dynamodb-local \033[0m\n"
docker run --network sam-demo --name dynamodb -p 8000:8000 amazon/dynamodb-local
