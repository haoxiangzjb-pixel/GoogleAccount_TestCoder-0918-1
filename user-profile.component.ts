import { Component, OnInit } from '@angular/core';

interface UserProfile {
  id: number;
  name: string;
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
      <div class="profile-card">
        <img [src]="userProfile.avatar" alt="{{userProfile.name}}" class="profile-avatar">
        <h2>{{userProfile.name}}</h2>
        <div class="profile-details">
          <p><strong>Email:</strong> {{userProfile.email}}</p>
          <p><strong>Phone:</strong> {{userProfile.phone}}</p>
          <p><strong>Address:</strong> {{userProfile.address}}</p>
          <p><strong>Bio:</strong> {{userProfile.bio}}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }
    
    .profile-card {
      background-color: #f5f5f5;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      text-align: center;
      max-width: 500px;
      width: 100%;
    }
    
    .profile-avatar {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 20px;
      border: 4px solid #ddd;
    }
    
    .profile-details p {
      margin: 10px 0;
      text-align: left;
    }
  `]
})
export class UserProfileComponent implements OnInit {
  userProfile: UserProfile = {
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    phone: '+1 (555) 123-4567',
    address: '123 Main Street, New York, NY',
    bio: 'Software developer with 5 years of experience specializing in web technologies.',
    avatar: 'https://via.placeholder.com/150'
  };

  constructor() { }

  ngOnInit(): void {
  }
}