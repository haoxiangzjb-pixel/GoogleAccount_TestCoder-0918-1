import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

export interface User {
  id: number;
  name: string;
  email: string;
  role: string;
}

@Component({
  selector: 'app-user-profile',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="user-profile">
      <h2>User Profile</h2>
      <div class="profile-details" *ngIf="user; else noUser">
        <p><strong>ID:</strong> {{ user.id }}</p>
        <p><strong>Name:</strong> {{ user.name }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Role:</strong> {{ user.role }}</p>
      </div>
      <ng-template #noUser>
        <p>User data not available.</p>
      </ng-template>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 400px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-family: Arial, sans-serif;
    }
    .profile-details p {
      margin: 8px 0;
    }
  `]
})
export class UserProfileComponent {
  user: User | null = {
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    role: 'Admin'
  };
}