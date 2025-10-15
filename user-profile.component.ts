import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  avatar?: string;
  bio?: string;
  location?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="'Avatar of ' + user.firstName + ' ' + user.lastName"
          class="avatar"
        >
        <div *ngIf="!user.avatar" class="default-avatar">
          {{ user.firstName.charAt(0) }}{{ user.lastName.charAt(0) }}
        </div>
        <div class="user-info">
          <h1>{{ user.firstName }} {{ user.lastName }}</h1>
          <p class="user-title">{{ user.bio || 'User Profile' }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Email:</strong>
          <span>{{ user.email }}</span>
        </div>
        <div class="detail-item">
          <strong>Phone:</strong>
          <span>{{ user.phone }}</span>
        </div>
        <div class="detail-item" *ngIf="user.location">
          <strong>Location:</strong>
          <span>{{ user.location }}</span>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 500px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #e0e0e0;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      font-family: Arial, sans-serif;
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .avatar {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 15px;
    }
    
    .default-avatar {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      background-color: #007bff;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 24px;
      font-weight: bold;
      margin-right: 15px;
    }
    
    .user-info h1 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .user-title {
      margin: 0;
      color: #666;
      font-style: italic;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      display: flex;
      margin-bottom: 10px;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item:last-child {
      border-bottom: none;
      margin-bottom: 0;
      padding-bottom: 0;
    }
    
    .detail-item strong {
      width: 100px;
      color: #555;
    }
    
    .detail-item span {
      flex: 1;
      color: #333;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}