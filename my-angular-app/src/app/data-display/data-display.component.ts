import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-data-display',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div *ngIf="data.length > 0; else loading">
      <h2>Data from API:</h2>
      <ul>
        <li *ngFor="let item of data">
          {{ item.title }}
        </li>
      </ul>
    </div>
    <ng-template #loading>
      <p>Loading data...</p>
    </ng-template>
  `,
  styles: ``
})
export class DataDisplayComponent implements OnInit {
  data: any[] = [];

  constructor(private dataService: DataService) { }

  ngOnInit(): void {
    this.dataService.getData().subscribe(
      (result) => {
        this.data = result;
      },
      (error) => {
        console.error('Error fetching data:', error);
      }
    );
  }
}
