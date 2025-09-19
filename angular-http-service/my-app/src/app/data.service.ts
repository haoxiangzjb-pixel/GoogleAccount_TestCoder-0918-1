import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/posts'; // Example API

  constructor(private http: HttpClient) { }

  // GET request
  getData(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl);
  }

  // GET request with ID
  getDataById(id: number): Observable<any> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<any>(url);
  }

  // POST request
  createData(data: any): Observable<any> {
    return this.http.post<any>(this.apiUrl, data);
  }

  // PUT request
  updateData(id: number, data: any): Observable<any> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.put<any>(url, data);
  }

  // DELETE request
  deleteData(id: number): Observable<any> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete<any>(url);
  }
}
