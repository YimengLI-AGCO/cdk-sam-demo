#!/bin/bash

sam local invoke CreateItem0F65601B --docker-network sam-demo --profile yimengli-dev

echo "[Result]Table items:"
aws dynamodb scan --table-name SamTest --endpoint-url http://localhost:8000
