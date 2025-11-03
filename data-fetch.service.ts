import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ApiResponse {
  // Define the structure of your API response here
  // This is a generic example - adjust according to your API
  data?: any;
  message?: string;
  success?: boolean;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetchService {
  private baseUrl = 'https://jsonplaceholder.typicode.com'; // Example API base URL

  constructor(private http: HttpClient) { }

  // GET request
  getData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url);
  }

  // GET request with parameters
  getDataWithParams<T>(endpoint: string, params: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url, { params });
  }

  // POST request
  postData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post<T>(url, data, { headers });
  }

  // PUT request
  updateData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put<T>(url, data, { headers });
  }

  // DELETE request
  deleteData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url);
  }
}