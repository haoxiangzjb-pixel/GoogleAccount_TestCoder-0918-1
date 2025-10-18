// F# Record Type for Book Information
type Book = {
    Title: string
    Author: string
    ISBN: string
    PublicationYear: int
    Genre: string
    Price: decimal
}

// Example of creating a book instance
let sampleBook = {
    Title = "The F# Programming Language"
    Author = "Microsoft"
    ISBN = "978-1234567890"
    PublicationYear = 2023
    Genre = "Technical"
    Price = 29.99m
}

// Print the sample book
printfn "Sample Book: %A" sampleBook
