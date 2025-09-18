import { Component, OnInit } from '@angular/core';
import { YkmyaderService } from './ykmyader.service';

@Component({
  selector: 'app-data-list',
  template: `
    <div>
      <h2>Data List</h2>
      <ul>
        <li *ngFor="let item of items">
          {{ item.title }}
        </li>
      </ul>
    </div>
  `
})
export class UqoebrnaComponent implements OnInit {
  items: any[] = [];

  constructor(private dataService: YkmyaderService) { }

  ngOnInit(): void {
    this.loadItems();
  }

  loadItems(): void {
    this.dataService.getItems().subscribe(
      (data) => {
        this.items = data;
      },
      (error) => {
        console.error('Error loading items', error);
      }
    );
  }
}