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
    catchPhrase: string;
    bs: string;
  };
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile" *ngIf="user">
      <div class="profile-header">
        <h2>{{ user.name }}</h2>
        <p class="username">@{{ user.username }}</p>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Email:</strong>
          <a [href]="'mailto:' + user.email">{{ user.email }}</a>
        </div>
        
        <div class="detail-item">
          <strong>Phone:</strong>
          <a [href]="'tel:' + user.phone">{{ user.phone }}</a>
        </div>
        
        <div class="detail-item">
          <strong>Website:</strong>
          <a [href]="'https://' + user.website" target="_blank">{{ user.website }}</a>
        </div>
        
        <div class="detail-item" *ngIf="user.address">
          <strong>Address:</strong>
          <div>
            {{ user.address.street }}, {{ user.address.suite }}<br>
            {{ user.address.city }}, {{ user.address.zipcode }}
          </div>
        </div>
        
        <div class="detail-item" *ngIf="user.company">
          <strong>Company:</strong>
          <div>
            {{ user.company.name }}<br>
            <em>{{ user.company.catchPhrase }}</em>
          </div>
        </div>
      </div>
    </div>
    
    <div *ngIf="!user" class="no-user">
      <p>No user data available.</p>
    </div>
  `,
  styles: [`
    .user-profile {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      max-width: 500px;
      margin: 20px auto;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .profile-header h2 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .username {
      color: #666;
      font-style: italic;
      margin: 0 0 15px 0;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      margin-bottom: 12px;
      padding-bottom: 12px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item:last-child {
      border-bottom: none;
      margin-bottom: 0;
      padding-bottom: 0;
    }
    
    .detail-item strong {
      display: inline-block;
      width: 80px;
      color: #555;
    }
    
    a {
      color: #007bff;
      text-decoration: none;
    }
    
    a:hover {
      text-decoration: underline;
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