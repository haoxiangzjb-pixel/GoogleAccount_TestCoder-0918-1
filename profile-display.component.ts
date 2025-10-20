import { Component, Input } from '@angular/core';

interface UserProfile {
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
  selector: 'app-profile-display',
  template: `
    <div class="profile-card">
      <header class="profile-header">
        <h2>{{ title || 'User Profile' }}</h2>
      </header>
      
      <div class="profile-content" *ngIf="profile">
        <section class="basic-info">
          <h3>Basic Information</h3>
          <div class="info-item">
            <label>Name:</label>
            <span>{{ profile.name }}</span>
          </div>
          <div class="info-item">
            <label>ID:</label>
            <span>{{ profile.id }}</span>
          </div>
          <div class="info-item">
            <label>Email:</label>
            <span>{{ profile.email }}</span>
          </div>
          <div class="info-item">
            <label>Phone:</label>
            <span>{{ profile.phone }}</span>
          </div>
          <div class="info-item">
            <label>Website:</label>
            <a [href]="'http://' + profile.website" target="_blank">{{ profile.website }}</a>
          </div>
        </section>
        
        <section class="address-info" *ngIf="profile.address">
          <h3>Address</h3>
          <div class="info-item">
            <label>Street:</label>
            <span>{{ profile.address.street }}</span>
          </div>
          <div class="info-item">
            <label>Suite:</label>
            <span>{{ profile.address.suite }}</span>
          </div>
          <div class="info-item">
            <label>City:</label>
            <span>{{ profile.address.city }}</span>
          </div>
          <div class="info-item">
            <label>ZIP Code:</label>
            <span>{{ profile.address.zipcode }}</span>
          </div>
        </section>
        
        <section class="company-info" *ngIf="profile.company">
          <h3>Company</h3>
          <div class="info-item">
            <label>Name:</label>
            <span>{{ profile.company.name }}</span>
          </div>
          <div class="info-item">
            <label>Catch Phrase:</label>
            <span>{{ profile.company.catchPhrase }}</span>
          </div>
          <div class="info-item">
            <label>Business:</label>
            <span>{{ profile.company.bs }}</span>
          </div>
        </section>
      </div>
      
      <div class="no-profile" *ngIf="!profile">
        <p>No profile data available</p>
      </div>
    </div>
  `,
  styles: [`
    .profile-card {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      background-color: white;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    .profile-header {
      border-bottom: 2px solid #007bff;
      padding-bottom: 10px;
      margin-bottom: 20px;
    }
    
    .profile-header h2 {
      margin: 0;
      color: #333;
    }
    
    .profile-content {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }
    
    section {
      border: 1px solid #e0e0e0;
      border-radius: 8px;
      padding: 15px;
      background-color: #f9f9f9;
    }
    
    section h3 {
      margin-top: 0;
      color: #007bff;
      border-bottom: 1px solid #ddd;
      padding-bottom: 8px;
    }
    
    .info-item {
      display: flex;
      margin-bottom: 10px;
      padding-bottom: 8px;
      border-bottom: 1px dashed #eee;
    }
    
    .info-item label {
      font-weight: bold;
      min-width: 120px;
      color: #555;
    }
    
    .info-item span, .info-item a {
      flex: 1;
      color: #333;
    }
    
    .info-item a {
      text-decoration: none;
      color: #007bff;
    }
    
    .info-item a:hover {
      text-decoration: underline;
    }
    
    .no-profile {
      text-align: center;
      padding: 30px;
      color: #999;
      font-style: italic;
    }
  `]
})
export class ProfileDisplayComponent {
  @Input() profile: UserProfile | undefined;
  @Input() title: string = '';
}