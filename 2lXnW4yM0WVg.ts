import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ApiResponse<T = any> {
  data?: T;
  message?: string;
  status?: number;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private baseUrl = 'https://jsonplaceholder.typicode.com'; // Example API endpoint

  constructor(private http: HttpClient) { }

  /**
   * GET request
   */
  getData<T>(endpoint: string): Observable<ApiResponse<T>> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<ApiResponse<T>>(url);
  }

  /**
   * POST request
   */
  postData<T>(endpoint: string, data: any): Observable<ApiResponse<T>> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post<ApiResponse<T>>(url, data, { headers });
  }

  /**
   * PUT request
   */
  putData<T>(endpoint: string, data: any): Observable<ApiResponse<T>> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put<ApiResponse<T>>(url, data, { headers });
  }

  /**
   * DELETE request
   */
  deleteData<T>(endpoint: string): Observable<ApiResponse<T>> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<ApiResponse<T>>(url);
  }
}