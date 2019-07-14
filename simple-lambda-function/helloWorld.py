import os

GREETING = os.getenv('GREETING')

def lambda_handler(event, context):    
    #do cool stuff here
    message = '{} this is my simple lambda function'.format(GREETING)
    return {'status': 200, 'msg': message}

if __name__ == "__main__":
    print(lambda_handler(None, None))