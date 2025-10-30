import { Component, Input } from '@angular/core';

interface User {
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
  };
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile-card" *ngIf="user">
      <h2>User Profile</h2>
      <div class="profile-info">
        <p><strong>Name:</strong> {{ user.name }}</p>
        <p><strong>Username:</strong> {{ user.username }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Phone:</strong> {{ user.phone }}</p>
        <p><strong>Website:</strong> {{ user.website }}</p>
        <div *ngIf="user.address" class="address-section">
          <h3>Address</h3>
          <p><strong>Street:</strong> {{ user.address.street }}</p>
          <p><strong>Suite:</strong> {{ user.address.suite }}</p>
          <p><strong>City:</strong> {{ user.address.city }}</p>
          <p><strong>Zipcode:</strong> {{ user.address.zipcode }}</p>
        </div>
        <div *ngIf="user.company" class="company-section">
          <h3>Company</h3>
          <p><strong>Name:</strong> {{ user.company.name }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile-card {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      margin: 20px 0;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      max-width: 500px;
    }
    
    .profile-info p {
      margin: 10px 0;
    }
    
    .address-section, .company-section {
      margin-top: 15px;
      padding-top: 15px;
      border-top: 1px solid #eee;
    }
    
    h2, h3 {
      color: #333;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User | undefined;
}