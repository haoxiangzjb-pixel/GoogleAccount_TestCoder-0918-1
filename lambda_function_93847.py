import json


def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event object passed to the Lambda function
    context (object): The context object passed to the Lambda function
    
    Returns:
    dict: A response object with statusCode and body
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'body': json.dumps({
            'message': 'Success!',
            'status': 'OK'
        }),
        'headers': {
            'Content-Type': 'application/json'
        }
    }
    
    return response


# Example usage for testing
if __name__ == "__main__":
    # Simulate a Lambda event and context
    test_event = {}
    test_context = type('Context', (), {'function_name': 'test'})()
    
    result = lambda_handler(test_event, test_context)
    print(json.dumps(result, indent=2))