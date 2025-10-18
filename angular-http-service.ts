import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ApiServiceConfig {
  baseUrl?: string;
}

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private baseUrl: string = '';

  constructor(private http: HttpClient) {}

  /**
   * Устанавливает базовый URL для всех запросов
   */
  setBaseUrl(url: string): void {
    this.baseUrl = url;
  }

  /**
   * Выполняет GET запрос
   */
  get<T>(endpoint: string, options?: {
    headers?: HttpHeaders | {[header: string]: string | string[]},
    params?: HttpParams | {[param: string]: string | number | boolean | ReadonlyArray<string | number | boolean>}
  }): Observable<T> {
    const url = this.baseUrl ? `${this.baseUrl}/${endpoint}` : endpoint;
    return this.http.get<T>(url, options);
  }

  /**
   * Выполняет POST запрос
   */
  post<T>(endpoint: string, body: any, options?: {
    headers?: HttpHeaders | {[header: string]: string | string[]},
    params?: HttpParams | {[param: string]: string | number | boolean | ReadonlyArray<string | number | boolean>}
  }): Observable<T> {
    const url = this.baseUrl ? `${this.baseUrl}/${endpoint}` : endpoint;
    return this.http.post<T>(url, body, options);
  }

  /**
   * Выполняет PUT запрос
   */
  put<T>(endpoint: string, body: any, options?: {
    headers?: HttpHeaders | {[header: string]: string | string[]},
    params?: HttpParams | {[param: string]: string | number | boolean | ReadonlyArray<string | number | boolean>}
  }): Observable<T> {
    const url = this.baseUrl ? `${this.baseUrl}/${endpoint}` : endpoint;
    return this.http.put<T>(url, body, options);
  }

  /**
   * Выполняет DELETE запрос
   */
  delete<T>(endpoint: string, options?: {
    headers?: HttpHeaders | {[header: string]: string | string[]},
    params?: HttpParams | {[param: string]: string | number | boolean | ReadonlyArray<string | number | boolean>}
  }): Observable<T> {
    const url = this.baseUrl ? `${this.baseUrl}/${endpoint}` : endpoint;
    return this.http.delete<T>(url, options);
  }

  /**
   * Выполняет PATCH запрос
   */
  patch<T>(endpoint: string, body: any, options?: {
    headers?: HttpHeaders | {[header: string]: string | string[]},
    params?: HttpParams | {[param: string]: string | number | boolean | ReadonlyArray<string | number | boolean>}
  }): Observable<T> {
    const url = this.baseUrl ? `${this.baseUrl}/${endpoint}` : endpoint;
    return this.http.patch<T>(url, body, options);
  }
}