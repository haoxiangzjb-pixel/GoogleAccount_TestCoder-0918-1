from fastapi import FastAPI
import uvicorn
from pydantic import BaseModel
from typing import Optional
import uuid

app = FastAPI()

# Define a request model
class Item(BaseModel):
    name: str
    description: Optional[str] = None
    price: float
    tax: Optional[float] = None

# POST endpoint
@app.post("/items/")
async def create_item(item: Item):
    """
    Accepts a POST request with item data and returns the created item with an ID
    """
    item_id = str(uuid.uuid4())
    result = item.dict()
    result["id"] = item_id
    return {"message": "Item created successfully", "item": result}

# Health check endpoint
@app.get("/")
async def root():
    return {"message": "FastAPI POST endpoint is running!"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)