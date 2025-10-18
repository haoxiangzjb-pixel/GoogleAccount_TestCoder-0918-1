import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataServiceConfig {
  apiUrl: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private apiUrl = 'https://jsonplaceholder.typicode.com'; // Default API URL

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  };

  constructor(private http: HttpClient) { }

  /**
   * GET request
   */
  getData<T>(endpoint: string): Observable<T> {
    return this.http.get<T>(`${this.apiUrl}/${endpoint}`);
  }

  /**
   * POST request
   */
  postData<T>(endpoint: string, data: any): Observable<T> {
    return this.http.post<T>(`${this.apiUrl}/${endpoint}`, data, this.httpOptions);
  }

  /**
   * PUT request
   */
  updateData<T>(endpoint: string, data: any): Observable<T> {
    return this.http.put<T>(`${this.apiUrl}/${endpoint}`, data, this.httpOptions);
  }

  /**
   * DELETE request
   */
  deleteData<T>(endpoint: string): Observable<T> {
    return this.http.delete<T>(`${this.apiUrl}/${endpoint}`);
  }

  /**
   * Custom request with error handling
   */
  makeRequest<T>(method: string, endpoint: string, data?: any): Observable<T> {
    const url = `${this.apiUrl}/${endpoint}`;
    
    switch (method.toUpperCase()) {
      case 'GET':
        return this.http.get<T>(url);
      case 'POST':
        return this.http.post<T>(url, data, this.httpOptions);
      case 'PUT':
        return this.http.put<T>(url, data, this.httpOptions);
      case 'DELETE':
        return this.http.delete<T>(url);
      default:
        throw new Error(`Unsupported method: ${method}`);
    }
  }
}