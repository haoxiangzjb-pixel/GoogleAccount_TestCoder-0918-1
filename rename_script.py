import os
import uuid
import shutil

# Define the source and destination paths
source_file = '/workspace/api_caller.py'
random_uuid = str(uuid.uuid4())
destination_file = f'/workspace/{random_uuid}.py'

# Rename the file by copying and removing
shutil.move(source_file, destination_file)

print(f"File renamed to: {destination_file}")