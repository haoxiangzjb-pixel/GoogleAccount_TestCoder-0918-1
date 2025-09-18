import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

// Интерфейс для типизации данных
export interface DataItem {
  id: number;
  name: string;
  description: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/posts'; // URL для получения данных

  constructor(private http: HttpClient) { }

  // Метод для получения списка данных
  getData(): Observable<DataItem[]> {
    return this.http.get<DataItem[]>(this.apiUrl);
  }

  // Метод для получения одного элемента по ID
  getDataById(id: number): Observable<DataItem> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<DataItem>(url);
  }
}