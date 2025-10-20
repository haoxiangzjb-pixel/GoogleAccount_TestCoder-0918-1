def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event object passed to the Lambda function
    context (object): The context object passed to the Lambda function
    
    Returns:
    dict: A response object with statusCode and body
    """
    # Create the response
    response = {
        'statusCode': 200,
        'body': {
            'message': 'Success! Lambda function executed successfully.',
            'status': 'OK'
        },
        'headers': {
            'Content-Type': 'application/json'
        }
    }
    
    return response