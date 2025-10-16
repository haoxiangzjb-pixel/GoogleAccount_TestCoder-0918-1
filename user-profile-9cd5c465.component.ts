import { Component, Input } from '@angular/core';

interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  username: string;
  avatar?: string;
  bio?: string;
  joinDate: string;
  location?: string;
  socialLinks?: {
    twitter?: string;
    github?: string;
    linkedin?: string;
  };
}

@Component({
  selector: 'app-user-profile-9cd5c465',
  template: `
    <div class="profile-container" *ngIf="profile">
      <div class="profile-card">
        <div class="profile-header">
          <img 
            *ngIf="profile.avatar" 
            [src]="profile.avatar" 
            [alt]="profile.firstName + ' ' + profile.lastName"
            class="avatar"
          >
          <div class="user-info">
            <h1>{{ profile.firstName }} {{ profile.lastName }}</h1>
            <h3>@{{ profile.username }}</h3>
            <p class="email">{{ profile.email }}</p>
          </div>
        </div>
        
        <div class="profile-body">
          <div class="bio-section" *ngIf="profile.bio">
            <h4>About</h4>
            <p>{{ profile.bio }}</p>
          </div>
          
          <div class="details-section">
            <div class="detail-item">
              <strong>Member since:</strong>
              <span>{{ profile.joinDate }}</span>
            </div>
            
            <div class="detail-item" *ngIf="profile.location">
              <strong>Location:</strong>
              <span>{{ profile.location }}</span>
            </div>
          </div>
          
          <div class="social-section" *ngIf="profile.socialLinks">
            <h4>Connect</h4>
            <div class="social-links">
              <a *ngIf="profile.socialLinks.twitter" [href]="profile.socialLinks.twitter" target="_blank" class="social-link">
                Twitter
              </a>
              <a *ngIf="profile.socialLinks.github" [href]="profile.socialLinks.github" target="_blank" class="social-link">
                GitHub
              </a>
              <a *ngIf="profile.socialLinks.linkedin" [href]="profile.socialLinks.linkedin" target="_blank" class="social-link">
                LinkedIn
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div *ngIf="!profile" class="no-profile">
      <p>User profile not available</p>
    </div>
  `,
  styles: [`
    .profile-container {
      max-width: 600px;
      margin: 2rem auto;
      padding: 0 1rem;
    }
    
    .profile-card {
      background: white;
      border-radius: 12px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }
    
    .profile-header {
      background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
      color: white;
      padding: 2rem;
      display: flex;
      align-items: center;
      gap: 1.5rem;
    }
    
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      border: 3px solid white;
    }
    
    .user-info h1 {
      margin: 0 0 0.5rem 0;
      font-size: 1.8rem;
    }
    
    .user-info h3 {
      margin: 0 0 0.5rem 0;
      font-weight: normal;
      opacity: 0.9;
    }
    
    .email {
      opacity: 0.8;
      margin: 0;
    }
    
    .profile-body {
      padding: 2rem;
    }
    
    .bio-section h4,
    .social-section h4 {
      margin: 0 0 1rem 0;
      color: #333;
      border-bottom: 1px solid #eee;
      padding-bottom: 0.5rem;
    }
    
    .bio-section p {
      color: #666;
      line-height: 1.6;
    }
    
    .details-section {
      margin: 1.5rem 0;
    }
    
    .detail-item {
      display: flex;
      margin-bottom: 0.8rem;
    }
    
    .detail-item strong {
      width: 120px;
      color: #555;
    }
    
    .social-section .social-links {
      display: flex;
      gap: 1rem;
    }
    
    .social-link {
      background: #f0f5ff;
      color: #2575fc;
      padding: 0.5rem 1rem;
      border-radius: 20px;
      text-decoration: none;
      font-size: 0.9rem;
    }
    
    .social-link:hover {
      background: #e1ebff;
    }
    
    .no-profile {
      text-align: center;
      padding: 3rem;
      color: #666;
    }
  `]
})
export class UserProfile9cd5c465Component {
  @Input() profile: UserProfile | null = null;
}