import { Component, OnInit } from '@angular/core';
import { DataFetchService, DataItem } from './services/data-fetch.service';

@Component({
  selector: 'app-root',
  template: `
    <h1>Data Fetching Example</h1>
    <ul>
      <li *ngFor="let item of dataItems">
        {{ item.id }} - {{ item.name }}
      </li>
    </ul>
  `,
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'angular-service-example';
  dataItems: DataItem[] = [];

  constructor(private dataFetchService: DataFetchService) {}

  ngOnInit(): void {
    this.dataFetchService.getData().subscribe(
      (data) => {
        // Map the response to our DataItem interface
        this.dataItems = data.map((item: any) => ({
          id: item.id,
          name: item.title,
          description: item.body
        }));
      },
      (error) => {
        console.error('Error fetching data:', error);
      }
    );
  }
}