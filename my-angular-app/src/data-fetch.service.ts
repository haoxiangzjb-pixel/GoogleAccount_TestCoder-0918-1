// data-fetch.service.ts
// Простой Angular-сервис для демонстрации получения данных через HTTP.
// Обратите внимание, что для полноценной работы вам потребуется настроить Angular CLI и зависимости.

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataItem {
  id: number;
  name: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetchService {

  private apiUrl = 'https://jsonplaceholder.typicode.com/users'; // Пример API

  constructor(private http: HttpClient) { }

  getData(): Observable<DataItem[]> {
    return this.http.get<DataItem[]>(this.apiUrl);
  }
}