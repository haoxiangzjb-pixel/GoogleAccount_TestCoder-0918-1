from fastapi import FastAPI
import uuid

app = FastAPI()

@app.post("/data/")
async def receive_data():
    # Generate a random filename
    random_filename = f"endpoint_{uuid.uuid4().hex}.py"
    
    # Example content for the new file
    content = '''# This is a randomly named Python file
print("Hello from the randomly generated file!")
'''
    
    # Write the content to the new file
    with open(random_filename, 'w') as f:
        f.write(content)
    
    return {"message": f"Data saved to {random_filename}", "filename": random_filename}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)