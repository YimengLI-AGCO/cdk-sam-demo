#!/bin/bash

sam local invoke createItem -e ./lambda_function/helloworld.json --docker-network sam-demo | jq

echo -e "[Result]Table items:"
aws dynamodb scan --table-name thor_fleet_logistics_statuses --endpoint-url http://localhost:8000
