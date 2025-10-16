import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, map } from 'rxjs/operators';

export interface DataResponse {
  [key: string]: any;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetcher7392Service {
  private apiUrl = 'https://api.example.com'; // Replace with your actual API URL

  constructor(private http: HttpClient) { }

  /**
   * Fetches data from the specified endpoint
   * @param endpoint The API endpoint to fetch data from
   * @returns An Observable containing the response data
   */
  fetchData<T>(endpoint: string): Observable<T> {
    const url = `${this.apiUrl}/${endpoint}`;
    
    return this.http.get<T>(url).pipe(
      map(response => response as T),
      catchError(this.handleError)
    );
  }

  /**
   * Posts data to the specified endpoint
   * @param endpoint The API endpoint to post data to
   * @param data The data to be posted
   * @returns An Observable containing the response data
   */
  postData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.apiUrl}/${endpoint}`;
    
    return this.http.post<T>(url, data).pipe(
      catchError(this.handleError)
    );
  }

  /**
   * Updates data at the specified endpoint
   * @param endpoint The API endpoint to update data at
   * @param data The data to be updated
   * @returns An Observable containing the response data
   */
  updateData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.apiUrl}/${endpoint}`;
    
    return this.http.put<T>(url, data).pipe(
      catchError(this.handleError)
    );
  }

  /**
   * Deletes data at the specified endpoint
   * @param endpoint The API endpoint to delete data from
   * @returns An Observable indicating success or failure
   */
  deleteData<T>(endpoint: string): Observable<T> {
    const url = `${this.apiUrl}/${endpoint}`;
    
    return this.http.delete<T>(url).pipe(
      catchError(this.handleError)
    );
  }

  /**
   * Handles HTTP errors
   * @param error The HttpErrorResponse object
   * @returns An Observable with the error message
   */
  private handleError(error: HttpErrorResponse) {
    let errorMessage = 'Unknown error occurred';
    
    if (error.error instanceof ErrorEvent) {
      // Client-side error
      errorMessage = `Error: ${error.error.message}`;
    } else {
      // Server-side error
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    
    console.error(errorMessage);
    return throwError(() => errorMessage);
  }
}