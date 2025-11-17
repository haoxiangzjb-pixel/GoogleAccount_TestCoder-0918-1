import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ApiResponse {
  // Define a generic interface for API responses
  [key: string]: any;
}

@Injectable({
  providedIn: 'root'
})
export class DataHttpService {
  private baseUrl = 'https://jsonplaceholder.typicode.com'; // Example API base URL

  constructor(private http: HttpClient) { }

  // GET request
  getData<T = ApiResponse>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url);
  }

  // POST request
  postData<T = ApiResponse>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post<T>(url, data, { headers });
  }

  // PUT request
  putData<T = ApiResponse>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put<T>(url, data, { headers });
  }

  // DELETE request
  deleteData<T = ApiResponse>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url);
  }

  // Custom request with options
  customRequest<T = ApiResponse>(method: string, endpoint: string, data?: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    
    switch (method.toUpperCase()) {
      case 'GET':
        return this.http.get<T>(url, { headers });
      case 'POST':
        return this.http.post<T>(url, data, { headers });
      case 'PUT':
        return this.http.put<T>(url, data, { headers });
      case 'DELETE':
        return this.http.delete<T>(url, { headers });
      default:
        throw new Error(`Unsupported HTTP method: ${method}`);
    }
  }
}