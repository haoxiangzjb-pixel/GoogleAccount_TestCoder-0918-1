def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event data passed to the Lambda function
    context (object): The runtime information of the Lambda function
    
    Returns:
    dict: A response object containing the success message
    """
    # Create the response object
    response = {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': {
            'message': 'Success! The Lambda function executed successfully.',
            'status': 'success'
        }
    }
    
    # Return the response
    return response


# Example usage for testing outside of AWS Lambda environment
if __name__ == "__main__":
    # Simulate event and context
    test_event = {}
    test_context = type('Context', (), {'aws_request_id': 'test-id'})()
    
    result = lambda_handler(test_event, test_context)
    print(result)