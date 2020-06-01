import os
import boto3
import traceback
import json

TABLE_NAME = os.environ.get('TABLE_NAME')


def handler(event, context):
    """Get All items in ${TABLE_NAME}"""

    dynamodb = boto3.resource('dynamodb', endpoint_url='http://dynamodb:8000/')
    table = dynamodb.Table(TABLE_NAME)
    try:
        response = table.scan()
        return {'statusCode': 200, 'body': json.dumps(response.get('Items'))}
    except Exception as e:
        traceback.print_exc()
        return {'statusCode': 500, 'body': 'Failed to retrieve items'}
