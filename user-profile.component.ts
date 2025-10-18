import { Component, OnInit } from '@angular/core';

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
    <div class="profile-container">
      <div class="profile-header">
        <h2>User Profile</h2>
      </div>
      <div class="profile-body">
        <div class="profile-section">
          <h3>Personal Information</h3>
          <div class="info-item">
            <label>Name:</label>
            <span>{{ userProfile.name }}</span>
          </div>
          <div class="info-item">
            <label>Username:</label>
            <span>{{ userProfile.username }}</span>
          </div>
          <div class="info-item">
            <label>Email:</label>
            <span>{{ userProfile.email }}</span>
          </div>
          <div class="info-item">
            <label>Phone:</label>
            <span>{{ userProfile.phone }}</span>
          </div>
          <div class="info-item">
            <label>Website:</label>
            <span>{{ userProfile.website }}</span>
          </div>
        </div>

        <div class="profile-section" *ngIf="userProfile.address">
          <h3>Address</h3>
          <div class="info-item">
            <label>Street:</label>
            <span>{{ userProfile.address.street }}</span>
          </div>
          <div class="info-item">
            <label>Suite:</label>
            <span>{{ userProfile.address.suite }}</span>
          </div>
          <div class="info-item">
            <label>City:</label>
            <span>{{ userProfile.address.city }}</span>
          </div>
          <div class="info-item">
            <label>Zipcode:</label>
            <span>{{ userProfile.address.zipcode }}</span>
          </div>
        </div>

        <div class="profile-section" *ngIf="userProfile.company">
          <h3>Company</h3>
          <div class="info-item">
            <label>Name:</label>
            <span>{{ userProfile.company.name }}</span>
          </div>
          <div class="info-item">
            <label>Catch Phrase:</label>
            <span>{{ userProfile.company.catchPhrase }}</span>
          </div>
          <div class="info-item">
            <label>Business:</label>
            <span>{{ userProfile.company.bs }}</span>
          </div>
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
      text-align: center;
      margin-bottom: 20px;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }
    
    .profile-header h2 {
      color: #333;
      margin: 0;
    }
    
    .profile-section {
      margin-bottom: 25px;
    }
    
    .profile-section h3 {
      color: #555;
      border-bottom: 1px solid #eee;
      padding-bottom: 5px;
    }
    
    .info-item {
      display: flex;
      margin-bottom: 10px;
      padding: 5px 0;
    }
    
    .info-item label {
      font-weight: bold;
      min-width: 100px;
      color: #666;
    }
    
    .info-item span {
      flex: 1;
      color: #333;
    }
  `]
})
export class UserProfileComponent implements OnInit {
  userProfile: UserProfile = {
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    username: 'johndoe',
    phone: '1-770-736-8031 x56442',
    website: 'hildegard.org',
    address: {
      street: 'Kulas Light',
      suite: 'Apt. 556',
      city: 'Gwenborough',
      zipcode: '92998-3874'
    },
    company: {
      name: 'Romaguera-Crona',
      catchPhrase: 'Multi-layered client-server neural-net',
      bs: 'harness real-time e-markets'
    }
  };

  constructor() { }

  ngOnInit(): void {
  }
}