import { Component, OnInit } from '@angular/core';
import { DataService, DataItem } from './http-data-fetcher.service';

@Component({
  selector: 'app-root',
  template: `
    <h1>Данные с сервера</h1>
    <ul>
      <li *ngFor="let item of data">{{ item.id }} - {{ item.name }}</li>
    </ul>
  `,
  styles: []
})
export class AppComponent implements OnInit {
  title = 'my-angular-app';
  data: DataItem[] = [];

  constructor(private dataService: DataService) {}

  ngOnInit(): void {
    this.dataService.getData().subscribe({
      next: (data) => {
        this.data = data;
      },
      error: (err) => {
        console.error('Ошибка при получении данных:', err);
      }
    });
  }
}