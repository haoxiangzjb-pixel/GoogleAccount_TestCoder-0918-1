import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';

export interface ApiResponse {
  [key: string]: any;
}

@Injectable({
  providedIn: 'root'
})
export class HttpDataService {
  private baseUrl: string = 'https://jsonplaceholder.typicode.com'; // Example API base URL

  constructor(private http: HttpClient) { }

  /**
   * Generic GET request
   * @param endpoint The API endpoint to call
   * @returns Observable of the API response
   */
  getData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url)
      .pipe(
        retry(1),
        catchError(this.handleError)
      );
  }

  /**
   * Generic POST request
   * @param endpoint The API endpoint to call
   * @param data The data to send
   * @returns Observable of the API response
   */
  postData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    
    return this.http.post<T>(url, data, { headers })
      .pipe(
        catchError(this.handleError)
      );
  }

  /**
   * Generic PUT request
   * @param endpoint The API endpoint to call
   * @param data The data to update
   * @returns Observable of the API response
   */
  putData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    
    return this.http.put<T>(url, data, { headers })
      .pipe(
        catchError(this.handleError)
      );
  }

  /**
   * Generic DELETE request
   * @param endpoint The API endpoint to call
   * @returns Observable of the API response
   */
  deleteData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    
    return this.http.delete<T>(url)
      .pipe(
        catchError(this.handleError)
      );
  }

  /**
   * Error handling method
   * @param error The HTTP error
   * @returns An observable with the error
   */
  private handleError(error: HttpErrorResponse) {
    let errorMessage = 'An unknown error occurred!';
    
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