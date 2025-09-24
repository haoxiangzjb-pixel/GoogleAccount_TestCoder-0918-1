import { Component, Input } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
  avatar?: string; // Optional profile picture URL
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-card" *ngIf="user">
      <img *ngIf="user.avatar" [src]="user.avatar" [alt]="'Profile picture of ' + user.name" class="avatar">
      <h2>{{ user.name }}</h2>
      <p class="email">{{ user.email }}</p>
      <p class="id">User ID: {{ user.id }}</p>
    </div>
    <p *ngIf="!user">No user data provided.</p>
  `,
  styles: [`
    .profile-card {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 16px;
      max-width: 300px;
      text-align: center;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
    }
    .email {
      color: #666;
    }
    .id {
      font-size: 0.8em;
      color: #999;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User | undefined;
}