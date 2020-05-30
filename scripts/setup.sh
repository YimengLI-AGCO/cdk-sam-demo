#!/bin/bash

rm -rf ./template.yaml
npm run build
cdk synth --no-staging > template.yaml --profile yimengli-dev

pipenv run python ./scripts/create_table.py
