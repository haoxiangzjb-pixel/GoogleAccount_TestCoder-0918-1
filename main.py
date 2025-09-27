from fastapi import FastAPI
from pydantic import BaseModel
import uuid

app = FastAPI()

class Item(BaseModel):
    name: str
    description: str = None

@app.post("/items/")
async def create_item(item: Item):
    # Generate a random filename
    random_filename = f"/workspace/{uuid.uuid4().hex}.py"
    
    # Example content to save (a simple print statement)
    content_to_save = f"# This is the content for {item.name}\nprint('Hello from {item.name}!')\n"
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(content_to_save)
    
    return {"filename": random_filename, "item_name": item.name}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)