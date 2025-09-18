import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class YkmyaderService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/posts'; // Example API

  constructor(private http: HttpClient) { }

  // Fetch all items
  getItems(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl);
  }

  // Fetch item by ID
  getItemById(id: number): Observable<any> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<any>(url);
  }

  // Create new item
  createItem(item: any): Observable<any> {
    return this.http.post<any>(this.apiUrl, item);
  }

  // Update item
  updateItem(id: number, item: any): Observable<any> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.put<any>(url, item);
  }

  // Delete item
  deleteItem(id: number): Observable<any> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete<any>(url);
  }
}