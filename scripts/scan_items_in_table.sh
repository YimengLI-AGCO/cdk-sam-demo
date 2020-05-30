#!/bin/bash

echo -e "[RUN]\033[32m aws dynamodb list-tables --endpoint-url http://localhost:8000 --profile yimengli-dev \033[0m\n"
aws dynamodb list-tables --endpoint-url http://localhost:8000 --profile yimengli-dev

echo -e "\n[RUN]\033[32m aws dynamodb scan --table-name thor_fleet_logistics_statuses --endpoint-url http://localhost:8000 --profile yimengli-dev \033[0m\n"
aws dynamodb scan --table-name thor_fleet_logistics_statuses --endpoint-url http://localhost:8000 --profile yimengli-dev
