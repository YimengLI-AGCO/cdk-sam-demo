import boto3
import uuid
import os
import traceback
import json

TABLE_NAME = os.environ.get('TABLE_NAME')


def handler(event, context):
    """Add item to ${TABLE_NAME}"""

    dynamodb = boto3.resource('dynamodb', endpoint_url='http://dynamodb:8000/')
    table = dynamodb.Table(TABLE_NAME)
    message = json.loads(event.get('body')).get('message')\
        if type(event.get('body')) is str else event.get('body').get('message')

    try:
        table.put_item(Item={'id': str(uuid.uuid4()), 'message': message})
        return {'statusCode': 201, 'body': 'CREATED'}
    except Exception as e:
        traceback.print_exc()
        return {'statusCode': 500, 'body': 'Failed to create item'}
