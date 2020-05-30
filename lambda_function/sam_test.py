import boto3
import logging
import uuid

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def create_handler(event, context):
    """Add Item to ${TABLE_NAME}"""

    dynamodb = boto3.resource('dynamodb', endpoint_url='http://dynamodb:8000/')

    table = dynamodb.Table('SamTest')
    response = table.put_item(Item={'id': str(uuid.uuid4()), 'message': 'lala'})
    return response
