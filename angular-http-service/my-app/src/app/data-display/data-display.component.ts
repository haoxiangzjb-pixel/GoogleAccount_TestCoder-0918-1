import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';

@Component({
  selector: 'app-data-display',
  template: `
    <div>
      <h2>Data from API:</h2>
      <ul>
        <li *ngFor="let item of data">
          {{ item.title }}
        </li>
      </ul>
      <button (click)="fetchData()">Refresh Data</button>
    </div>
  `,
  styles: [
  ]
})
export class DataDisplayComponent implements OnInit {
  data: any[] = [];

  constructor(private dataService: DataService) { }

  ngOnInit(): void {
    this.fetchData();
  }

  fetchData(): void {
    this.dataService.getData().subscribe(
      (response) => {
        this.data = response.slice(0, 5); // Get first 5 items
      },
      (error) => {
        console.error('Error fetching data:', error);
      }
    );
  }
}
