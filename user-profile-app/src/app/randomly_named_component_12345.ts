import { Component, Input } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
  role: string;
  avatar?: string; // Optional property
}

@Component({
  selector: 'app-user-profile',
  standalone: true,
  template: `
    <div class="user-profile">
      <img *ngIf="user.avatar" [src]="user.avatar" [alt]="'Avatar for ' + user.name" class="avatar">
      <div class="user-info">
        <h2>{{ user.name }}</h2>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Role:</strong> {{ user.role }}</p>
        <p><strong>ID:</strong> {{ user.id }}</p>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      border: 1px solid #ccc;
      border-radius: 8px;
      padding: 16px;
      margin: 8px;
      max-width: 400px;
      display: flex;
      align-items: center;
    }
    .avatar {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      margin-right: 16px;
    }
    .user-info {
      flex: 1;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: User;
}