import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataItem {
  id: number;
  name: string;
  description?: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetchService {
  private baseUrl = 'https://jsonplaceholder.typicode.com'; // Example API

  constructor(private http: HttpClient) { }

  // GET request
  getData<T>(endpoint: string): Observable<T> {
    return this.http.get<T>(`${this.baseUrl}/${endpoint}`);
  }

  // GET request with ID
  getDataById<T>(endpoint: string, id: number): Observable<T> {
    return this.http.get<T>(`${this.baseUrl}/${endpoint}/${id}`);
  }

  // POST request
  postData<T>(endpoint: string, data: any): Observable<T> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post<T>(`${this.baseUrl}/${endpoint}`, data, { headers });
  }

  // PUT request
  updateData<T>(endpoint: string, id: number, data: any): Observable<T> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put<T>(`${this.baseUrl}/${endpoint}/${id}`, data, { headers });
  }

  // DELETE request
  deleteData<T>(endpoint: string, id: number): Observable<T> {
    return this.http.delete<T>(`${this.baseUrl}/${endpoint}/${id}`);
  }

  // Example method to fetch a list of items
  getItems(): Observable<DataItem[]> {
    return this.http.get<DataItem[]>(`${this.baseUrl}/posts`);
  }

  // Example method to fetch a specific item
  getItem(id: number): Observable<DataItem> {
    return this.http.get<DataItem>(`${this.baseUrl}/posts/${id}`);
  }
}