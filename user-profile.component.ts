import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  phone: string;
  address?: string;
  avatar?: string;
  bio?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="user.name" 
          class="avatar">
        <div class="default-avatar" *ngIf="!user.avatar">{{ getInitials(user.name) }}</div>
        <h1 class="user-name">{{ user.name }}</h1>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Email:</strong> {{ user.email }}
        </div>
        <div class="detail-item">
          <strong>Phone:</strong> {{ user.phone }}
        </div>
        <div class="detail-item" *ngIf="user.address">
          <strong>Address:</strong> {{ user.address }}
        </div>
        <div class="detail-item" *ngIf="user.bio">
          <strong>Bio:</strong> {{ user.bio }}
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 500px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-family: Arial, sans-serif;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    
    .profile-header {
      text-align: center;
      margin-bottom: 20px;
    }
    
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
    }
    
    .default-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background-color: #007bff;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 24px;
      font-weight: bold;
      margin: 0 auto 10px;
    }
    
    .user-name {
      margin: 10px 0 0;
      color: #333;
    }
    
    .profile-details {
      text-align: left;
    }
    
    .detail-item {
      margin: 10px 0;
      padding: 8px 0;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item strong {
      display: inline-block;
      width: 80px;
      color: #555;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: UserProfile = {
    id: 0,
    name: '',
    email: '',
    phone: ''
  };
  
  getInitials(name: string): string {
    const names = name.split(' ');
    const initials = names.map(n => n.charAt(0)).join('');
    return initials.toUpperCase();
  }
}