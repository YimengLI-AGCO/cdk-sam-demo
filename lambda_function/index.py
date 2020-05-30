import logging


def lambda_handler(event, context):
    print(event.keys())
    message = event.get('queryStringParameters').get('a')
    logging.warning('Debug: event ' + message)

    return {
        "headers": {
            "lala": "haha"
        },
        "statusCode": 200,
        "body": "李一萌"
    }
