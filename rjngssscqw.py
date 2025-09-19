def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): AWS Lambda uses this parameter to pass in event data to the handler.
    context (object): AWS Lambda uses this parameter to provide runtime information to your handler.
    
    Returns:
    dict: A response object with statusCode and body.
    """
    
    # Return a success response
    return {
        'statusCode': 200,
        'body': 'Success! The Lambda function executed successfully.'
    }