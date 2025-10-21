import { Component, Input } from '@angular/core';

export interface User {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  location: string;
  jobTitle: string;
  company: string;
  profilePicture: string;
  about: string;
}

@Component({
  selector: 'app-user-info-card',
  template: `
    <div class="user-card">
      <div class="user-header">
        <img [src]="user.profilePicture" [alt]="user.firstName + ' ' + user.lastName" class="user-avatar">
        <div class="user-basic-info">
          <h2>{{ user.firstName }} {{ user.lastName }}</h2>
          <p class="job-title">{{ user.jobTitle }} at {{ user.company }}</p>
        </div>
      </div>
      
      <div class="user-details">
        <div class="detail-item">
          <span class="label">Email:</span>
          <span class="value">{{ user.email }}</span>
        </div>
        <div class="detail-item">
          <span class="label">Phone:</span>
          <span class="value">{{ user.phone }}</span>
        </div>
        <div class="detail-item">
          <span class="label">Location:</span>
          <span class="value">{{ user.location }}</span>
        </div>
        <div class="detail-item">
          <span class="label">About:</span>
          <p class="value about-text">{{ user.about }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-card {
      border: 1px solid #e0e0e0;
      border-radius: 12px;
      padding: 24px;
      max-width: 500px;
      margin: 20px auto;
      background-color: #fff;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    }
    
    .user-header {
      display: flex;
      align-items: center;
      margin-bottom: 24px;
      padding-bottom: 16px;
      border-bottom: 1px solid #eee;
    }
    
    .user-avatar {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 16px;
      border: 2px solid #f0f0f0;
    }
    
    .user-basic-info h2 {
      margin: 0 0 8px 0;
      color: #333;
      font-size: 1.5rem;
    }
    
    .job-title {
      margin: 0;
      color: #666;
      font-style: italic;
    }
    
    .user-details {
      display: flex;
      flex-direction: column;
      gap: 12px;
    }
    
    .detail-item {
      display: flex;
      flex-wrap: wrap;
      gap: 12px;
    }
    
    .label {
      font-weight: 600;
      color: #555;
      min-width: 80px;
      flex-shrink: 0;
    }
    
    .value {
      color: #333;
      flex: 1;
    }
    
    .about-text {
      margin: 0;
      line-height: 1.5;
    }
  `]
})
export class UserInfoCardComponent {
  @Input() user!: User;
}