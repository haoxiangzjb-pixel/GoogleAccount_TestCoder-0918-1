import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataServiceItem {
  id: number;
  name: string;
  description: string;
}

@Injectable({
  providedIn: 'root'
})
export class RandomDataService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  constructor(private http: HttpClient) { }

  getData(): Observable<DataServiceItem[]> {
    return this.http.get<DataServiceItem[]>(this.apiUrl);
  }

  getDataById(id: number): Observable<DataServiceItem> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<DataServiceItem>(url);
  }
}