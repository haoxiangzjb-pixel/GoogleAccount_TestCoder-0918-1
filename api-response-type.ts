/**
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