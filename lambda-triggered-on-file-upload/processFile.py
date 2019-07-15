import os

def lambda_handler(event, context):    
    #do cool stuff here
    print("EVENT")
    print (event)
    print("CONTEXT")
    print (context)
    print (dir(context))
    print (context.client_context())
    
    message = 'hello from lambda'
    return {'status': 200, 'msg': message}

if __name__ == "__main__":
    print(lambda_handler(None, None))