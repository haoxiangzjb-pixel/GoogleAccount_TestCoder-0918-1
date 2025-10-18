import { Component, OnInit } from '@angular/core';

export interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  address: string;
  avatar: string;
  bio: string;
  joinDate: Date;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-header">
        <img [src]="userProfile.avatar || 'https://via.placeholder.com/150'" 
             alt="Profile Picture" 
             class="profile-avatar">
        <div class="profile-basic-info">
          <h1>{{ userProfile.firstName }} {{ userProfile.lastName }}</h1>
          <p class="profile-join-date">Member since: {{ userProfile.joinDate | date:'longDate' }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <label>Email:</label>
          <span>{{ userProfile.email }}</span>
        </div>
        <div class="detail-item">
          <label>Phone:</label>
          <span>{{ userProfile.phone }}</span>
        </div>
        <div class="detail-item">
          <label>Address:</label>
          <span>{{ userProfile.address }}</span>
        </div>
        <div class="detail-item bio-section">
          <label>Bio:</label>
          <p>{{ userProfile.bio }}</p>
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
    
    .profile-avatar {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      margin-right: 20px;
      object-fit: cover;
    }
    
    .profile-basic-info h1 {
      margin: 0 0 10px 0;
      color: #333;
    }
    
    .profile-join-date {
      color: #777;
      font-style: italic;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      display: flex;
      margin-bottom: 15px;
      padding-bottom: 10px;
    }
    
    .detail-item label {
      font-weight: bold;
      min-width: 100px;
      color: #555;
    }
    
    .detail-item span {
      flex: 1;
      color: #333;
    }
    
    .bio-section p {
      margin: 0;
      line-height: 1.6;
    }
  `]
})
export class UserProfileComponent implements OnInit {
  userProfile: UserProfile = {
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    phone: '+1 (555) 123-4567',
    address: '123 Main Street, New York, NY 10001',
    avatar: 'https://via.placeholder.com/150',
    bio: 'Software developer with 5 years of experience in web development. Passionate about creating user-friendly applications.',
    joinDate: new Date('2022-01-15')
  };

  constructor() { }

  ngOnInit(): void {
    // Additional initialization logic can go here
  }
}