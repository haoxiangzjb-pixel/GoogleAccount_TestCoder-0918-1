import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataServiceConfig {
  baseUrl: string;
}

@Injectable({
  providedIn: 'root'
})
export class RandomHttpService {
  private baseUrl: string = '';

  constructor(private http: HttpClient) {}

  /**
   * Method to get data from a specified endpoint
   */
  getData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url);
  }

  /**
   * Method to post data to a specified endpoint
   */
  postData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.post<T>(url, data);
  }

  /**
   * Method to put data to a specified endpoint
   */
  putData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.put<T>(url, data);
  }

  /**
   * Method to delete data from a specified endpoint
   */
  deleteData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url);
  }

  /**
   * Method to set base URL for the service
   */
  setBaseUrl(url: string): void {
    this.baseUrl = url;
  }

  /**
   * Method to get data with custom headers
   */
  getDataWithHeaders<T>(endpoint: string, headers: HttpHeaders): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url, { headers });
  }
}