import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ApiResponse {
  // Define your API response interface here
  [key: string]: any;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetchService {
  private baseUrl = 'https://api.example.com'; // Replace with your API base URL

  constructor(private http: HttpClient) { }

  /**
   * Generic GET request
   */
  getData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url);
  }

  /**
   * Generic POST request
   */
  postData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post<T>(url, data, { headers });
  }

  /**
   * Generic PUT request
   */
  putData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put<T>(url, data, { headers });
  }

  /**
   * Generic DELETE request
   */
  deleteData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url);
  }

  /**
   * GET request with custom headers
   */
  getDataWithHeaders<T>(endpoint: string, headers: HttpHeaders): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url, { headers });
  }

  /**
   * POST request with custom headers
   */
  postDataWithHeaders<T>(endpoint: string, data: any, headers: HttpHeaders): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.post<T>(url, data, { headers });
  }
}