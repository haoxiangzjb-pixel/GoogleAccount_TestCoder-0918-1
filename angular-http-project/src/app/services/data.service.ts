import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError, map } from 'rxjs/operators';

// Define a simple interface for our data
export interface Item {
  id: number;
  name: string;
  description?: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/posts'; // Example API

  constructor(private http: HttpClient) { }

  /**
   * Fetches a list of items from the API
   */
  getItems(): Observable<Item[]> {
    return this.http.get<Item[]>(this.apiUrl).pipe(
      map(items => items.slice(0, 10)), // Get only first 10 items
      catchError(this.handleError<Item[]>('getItems', []))
    );
  }

  /**
   * Fetches a single item by ID
   */
  getItem(id: number): Observable<Item | undefined> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<Item>(url).pipe(
      catchError(this.handleError<Item>(`getItem id=${id}`))
    );
  }

  /**
   * Handles HTTP operation that failed.
   * Let the app continue.
   * @param operation - name of the operation that failed
   * @param result - optional value to return as the observable result
   */
  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {

      console.error(`${operation} failed: ${error.message}`);

      // TODO: better job of transforming error for user consumption
      // For now, we'll just return an empty result or a default value
      return of(result as T);
    };
  }
}