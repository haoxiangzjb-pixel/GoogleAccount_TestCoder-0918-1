import { Component, Input } from '@angular/core';

interface User {
  id: number;
  name: string;
  email: string;
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
      <h2>User Profile</h2>
      <div *ngIf="user" class="profile-container">
        <div class="profile-header">
          <h3>{{ user.name }}</h3>
          <p><strong>ID:</strong> {{ user.id }}</p>
        </div>
        <div class="profile-details">
          <p><strong>Email:</strong> {{ user.email }}</p>
          <p><strong>Phone:</strong> {{ user.phone }}</p>
          <p><strong>Website:</strong> {{ user.website }}</p>
          <div *ngIf="user.address" class="address">
            <h4>Address</h4>
            <p>{{ user.address.street }}, {{ user.address.suite }}</p>
            <p>{{ user.address.city }}, {{ user.address.zipcode }}</p>
          </div>
          <div *ngIf="user.company" class="company">
            <h4>Company</h4>
            <p>{{ user.company.name }}</p>
            <p>{{ user.company.catchPhrase }}</p>
            <p>{{ user.company.bs }}</p>
          </div>
        </div>
      </div>
      <div *ngIf="!user" class="no-user">
        <p>No user data available</p>
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
    
    .profile-container {
      border: 1px solid #eee;
      padding: 15px;
      border-radius: 5px;
      background-color: #f9f9f9;
    }
    
    .profile-header h3 {
      margin: 0 0 10px 0;
      color: #333;
    }
    
    .profile-details p {
      margin: 8px 0;
      line-height: 1.5;
    }
    
    .address, .company {
      margin-top: 15px;
      padding-top: 10px;
      border-top: 1px solid #eee;
    }
    
    .address h4, .company h4 {
      margin: 0 0 10px 0;
      color: #555;
    }
    
    .no-user {
      text-align: center;
      color: #999;
      font-style: italic;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User | undefined;
}