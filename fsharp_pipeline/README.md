# F# Pipeline Function

This directory contains an F# script that demonstrates data processing using the pipeline operator (`|>`) and saves the results to a file with a randomly generated name.

## The F# Code

The file `pipeline.fsx` contains:

1. A function to generate random filenames
2. A data processing pipeline that:
   - Doubles each element in the list
   - Filters values greater than 10
   - Sorts the results
   - Reverses the order
3. A function to save processed data to a file with a random name
4. An example usage with sample data

## How to Run

To run this F# script, you need to have .NET installed on your system. You can execute it with:

```bash
dotnet fsi pipeline.fsx
```

This will:
- Process the sample data using the pipeline
- Save the results to a file with a random name like `processed_data_abcdefgh.txt`
- Print information about the original and processed data

## Pipeline Example

The data processing function uses F#'s pipeline operator (`|>`) to chain operations:

```fsharp
let processData data =
    data
    |> List.map (fun x -> x * 2)  // Double each element
    |> List.filter (fun x -> x > 10)  // Keep only values greater than 10
    |> List.sort  // Sort the results
    |> List.rev  // Reverse the order
```

This is a functional approach that's clean and readable, demonstrating the power of F#'s pipeline operator for data processing tasks.