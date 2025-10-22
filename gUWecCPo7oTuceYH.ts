import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataResponse {
  // Define a generic interface for the response
  [key: string]: any;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetchingService {
  private baseUrl = ''; // You can set your API base URL here

  constructor(private http: HttpClient) { }

  /**
   * Generic GET request method
   * @param url - The endpoint URL
   * @returns Observable of the response data
   */
  getData<T = DataResponse>(url: string): Observable<T> {
    const fullUrl = this.baseUrl ? `${this.baseUrl}${url}` : url;
    return this.http.get<T>(fullUrl);
  }

  /**
   * Generic POST request method
   * @param url - The endpoint URL
   * @param data - The data to send
   * @returns Observable of the response data
   */
  postData<T = DataResponse>(url: string, data: any): Observable<T> {
    const fullUrl = this.baseUrl ? `${this.baseUrl}${url}` : url;
    return this.http.post<T>(fullUrl, data);
  }

  /**
   * Generic PUT request method
   * @param url - The endpoint URL
   * @param data - The data to send
   * @returns Observable of the response data
   */
  putData<T = DataResponse>(url: string, data: any): Observable<T> {
    const fullUrl = this.baseUrl ? `${this.baseUrl}${url}` : url;
    return this.http.put<T>(fullUrl, data);
  }

  /**
   * Generic DELETE request method
   * @param url - The endpoint URL
   * @returns Observable of the response data
   */
  deleteData<T = DataResponse>(url: string): Observable<T> {
    const fullUrl = this.baseUrl ? `${this.baseUrl}${url}` : url;
    return this.http.delete<T>(fullUrl);
  }
}