import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  username: string;
  bio?: string;
  avatar?: string;
  joinDate: Date;
  location?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="user.name" 
          class="profile-avatar">
        <div class="default-avatar" *ngIf="!user.avatar">
          {{ user.name.charAt(0) | uppercase }}
        </div>
        <div class="profile-info">
          <h1>{{ user.name }}</h1>
          <p class="username">@{{ user.username }}</p>
          <p class="email">{{ user.email }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="detail-item" *ngIf="user.bio">
          <label>Bio:</label>
          <p>{{ user.bio }}</p>
        </div>
        
        <div class="detail-item" *ngIf="user.location">
          <label>Location:</label>
          <p>{{ user.location }}</p>
        </div>
        
        <div class="detail-item">
          <label>Member since:</label>
          <p>{{ user.joinDate | date:'longDate' }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      font-family: Arial, sans-serif;
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .profile-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 20px;
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
      font-size: 40px;
      font-weight: bold;
      margin-right: 20px;
    }
    
    .profile-info h1 {
      margin: 0 0 5px 0;
      font-size: 24px;
    }
    
    .username {
      color: #6c757d;
      margin: 0 0 5px 0;
      font-size: 16px;
    }
    
    .email {
      color: #007bff;
      margin: 0;
      font-size: 14px;
    }
    
    .profile-details {
      margin-top: 20px;
    }
    
    .detail-item {
      margin-bottom: 15px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item label {
      font-weight: bold;
      color: #495057;
      display: block;
      margin-bottom: 5px;
    }
    
    .detail-item p {
      margin: 0;
      color: #6c757d;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}