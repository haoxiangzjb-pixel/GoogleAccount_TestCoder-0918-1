from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional
import uuid

app = FastAPI()

# Define a request model
class Item(BaseModel):
    name: str
    description: Optional[str] = None
    value: float

# Define a response model
class ItemResponse(BaseModel):
    id: str
    name: str
    description: Optional[str] = None
    value: float

@app.post("/items/", response_model=ItemResponse)
async def create_item(item: Item):
    """
    POST endpoint that accepts item data and returns the created item with an ID
    """
    # Generate a random ID for the new item
    item_id = str(uuid.uuid4())
    
    # Create the response object
    response_item = ItemResponse(
        id=item_id,
        name=item.name,
        description=item.description,
        value=item.value
    )
    
    # Here you would typically save the item to a database
    print(f"Item saved: {response_item}")
    
    return response_item

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)