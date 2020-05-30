#!/bin/bash

echo -e "\033[31mInvoke Lambda Function locally: getItems \033[0m"
echo -e "[RUN]\033[35m sam local invoke getItems --docker-network sam-demo | jq \033[0m\n"
sam local invoke getItems --docker-network sam-demo | jq
