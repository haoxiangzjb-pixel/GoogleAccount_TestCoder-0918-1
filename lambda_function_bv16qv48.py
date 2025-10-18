import json


def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event dict that contains information about the triggering event
    context (object): The context object that provides information about the invocation, 
                     function, and execution environment
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': json.dumps({
            'message': 'Success!',
            'status': 'completed',
            'details': 'AWS Lambda function executed successfully'
        })
    }
    
    return response


# Example of how this function might be tested locally
if __name__ == "__main__":
    # Simulate an event and context
    test_event = {}
    test_context = type('Context', (), {
        'function_name': 'test_lambda',
        'function_version': '$LATEST',
        'invoked_function_arn': 'arn:aws:lambda:us-east-1:123456789012:function:test_lambda',
        'memory_limit_in_mb': '128',
        'aws_request_id': 'c6af9ac6-7b61-11e6-9a4c-9801bbaa13f3',
        'log_group_name': '/aws/lambda/test_lambda',
        'log_stream_name': '2016/11/14/[$LATEST]f2d4b11a1a1a4e2a9d1e1e1e1e1e1e1e',
        'identity': None,
        'client_context': None,
        
        'get_remaining_time_in_millis': lambda: 300000
    })()
    
    result = lambda_handler(test_event, test_context)
    print(json.dumps(result, indent=2))