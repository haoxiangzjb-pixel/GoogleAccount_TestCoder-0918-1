import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { DataService, DataItem } from './data.service';

@Component({
  selector: 'app-data-detail',
  template: `
    <div class="data-detail" *ngIf="item">
      <h2>{{ item.name }}</h2>
      <p><strong>Description:</strong> {{ item.description }}</p>
      <p><strong>ID:</strong> {{ item.id }}</p>
      <button (click)="goBack()">Go Back</button>
    </div>
    <div *ngIf="!item">
      <p>Item not found</p>
    </div>
  `,
  styles: [`
    .data-detail {
      padding: 20px;
      font-family: Arial, sans-serif;
      max-width: 600px;
      margin: 0 auto;
    }
    button {
      margin-top: 15px;
      padding: 8px 16px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    button:hover {
      background-color: #0056b3;
    }
  `]
})
export class DataDetailComponent implements OnInit {
  item: DataItem | undefined;

  constructor(
    private route: ActivatedRoute,
    private dataService: DataService
  ) {}

  ngOnInit(): void {
    const id = parseInt(this.route.snapshot.paramMap.get('id') || '0');
    this.dataService.getItem(id).subscribe(item => {
      this.item = item;
    });
  }

  goBack(): void {
    window.history.back();
  }
}