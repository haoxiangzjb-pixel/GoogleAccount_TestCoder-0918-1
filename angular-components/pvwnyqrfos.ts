import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  avatarUrl?: string;
  bio?: string;
  joinedDate?: Date;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img *ngIf="user.avatarUrl; else defaultAvatar" [src]="user.avatarUrl" [alt]="user.name" class="avatar">
        <ng-template #defaultAvatar>
          <div class="default-avatar">{{ getUserInitials() }}</div>
        </ng-template>
        <h2>{{ user.name }}</h2>
      </div>
      
      <div class="profile-details">
        <div class="detail-row">
          <span class="label">Email:</span>
          <span class="value">{{ user.email }}</span>
        </div>
        
        <div class="detail-row" *ngIf="user.bio">
          <span class="label">Bio:</span>
          <span class="value">{{ user.bio }}</span>
        </div>
        
        <div class="detail-row" *ngIf="user.joinedDate">
          <span class="label">Member since:</span>
          <span class="value">{{ user.joinedDate | date:'mediumDate' }}</span>
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
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      font-family: Arial, sans-serif;
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
      margin-bottom: 10px;
    }
    
    .default-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background-color: #3498db;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 36px;
      font-weight: bold;
      margin: 0 auto 10px;
    }
    
    h2 {
      margin: 0;
      color: #333;
    }
    
    .profile-details {
      text-align: left;
    }
    
    .detail-row {
      display: flex;
      margin-bottom: 10px;
      padding: 8px 0;
      border-bottom: 1px solid #eee;
    }
    
    .label {
      font-weight: bold;
      width: 120px;
      color: #555;
    }
    
    .value {
      flex: 1;
      color: #333;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: UserProfile = {
    id: 0,
    name: '',
    email: ''
  };

  getUserInitials(): string {
    if (!this.user.name) return '?';
    return this.user.name.split(' ').map(n => n[0]).join('').toUpperCase().substring(0, 2);
  }
}