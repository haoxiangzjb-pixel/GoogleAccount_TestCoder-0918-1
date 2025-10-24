def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event object passed to the Lambda function
    context (object): The context object passed to the Lambda function
    
    Returns:
    dict: A response object with a success message
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': {
            'message': 'Success! The Lambda function executed successfully.',
            'status': 'ok'
        }
    }
    
    return response


# Alternative simpler version that just returns a string
def lambda_handler_simple(event, context):
    """
    Simplified AWS Lambda function that returns a success message.
    """
    return {
        'statusCode': 200,
        'body': 'Success! Lambda function executed successfully.'
    }