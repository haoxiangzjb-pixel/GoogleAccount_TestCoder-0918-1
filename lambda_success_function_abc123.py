import json
import random
import string

def lambda_handler(event, context):
    # Generate a random success message
    random_suffix = ''.join(random.choices(string.ascii_letters + string.digits, k=6))
    message = f"Success! Operation completed successfully - {random_suffix}"
    
    # Return the response in the format expected by AWS Lambda
    return {
        'statusCode': 200,
        'body': json.dumps({
            'message': message,
            'status': 'success'
        })
    }

# For local testing
if __name__ == "__main__":
    # Simulate a test event and context
    test_event = {}
    test_context = type('obj', (object,), {'aws_request_id': 'test-request-id'})
    
    # Call the lambda function
    result = lambda_handler(test_event, test_context)
    print(result)