def lambda_handler(event, context):
    """
    A simple AWS Lambda function that returns a success message.
    """
    return {
        'statusCode': 200,
        'body': 'Lambda function executed successfully!'
    }

# Example invocation (optional, for local testing)
if __name__ == "__main__":
    print(lambda_handler({}, {}))