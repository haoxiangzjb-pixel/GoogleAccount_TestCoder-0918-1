import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';

export interface DataItem {
  id: number;
  name: string;
  description: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private data: DataItem[] = [
    { id: 1, name: 'Item 1', description: 'First item' },
    { id: 2, name: 'Item 2', description: 'Second item' },
    { id: 3, name: 'Item 3', description: 'Third item' }
  ];

  getData(): Observable<DataItem[]> {
    return of(this.data);
  }

  getItem(id: number): Observable<DataItem | undefined> {
    const item = this.data.find(item => item.id === id);
    return of(item);
  }
}