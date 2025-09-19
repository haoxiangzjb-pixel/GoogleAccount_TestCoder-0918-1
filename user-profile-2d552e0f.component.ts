import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  avatarUrl?: string;
  bio?: string;
  location?: string;
  website?: string;
  joinDate: Date;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img 
          [src]="user.avatarUrl || 'assets/default-avatar.png'" 
          [alt]="user.name"
          class="profile-avatar">
        <div class="profile-basic-info">
          <h2>{{ user.name }}</h2>
          <p class="profile-email">{{ user.email }}</p>
        </div>
      </div>
      
      <div class="profile-details" *ngIf="showDetails">
        <div class="detail-item" *ngIf="user.bio">
          <strong>Bio:</strong>
          <span>{{ user.bio }}</span>
        </div>
        
        <div class="detail-item" *ngIf="user.location">
          <strong>Location:</strong>
          <span>{{ user.location }}</span>
        </div>
        
        <div class="detail-item" *ngIf="user.website">
          <strong>Website:</strong>
          <a [href]="user.website" target="_blank">{{ user.website }}</a>
        </div>
        
        <div class="detail-item">
          <strong>Member since:</strong>
          <span>{{ user.joinDate | date:'mediumDate' }}</span>
        </div>
      </div>
      
      <button 
        (click)="toggleDetails()" 
        class="toggle-details-btn">
        {{ showDetails ? 'Hide Details' : 'Show Details' }}
      </button>
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
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
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
      object-fit: cover;
      margin-right: 20px;
    }
    
    .profile-basic-info h2 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .profile-email {
      margin: 0;
      color: #666;
    }
    
    .profile-details {
      margin-bottom: 20px;
    }
    
    .detail-item {
      margin-bottom: 10px;
      display: flex;
    }
    
    .detail-item strong {
      width: 100px;
      color: #333;
    }
    
    .detail-item span, 
    .detail-item a {
      flex: 1;
      color: #666;
      text-decoration: none;
    }
    
    .detail-item a:hover {
      text-decoration: underline;
    }
    
    .toggle-details-btn {
      background-color: #007bff;
      color: white;
      border: none;
      padding: 8px 16px;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px;
    }
    
    .toggle-details-btn:hover {
      background-color: #0069d9;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: UserProfile = {
    id: 0,
    name: '',
    email: '',
    joinDate: new Date()
  };
  
  showDetails = false;
  
  toggleDetails() {
    this.showDetails = !this.showDetails;
  }
}