def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Args:
        event (dict): AWS Lambda event data
        context (object): AWS Lambda runtime information
    
    Returns:
        dict: Response with status code and success message
    """
    return {
        'statusCode': 200,
        'body': 'Success! The Lambda function executed successfully.'
    }