import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataType {
  // Define the structure of your data here
  id: number;
  name: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetcherService {

  private apiUrl = 'https://jsonplaceholder.typicode.com/users'; // Example API

  constructor(private http: HttpClient) { }

  fetchData(): Observable<DataType[]> {
    return this.http.get<DataType[]>(this.apiUrl);
  }
}