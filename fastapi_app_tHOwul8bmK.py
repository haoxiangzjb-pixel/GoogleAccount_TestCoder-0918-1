from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Dict, Any

app = FastAPI(title="Sample API", description="A simple FastAPI application with a POST endpoint")

# Define a Pydantic model for the request body
class Item(BaseModel):
    name: str
    description: str = None
    price: float
    tax: float = None

# Define a Pydantic model for the response
class ResponseItem(BaseModel):
    name: str
    description: str = None
    price: float
    tax: float = None
    total: float = None

@app.post("/items/", response_model=ResponseItem, status_code=201)
async def create_item(item: Item) -> ResponseItem:
    """
    Create an item with the given information.
    
    - **name**: The name of the item
    - **description**: An optional description of the item
    - **price**: The price of the item (must be a positive number)
    - **tax**: An optional tax value
    
    Returns the created item with the calculated total price.
    """
    if item.price < 0:
        raise HTTPException(status_code=400, detail="Price must be a positive number")
    
    # Calculate total price if tax is provided
    total = item.price + (item.tax if item.tax else 0)
    
    # Create response object
    response_item = ResponseItem(
        name=item.name,
        description=item.description,
        price=item.price,
        tax=item.tax,
        total=total
    )
    
    return response_item

@app.get("/")
async def root() -> Dict[str, str]:
    """Root endpoint that returns a welcome message."""
    return {"message": "Welcome to the FastAPI POST endpoint example!"}