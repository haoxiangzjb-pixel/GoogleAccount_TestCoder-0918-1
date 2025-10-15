from fastapi import FastAPI
from pydantic import BaseModel
import uvicorn
import random
import string

app = FastAPI()

class Item(BaseModel):
    name: str
    description: str = None
    value: int = 0

@app.post("/items/")
async def create_item(item: Item):
    """
    A POST endpoint that accepts an item with name, description, and value
    """
    # Generate a random ID for the item
    random_id = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    
    return {
        "id": random_id,
        "name": item.name,
        "description": item.description,
        "value": item.value,
        "message": "Item created successfully!"
    }

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)