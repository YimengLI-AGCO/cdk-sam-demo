#!/bin/bash

echo -e "\n\033[31mStop the local dynamodb \033[0m"
echo -e "[RUN]\033[35m docker stop dynamodb \033[0m\n"
docker stop dynamodb

echo -e "\n\033[31mRemove local dynamodb container \033[0m"
echo -e "[RUN]\033[35m docker rm -v dynamodb \033[0m\n"
docker rm -v dynamodb

echo -e "\n\033[31mRemove the custom network to run dynamodb \033[0m"
echo -e "[RUN]\033[35m docker network rm sam-demo \033[0m\n"
docker network rm sam-demo
