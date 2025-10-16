import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ApiResponse {
  [key: string]: any;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetchService {
  private baseUrl = 'https://jsonplaceholder.typicode.com'; // Example API

  constructor(private http: HttpClient) { }

  /**
   * Fetch data from the specified endpoint
   * @param endpoint The API endpoint to fetch data from
   * @returns Observable with the API response
   */
  getData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url);
  }

  /**
   * Fetch data with custom headers
   * @param endpoint The API endpoint to fetch data from
   * @param headers Optional HTTP headers
   * @returns Observable with the API response
   */
  getDataWithHeaders<T>(endpoint: string, headers?: HttpHeaders): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const options = headers ? { headers } : {};
    return this.http.get<T>(url, options);
  }

  /**
   * Post data to the specified endpoint
   * @param endpoint The API endpoint to post data to
   * @param body The data to post
   * @returns Observable with the API response
   */
  postData<T>(endpoint: string, body: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.post<T>(url, body);
  }

  /**
   * Put data to the specified endpoint
   * @param endpoint The API endpoint to put data to
   * @param body The data to put
   * @returns Observable with the API response
   */
  putData<T>(endpoint: string, body: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.put<T>(url, body);
  }

  /**
   * Delete data from the specified endpoint
   * @param endpoint The API endpoint to delete data from
   * @returns Observable with the API response
   */
  deleteData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url);
  }
}
