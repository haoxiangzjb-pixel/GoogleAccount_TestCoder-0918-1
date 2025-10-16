# Zig Point Structure Example

This directory contains a Zig program that defines a structure for storing point information and saves it to a file with a random name.

## Contents:
- `point_struct.zig`: The main Zig program that defines a Point structure and saves its data to a randomly named file.
- This README file

## Point Structure:
The `Point` struct contains:
- `x`: f32 coordinate value
- `y`: f32 coordinate value

## Usage:
To run the program, you'll need Zig installed (version 0.13.0 or compatible):

```bash
zig run point_struct.zig
```

This will create a file with random name containing the point coordinates.

## What the program does:
1. Defines a Point structure with x and y coordinates
2. Creates an instance of the Point structure with example values
3. Generates a random filename
4. Saves the point coordinates to the randomly named file