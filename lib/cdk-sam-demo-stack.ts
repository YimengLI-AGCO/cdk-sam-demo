import * as cdk from '@aws-cdk/core';
import * as lambda from '@aws-cdk/aws-lambda';
import * as dynamodb from '@aws-cdk/aws-dynamodb';
import * as apigateway from '@aws-cdk/aws-apigateway';


export class CdkSamDemoStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    const statusTable = 'thor_fleet_logistics_statuses';
    const table = new dynamodb.Table(this, statusTable, {
      partitionKey: { name: 'id', type: dynamodb.AttributeType.STRING },
      tableName: statusTable
    });

    const hello = new lambda.Function(this, 'helloWorld', {
      functionName: 'helloWorld',
      runtime: lambda.Runtime.PYTHON_3_7,
      handler: 'index.lambda_handler',
      code: lambda.Code.fromAsset('lambda_function')
    });

    const createItem = new lambda.Function(this, 'createItem', {
      functionName: 'createItem',
      runtime: lambda.Runtime.PYTHON_3_7,
      handler: 'create_item.handler',
      code: lambda.Code.fromAsset('lambda_function'),
      environment: {
        'TABLE_NAME': statusTable
      }
    });

    const getItems = new lambda.Function(this, 'getItems', {
      functionName: 'getItems',
      runtime: lambda.Runtime.PYTHON_3_7,
      handler: 'get_items.handler',
      code: lambda.Code.fromAsset('lambda_function'),
      environment: {
        'TABLE_NAME': statusTable
      }
    });

    table.grantWriteData(createItem);
    table.grantReadData(getItems);

    const api = new apigateway.RestApi(this, 'sam-test-api', {
      restApiName: 'samTestAPI'
    });

    const helloIntegration = new apigateway.LambdaIntegration(hello);
    const createIntegration = new apigateway.LambdaIntegration(createItem);
    const getAllIntegration = new apigateway.LambdaIntegration(getItems);
    const pingEndpoint = api.root.addResource('ping');
    pingEndpoint.addMethod('GET', helloIntegration);

    const statusEndpoint = api.root.addResource('status');
    statusEndpoint.addMethod('POST', createIntegration);
    statusEndpoint.addMethod('GET', getAllIntegration);
  }
}
