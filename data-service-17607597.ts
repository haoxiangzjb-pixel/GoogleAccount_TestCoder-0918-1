import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';

export interface ApiResponse<T> {
  data: T;
  message: string;
}

@Injectable({
  providedIn: 'root'
})
export class RandomDataService {
  private apiUrl = 'https://jsonplaceholder.typicode.com';

  constructor(private http: HttpClient) { }

  // GET request with error handling
  fetchData<T>(resource: string): Observable<T> {
    return this.http.get<T>(`${this.apiUrl}/${resource}`)
      .pipe(
        retry(2),
        catchError(this.handleError)
      );
  }

  // GET request with ID
  fetchItemById<T>(resource: string, id: number): Observable<T> {
    const url = `${this.apiUrl}/${resource}/${id}`;
    return this.http.get<T>(url)
      .pipe(
        catchError(this.handleError)
      );
  }

  // POST request
  createItem<T>(resource: string, item: any): Observable<T> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    return this.http.post<T>(`${this.apiUrl}/${resource}`, item, { headers })
      .pipe(
        catchError(this.handleError)
      );
  }

  // PUT request
  updateItem<T>(resource: string, id: number, item: any): Observable<T> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    return this.http.put<T>(`${this.apiUrl}/${resource}/${id}`, item, { headers })
      .pipe(
        catchError(this.handleError)
      );
  }

  // DELETE request
  deleteItem(resource: string, id: number): Observable<{}> {
    return this.http.delete(`${this.apiUrl}/${resource}/${id}`)
      .pipe(
        catchError(this.handleError)
      );
  }

  // Error handling
  private handleError(error: any) {
    let errorMessage = '';
    if (error.error instanceof ErrorEvent) {
      // Client-side error
      errorMessage = `Error: ${error.error.message}`;
    } else {
      // Server-side error
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    console.error(errorMessage);
    return throwError(() => new Error(errorMessage));
  }
}