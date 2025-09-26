def lambda_handler(event, context):
    """
    AWS Lambda function handler that returns a success message.
    
    Args:
        event (dict): The event dict passed to the Lambda function.
        context (object): The context object passed to the Lambda function.
    
    Returns:
        dict: A dictionary containing the status code and success message.
    """
    return {
        'statusCode': 200,
        'body': 'Success: Lambda function executed successfully!'
    }
