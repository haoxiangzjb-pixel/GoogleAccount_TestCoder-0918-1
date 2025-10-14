import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  role: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-card" *ngIf="profile">
      <h2>User Profile</h2>
      <p><strong>ID:</strong> {{ profile.id }}</p>
      <p><strong>Name:</strong> {{ profile.name }}</p>
      <p><strong>Email:</strong> {{ profile.email }}</p>
      <p><strong>Role:</strong> {{ profile.role }}</p>
    </div>
  `,
  styles: [`
    .profile-card {
      border: 1px solid #ccc;
      padding: 16px;
      margin: 8px;
      max-width: 300px;
      box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
    }
  `]
})
export class UserProfileComponent {
  @Input() profile?: UserProfile;
}