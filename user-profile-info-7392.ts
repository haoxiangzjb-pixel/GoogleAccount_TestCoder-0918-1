import { Component } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  phone: string;
  address: string;
  bio: string;
  avatar: string;
  joinDate: Date;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-header">
        <img [src]="user.avatar" alt="Profile Picture" class="avatar">
        <div class="user-info">
          <h1>{{ user.name }}</h1>
          <p class="email">{{ user.email }}</p>
          <p class="join-date">Member since: {{ user.joinDate | date:'longDate' }}</p>
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
          <strong>Bio:</strong>
          <p class="bio">{{ user.bio }}</p>
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
      padding-bottom: 20px;
      border-bottom: 1px solid #eee;
    }
    
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 20px;
    }
    
    .user-info h1 {
      margin: 0 0 10px 0;
      color: #333;
    }
    
    .email {
      color: #666;
      margin: 5px 0;
    }
    
    .join-date {
      color: #888;
      font-size: 0.9em;
    }
    
    .profile-details {
      margin-top: 20px;
    }
    
    .detail-item {
      margin-bottom: 15px;
      padding: 10px;
      background-color: #f9f9f9;
      border-radius: 4px;
    }
    
    .bio {
      margin-top: 5px;
      color: #555;
      line-height: 1.5;
    }
  `]
})
export class UserProfileComponent {
  user: UserProfile = {
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    phone: '+1 (555) 123-4567',
    address: '123 Main Street, New York, NY 10001',
    bio: 'Software developer with 5 years of experience in web development. Passionate about creating user-friendly applications and learning new technologies.',
    avatar: 'https://via.placeholder.com/100',
    joinDate: new Date('2022-01-15')
  };
}