import { Component, OnInit } from '@angular/core';
import { DataFetcherService1760376078 } from '../../services/data-fetcher-service-1760376078';

@Component({
  selector: 'app-data-display',
  template: `
    <div *ngIf="data; else loading">
      <h2>Данные с сервера:</h2>
      <pre>{{ data | json }}</pre>
    </div>
    <ng-template #loading>
      <p>Загрузка...</p>
    </ng-template>
  `,
  styles: []
})
export class DataDisplayComponent implements OnInit {
  data: any;

  constructor(private dataService: DataFetcherService1760376078) { }

  ngOnInit(): void {
    this.dataService.fetchData().subscribe(
      response => {
        this.data = response;
      },
      error => {
        console.error('Ошибка при получении данных:', error);
      }
    );
  }
}