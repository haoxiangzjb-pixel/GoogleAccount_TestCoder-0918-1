import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone?: string;
  avatar?: string;
  bio?: string;
  joinDate: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="'Profile of ' + user.firstName + ' ' + user.lastName"
          class="avatar"
        >
        <div *ngIf="!user.avatar" class="default-avatar">
          {{ user.firstName.charAt(0) }}{{ user.lastName.charAt(0) }}
        </div>
        <div class="user-info">
          <h1>{{ user.firstName }} {{ user.lastName }}</h1>
          <p class="subtitle">Member since {{ user.joinDate | date:'MMMM yyyy' }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Email:</strong>
          <span>{{ user.email }}</span>
        </div>
        
        <div class="detail-item" *ngIf="user.phone">
          <strong>Phone:</strong>
          <span>{{ user.phone }}</span>
        </div>
        
        <div class="detail-item" *ngIf="user.bio">
          <strong>Bio:</strong>
          <p class="bio-text">{{ user.bio }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #e0e0e0;
      border-radius: 8px;
      font-family: Arial, sans-serif;
      background-color: #fafafa;
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
      padding-bottom: 15px;
      border-bottom: 1px solid #e0e0e0;
    }
    
    .avatar {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 20px;
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
    
    .user-info h1 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .subtitle {
      margin: 0;
      color: #666;
      font-style: italic;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      margin-bottom: 15px;
      padding: 10px 0;
    }
    
    .detail-item strong {
      display: inline-block;
      width: 80px;
      color: #555;
    }
    
    .bio-text {
      margin: 5px 0 0 80px;
      color: #444;
      line-height: 1.5;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}