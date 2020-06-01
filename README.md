# AWS CDK(Cloud Development Kit) & AWS SAM(Serverless Application Model) demo project

#### Step 1. Start the local aws dynamodb docker container
```shell script
$ ./scripts/start_docker.sh
```

#### Step 2. Generate the CloudFormation Template, Create the table locally
```shell script
$ ./scripts/setup.sh
```

#### Step 3. Start the local API Gateway
```shell script
$ ./scripts/start_api.sh
```

#### Check the local dynamodb table:
```shell script
$ aws dynamodb scan --table-name thor_fleet_logistics_statuses --endpoint-url http://localhost:8000
```