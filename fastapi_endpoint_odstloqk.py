from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Optional
import uuid

app = FastAPI()

# Define a request model
class ItemRequest(BaseModel):
    name: str
    description: Optional[str] = None
    value: int

# Define a response model
class ItemResponse(BaseModel):
    id: str
    name: str
    description: Optional[str] = None
    value: int

@app.post("/items/", response_model=ItemResponse)
async def create_item(item: ItemRequest):
    """
    POST endpoint that accepts item data and returns it with a generated ID
    """
    # Generate a unique ID for the item
    item_id = str(uuid.uuid4())
    
    # Create response object
    response = ItemResponse(
        id=item_id,
        name=item.name,
        description=item.description,
        value=item.value
    )
    
    # Here you could save to a database, file, etc.
    print(f"Received item: {response}")
    
    return response

# Health check endpoint
@app.get("/health")
async def health_check():
    return {"status": "healthy"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)