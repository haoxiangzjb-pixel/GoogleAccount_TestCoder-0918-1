import { Component, OnInit } from '@angular/core';
import { DataService, DataItem } from './data.service';

@Component({
  selector: 'app-data-list',
  template: `
    <div class="data-list">
      <h2>Data List</h2>
      <ul>
        <li *ngFor="let item of items">
          <strong>{{ item.name }}</strong> - {{ item.description }}
        </li>
      </ul>
    </div>
  `,
  styles: [`
    .data-list {
      padding: 20px;
      font-family: Arial, sans-serif;
    }
    ul {
      list-style-type: none;
      padding: 0;
    }
    li {
      padding: 10px;
      margin: 5px 0;
      background-color: #f5f5f5;
      border-radius: 4px;
    }
  `]
})
export class DataListComponent implements OnInit {
  items: DataItem[] = [];

  constructor(private dataService: DataService) {}

  ngOnInit(): void {
    this.dataService.getData().subscribe(data => {
      this.items = data;
    });
  }
}