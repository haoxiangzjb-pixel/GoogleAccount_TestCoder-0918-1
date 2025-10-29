import json


def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event dict that contains information about the invocation, function, and request
    context (object): The context object that provides information about the invocation, function, and runtime environment
    
    Returns:
    dict: A dictionary containing the HTTP response
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': json.dumps({
            'message': 'Success! The Lambda function executed successfully.',
            'status': 'OK'
        })
    }
    
    return response


# Example invocation (for testing purposes)
if __name__ == "__main__":
    # Simulate an event and context for local testing
    test_event = {}
    test_context = type('Context', (), {'aws_request_id': 'test-id'})()
    
    result = lambda_handler(test_event, test_context)
    print(json.dumps(result, indent=2))