import logging


def lambda_handler(event, context):
  # message = event.get('message', 'default mess')
  logging.info('Debug: event ')
  return 'abc'
  
  # return {
  #   "headers": {
  #     "lala": "haha"
  #   },
  #   "statusCode": 200,
  #   "body": "李一萌"
  # }
