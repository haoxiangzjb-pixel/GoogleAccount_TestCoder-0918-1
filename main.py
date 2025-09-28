from fastapi import FastAPI
import uuid

app = FastAPI()

@app.post("/data/")
async def receive_data():
    # Generate a random filename
    random_filename = f"/workspace/data_{uuid.uuid4().hex}.py"
    
    # Example content to write to the file
    content = "# This is a randomly generated file\nprint('Hello from the generated file!')\n"
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(content)
    
    return {"message": f"Data saved successfully to {random_filename}"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)