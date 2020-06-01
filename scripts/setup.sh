#!/bin/bash

echo -e "\n\033[31mRemove the existing CloudFormation file \033[0m"
echo -e "[RUN]\033[35m rm -rf ./template.yaml \033[0m\n"
rm -rf ./template.yaml

echo -e "\n\033[31mCompile the typescript files \033[0m"
echo -e "[RUN]\033[35m npm run build \033[0m\n"
npm run build

echo -e "\n\033[31mGenerate the CloudFormation file \033[0m"
echo -e "[RUN]\033[35m cdk synth --no-staging > template.yaml \033[0m\n"
cdk synth --no-staging > template.yaml

echo -e "\n\033[31mCreate dynamodb table locally \033[0m"
echo -e "[RUN]\033[35m pipenv run python ./scripts/create_table.py \033[0m\n"
pipenv run python ./scripts/create_table.py
