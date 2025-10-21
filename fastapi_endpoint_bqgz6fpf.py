from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional
import uuid

app = FastAPI()

# Define a request model
class Item(BaseModel):
    name: str
    description: Optional[str] = None
    price: float

# Define a response model
class ItemResponse(BaseModel):
    id: str
    name: str
    description: Optional[str] = None
    price: float

@app.post("/items/", response_model=ItemResponse)
async def create_item(item: Item):
    """
    Create a new item with a POST request.
    The item will be assigned a unique ID.
    """
    item_id = str(uuid.uuid4())
    return ItemResponse(
        id=item_id,
        name=item.name,
        description=item.description,
        price=item.price
    )

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)