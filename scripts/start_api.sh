#!/bin/bash

echo -e "\n\033[31mStart the Local API Gateway \033[0m"
echo -e "[RUN]\033[35m sam local start-api --docker-network sam-demo \033[0m\n"
sam local start-api --docker-network sam-demo
