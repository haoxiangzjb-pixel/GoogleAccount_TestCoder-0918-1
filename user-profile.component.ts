import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone?: string;
  avatar?: string;
  bio?: string;
  joinDate: Date;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="'Profile image of ' + user.firstName" 
          class="profile-avatar">
        <div class="default-avatar" *ngIf="!user.avatar">
          {{ user.firstName.charAt(0) }}{{ user.lastName.charAt(0) }}
        </div>
        <div class="user-info">
          <h2>{{ user.firstName }} {{ user.lastName }}</h2>
          <p class="user-email">{{ user.email }}</p>
          <p class="join-date">Member since: {{ user.joinDate | date:'mediumDate' }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="detail-item" *ngIf="user.phone">
          <strong>Phone:</strong> {{ user.phone }}
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
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      font-family: Arial, sans-serif;
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .profile-avatar {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      margin-right: 20px;
      object-fit: cover;
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
      margin-right: 20px;
    }
    
    .user-info h2 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .user-email {
      color: #666;
      margin: 0 0 5px 0;
    }
    
    .join-date {
      color: #888;
      font-size: 0.9em;
      margin: 0;
    }
    
    .profile-details {
      border-top: 1px solid #eee;
      padding-top: 15px;
    }
    
    .detail-item {
      margin-bottom: 10px;
    }
    
    .detail-item strong {
      display: inline-block;
      width: 80px;
      color: #555;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}