import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  username: string;
  phone: string;
  website: string;
  address?: {
    street: string;
    suite: string;
    city: string;
    zipcode: string;
  };
  company?: {
    name: string;
    catchPhrase: string;
    bs: string;
  };
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <h2>{{ userProfile?.name || 'User Profile' }}</h2>
        <p class="username">@{{ userProfile?.username }}</p>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Name:</strong> {{ userProfile?.name }}
        </div>
        <div class="detail-item">
          <strong>Email:</strong> <a href="mailto:{{ userProfile?.email }}">{{ userProfile?.email }}</a>
        </div>
        <div class="detail-item">
          <strong>Phone:</strong> {{ userProfile?.phone }}
        </div>
        <div class="detail-item">
          <strong>Website:</strong> <a href="http://{{ userProfile?.website }}" target="_blank">{{ userProfile?.website }}</a>
        </div>
        <div class="detail-item" *ngIf="userProfile?.address">
          <strong>Address:</strong>
          <div>{{ userProfile?.address?.street }}, {{ userProfile?.address?.suite }}</div>
          <div>{{ userProfile?.address?.city }}, {{ userProfile?.address?.zipcode }}</div>
        </div>
        <div class="detail-item" *ngIf="userProfile?.company">
          <strong>Company:</strong>
          <div>{{ userProfile?.company?.name }}</div>
          <div>{{ userProfile?.company?.catchPhrase }}</div>
          <div>{{ userProfile?.company?.bs }}</div>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-family: Arial, sans-serif;
    }
    
    .profile-header {
      text-align: center;
      margin-bottom: 20px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    
    .username {
      color: #666;
      font-style: italic;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      margin-bottom: 12px;
      padding: 8px 0;
      border-bottom: 1px solid #f5f5f5;
    }
    
    .detail-item a {
      color: #007bff;
      text-decoration: none;
    }
    
    .detail-item a:hover {
      text-decoration: underline;
    }
  `]
})
export class UserProfileComponent {
  @Input() userProfile: UserProfile | undefined;
}