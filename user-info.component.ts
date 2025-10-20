import { Component, Input } from '@angular/core';

interface User {
  id: number;
  name: string;
  username: string;
  email: string;
  phone: string;
  website: string;
  address: {
    street: string;
    suite: string;
    city: string;
    zipcode: string;
  };
  company: {
    name: string;
    catchPhrase: string;
    bs: string;
  };
}

@Component({
  selector: 'app-user-info',
  template: `
    <div class="user-info-container">
      <div class="user-card">
        <h2 class="user-name">{{ user?.name }}</h2>
        <p class="user-username">@{{ user?.username }}</p>
        
        <div class="info-section">
          <h3>Contact Information</h3>
          <ul class="contact-list">
            <li><strong>Email:</strong> {{ user?.email }}</li>
            <li><strong>Phone:</strong> {{ user?.phone }}</li>
            <li><strong>Website:</strong> {{ user?.website }}</li>
          </ul>
        </div>
        
        <div class="info-section">
          <h3>Location</h3>
          <p><strong>Address:</strong> {{ user?.address.street }}, {{ user?.address.suite }}, {{ user?.address.city }}</p>
          <p><strong>ZIP Code:</strong> {{ user?.address.zipcode }}</p>
        </div>
        
        <div class="info-section">
          <h3>Company</h3>
          <p><strong>Name:</strong> {{ user?.company.name }}</p>
          <p><strong>Catchphrase:</strong> {{ user?.company.catchPhrase }}</p>
          <p><strong>Business:</strong> {{ user?.company.bs }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-info-container {
      display: flex;
      justify-content: center;
      padding: 20px;
    }
    
    .user-card {
      background: white;
      border-radius: 12px;
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
      padding: 30px;
      max-width: 600px;
      width: 100%;
    }
    
    .user-name {
      color: #2c3e50;
      margin-top: 0;
      border-bottom: 2px solid #3498db;
      padding-bottom: 10px;
    }
    
    .user-username {
      color: #7f8c8d;
      font-style: italic;
      margin-bottom: 25px;
    }
    
    .info-section {
      margin-bottom: 25px;
    }
    
    .info-section h3 {
      color: #3498db;
      margin-top: 0;
      padding-bottom: 8px;
      border-bottom: 1px solid #ecf0f1;
    }
    
    .contact-list {
      list-style-type: none;
      padding: 0;
    }
    
    .contact-list li {
      padding: 6px 0;
      border-bottom: 1px dashed #ecf0f1;
    }
    
    strong {
      color: #2c3e50;
    }
  `]
})
export class UserInfoComponent {
  @Input() user: User | undefined;
}