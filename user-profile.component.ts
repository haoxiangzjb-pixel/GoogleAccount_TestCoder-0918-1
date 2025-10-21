import { Component, OnInit } from '@angular/core';

interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  address: string;
  bio: string;
  avatar: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-header">
        <img [src]="userProfile.avatar" alt="User Avatar" class="avatar">
        <h1>{{ userProfile.firstName }} {{ userProfile.lastName }}</h1>
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
        
        <div class="detail-item">
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
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      margin-bottom: 15px;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item label {
      font-weight: bold;
      margin-right: 10px;
      display: inline-block;
      width: 80px;
    }
    
    .detail-item span, .detail-item p {
      display: inline-block;
      color: #333;
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
    bio: 'Software developer with 5 years of experience in web development. Passionate about creating user-friendly applications.',
    avatar: 'https://via.placeholder.com/100x100'
  };

  constructor() { }

  ngOnInit(): void {
  }
}