from fastapi import FastAPI
import uuid
import os

app = FastAPI()

@app.post("/")
def create_item():
    # Generate a random filename
    random_filename = f"endpoint_{uuid.uuid4().hex}.py"
    
    # Example content for the new file
    file_content = '''
from fastapi import FastAPI

app = FastAPI()

@app.post("/new_endpoint")
def new_endpoint():
    return {"message": "Hello from the new endpoint!"}
'''
    
    # Write the content to the new file
    with open(random_filename, 'w') as f:
        f.write(file_content)
    
    return {"message": f"File saved as {random_filename}"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)