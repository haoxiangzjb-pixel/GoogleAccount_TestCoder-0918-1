import { Component, Input } from '@angular/core';

interface User {
  id: number;
  name: string;
  email: string;
  username: string;
  phone: string;
  website: string;
  company?: {
    name: string;
    catchPhrase: string;
    bs: string;
  };
  address?: {
    street: string;
    suite: string;
    city: string;
    zipcode: string;
    geo: {
      lat: string;
      lng: string;
    };
  };
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile" *ngIf="user">
      <h2>{{ user.name }}'s Profile</h2>
      <div class="profile-info">
        <p><strong>ID:</strong> {{ user.id }}</p>
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
          <p><strong>Coordinates:</strong> {{ user.address.geo.lat }}, {{ user.address.geo.lng }}</p>
        </div>
        
        <div *ngIf="user.company" class="company-section">
          <h3>Company</h3>
          <p><strong>Name:</strong> {{ user.company.name }}</p>
          <p><strong>Catch Phrase:</strong> {{ user.company.catchPhrase }}</p>
          <p><strong>BS:</strong> {{ user.company.bs }}</p>
        </div>
      </div>
    </div>
    <div *ngIf="!user" class="no-user">
      <p>No user data available</p>
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
      background-color: #f9f9f9;
    }
    
    .profile-info p {
      margin: 8px 0;
    }
    
    h2 {
      color: #333;
      border-bottom: 2px solid #007bff;
      padding-bottom: 10px;
    }
    
    h3 {
      color: #555;
      margin-top: 15px;
      margin-bottom: 10px;
    }
    
    .address-section, .company-section {
      margin-top: 15px;
      padding-top: 15px;
      border-top: 1px solid #eee;
    }
    
    .no-user {
      text-align: center;
      padding: 20px;
      color: #666;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User | null = null;
}