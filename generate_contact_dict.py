#!/usr/bin/env python3

import json
import random
import string
from datetime import datetime

# Create a dictionary with contact information (similar to Ruby hash)
contact_info = {
    "name": "Juan Pérez",
    "email": "juan.perez@example.com",
    "phone": "+1-555-123-4567",
    "address": {
        "street": "Calle Principal 123",
        "city": "Ciudad Ejemplo",
        "country": "País Ejemplo",
        "zip_code": "12345"
    },
    "social_media": {
        "twitter": "@juanperez",
        "linkedin": "juan-perez-profile"
    },
    "notes": "Cliente importante"
}

# Generate a random filename
random_filename = f"contact_{int(datetime.now().timestamp())}_{random.randint(1000, 9999)}.json"

# Save the dictionary to the file
with open(random_filename, 'w', encoding='utf-8') as file:
    json.dump(contact_info, file, indent=2, ensure_ascii=False)

print(f"Contact information saved to: {random_filename}")
print("Content:")
print(json.dumps(contact_info, indent=2))