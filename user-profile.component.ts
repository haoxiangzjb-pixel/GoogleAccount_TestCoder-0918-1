import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  address: string;
  bio: string;
  avatar?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-header">
        <img 
          [src]="user.avatar || 'https://via.placeholder.com/150' + 
                '?text=' + user.firstName.charAt(0) + user.lastName.charAt(0)" 
          alt="Profile picture" 
          class="profile-avatar">
        <div class="profile-basic-info">
          <h1>{{ user.firstName }} {{ user.lastName }}</h1>
          <p class="profile-email">{{ user.email }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Phone:</strong> {{ user.phone }}
        </div>
        <div class="detail-item">
          <strong>Address:</strong> {{ user.address }}
        </div>
        <div class="detail-item">
          <strong>Bio:</strong> {{ user.bio }}
        </div>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-family: Arial, sans-serif;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
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
      margin-right: 20px;
      object-fit: cover;
    }
    
    .profile-basic-info h1 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .profile-email {
      margin: 0;
      color: #666;
      font-style: italic;
    }
    
    .profile-details {
      margin-top: 20px;
    }
    
    .detail-item {
      margin-bottom: 15px;
      padding-bottom: 10px;
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
  @Input() user!: UserProfile;
}