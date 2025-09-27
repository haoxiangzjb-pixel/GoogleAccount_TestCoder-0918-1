import { Component, OnInit } from '@angular/core';
import { DataService, DataItem } from './data.service';

@Component({
  selector: 'app-root',
  template: `
    <h1>Angular HTTP Service Example</h1>
    <ul>
      <li *ngFor="let item of data">{{ item.name }}</li>
    </ul>
  `,
  styles: []
})
export class AppComponent implements OnInit {
  title = 'my-angular-app';
  data: DataItem[] = [];

  constructor(private dataService: DataService) {}

  ngOnInit(): void {
    this.dataService.getData().subscribe(
      (response) => {
        this.data = response;
      },
      (error) => {
        console.error('Error fetching data:', error);
      }
    );
  }
}