import * as cdk from '@aws-cdk/core';
import * as lambda from '@aws-cdk/aws-lambda';
import * as dynamodb from '@aws-cdk/aws-dynamodb';
import * as apigateway from '@aws-cdk/aws-apigateway';


export class CdkSamDemoStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    const table = new dynamodb.Table(this, 'SamTest', {
      partitionKey: { name: 'id', type: dynamodb.AttributeType.STRING },
      tableName: 'SamTest'
    });

    const hello = new lambda.Function(this, 'helloWorld', {
      functionName: 'helloWorld',
      runtime: lambda.Runtime.PYTHON_3_7,
      handler: 'index.lambda_handler',
      code: lambda.Code.fromAsset('lambda_function')
    });

    const createItem = new lambda.Function(this, 'CreateItem', {
      functionName: 'yimeng-fun-1',
      runtime: lambda.Runtime.PYTHON_3_7,
      handler: 'sam_test.create_handler',
      code: lambda.Code.asset('lambda_function')
    });
    table.grantFullAccess(createItem);

    const api = new apigateway.RestApi(this, 'sam-test-api', {
      restApiName: 'samTestAPI'
    });

    const helloIntegration = new apigateway.LambdaIntegration(hello);
    const pingEndpoint = api.root.addResource('ping');
    pingEndpoint.addMethod('GET', helloIntegration);

    // table.grantFullAccess(health);
  }
}
