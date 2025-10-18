import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DataFetchService {

  constructor(private http: HttpClient) { }

  /**
   * Метод для получения данных через HTTP
   * @param url URL для получения данных
   * @returns Observable с данными
   */
  getData(url: string): Observable<any> {
    return this.http.get(url);
  }

  /**
   * Метод для получения данных с указанием типа
   * @param url URL для получения данных
   * @returns Observable с данными определенного типа
   */
  getDataWithType<T>(url: string): Observable<T> {
    return this.http.get<T>(url);
  }

  /**
   * Метод для отправки POST запроса
   * @param url URL для отправки данных
   * @param data Данные для отправки
   * @returns Observable с результатом
   */
  postData(url: string, data: any): Observable<any> {
    return this.http.post(url, data);
  }
}