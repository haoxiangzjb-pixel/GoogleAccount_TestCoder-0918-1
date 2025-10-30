def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event data passed to the Lambda function
    context (object): The runtime information of the Lambda function
    
    Returns:
    dict: A response object containing a success message
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': {
            'message': 'Success! Lambda function executed successfully.',
            'status': 'ok'
        }
    }
    
    return response


# Alternative simpler version
def simple_lambda_handler(event, context):
    """
    A simpler version of the Lambda function.
    """
    return {
        'statusCode': 200,
        'body': 'Success! Lambda function executed successfully.'
    }