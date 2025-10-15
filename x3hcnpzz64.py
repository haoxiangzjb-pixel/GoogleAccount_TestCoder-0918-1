from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional
import uuid
import json

app = FastAPI()

class Item(BaseModel):
    name: str
    description: Optional[str] = None
    price: float
    tax: Optional[float] = None

@app.post("/items/")
async def create_item(item: Item):
    """
    Accepts a POST request with item data and returns the saved item with a unique ID
    """
    # Generate a random ID for the item
    item_id = str(uuid.uuid4())
    
    # Convert the item to a dictionary and add the ID
    item_dict = item.dict()
    item_dict["id"] = item_id
    
    # In a real application, you would save this to a database
    # For this example, we'll just return the item with the ID
    return item_dict

# Health check endpoint
@app.get("/health")
async def health_check():
    return {"status": "healthy"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)