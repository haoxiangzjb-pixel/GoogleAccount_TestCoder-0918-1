const { v4: uuidv4 } = require('uuid');
const fs = require('fs');

// Generate a random filename with .ts extension
const randomFileName = `/workspace/${uuidv4()}.ts`;

// TypeScript type definition for API response
const typeDefinition = `/**
 * Type definition for a generic API response
 */
type ApiResponse<T = any> = {
  data: T;
  status: number;
  message: string;
  success: boolean;
  timestamp: Date;
  error?: {
    code: string;
    message: string;
  };
};

// Example usage:
// const sampleResponse: ApiResponse<UserData> = {
//   data: { id: 1, name: "John Doe" },
//   status: 200,
//   message: "User retrieved successfully",
//   success: true,
//   timestamp: new Date(),
// };
`;

// Write the type definition to the randomly named file
fs.writeFileSync(randomFileName, typeDefinition);

console.log(randomFileName);