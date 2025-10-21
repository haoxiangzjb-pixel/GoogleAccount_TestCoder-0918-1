import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  phone: string;
  address: string;
  bio: string;
  avatar?: string;
}

@Component({
  selector: 'app-profile-display',
  template: `
    <div class="user-profile-card">
      <div class="profile-header">
        <img 
          [src]="user.avatar || 'https://via.placeholder.com/150'" 
          [alt]="user.name"
          class="profile-image"
        />
        <h1 class="profile-name">{{ user.name }}</h1>
      </div>
      
      <div class="profile-body">
        <div class="profile-item">
          <strong>Email:</strong>
          <span>{{ user.email }}</span>
        </div>
        
        <div class="profile-item">
          <strong>Phone:</strong>
          <span>{{ user.phone }}</span>
        </div>
        
        <div class="profile-item">
          <strong>Address:</strong>
          <span>{{ user.address }}</span>
        </div>
        
        <div class="profile-item" *ngIf="user.bio">
          <strong>Bio:</strong>
          <p>{{ user.bio }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile-card {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      max-width: 500px;
      margin: 20px auto;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      font-family: Arial, sans-serif;
    }
    
    .profile-header {
      text-align: center;
      margin-bottom: 20px;
    }
    
    .profile-image {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      border: 3px solid #eee;
    }
    
    .profile-name {
      margin: 10px 0 0;
      color: #333;
    }
    
    .profile-body {
      display: flex;
      flex-direction: column;
      gap: 12px;
    }
    
    .profile-item {
      display: flex;
      flex-direction: column;
      gap: 4px;
    }
    
    .profile-item strong {
      color: #555;
      font-size: 0.9em;
    }
    
    .profile-item span, 
    .profile-item p {
      color: #222;
      margin: 0;
    }
  `]
})
export class ProfileDisplayComponent {
  @Input() user!: UserProfile;
}