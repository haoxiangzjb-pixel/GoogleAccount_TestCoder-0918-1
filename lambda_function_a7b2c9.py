def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Args:
        event: The event object containing information about the request
        context: The context object containing runtime information
    
    Returns:
        A dictionary containing a success message with statusCode 200
    """
    # Create the response object
    response = {
        'statusCode': 200,
        'body': {
            'message': 'Success! The Lambda function executed successfully.',
            'status': 'OK'
        }
    }
    
    return response


# Example of how this function might be called (for testing purposes)
if __name__ == "__main__":
    # Simulate an event and context for local testing
    test_event = {}
    test_context = type('Context', (), {'aws_request_id': 'test-id'})()
    
    result = lambda_handler(test_event, test_context)
    print(result)