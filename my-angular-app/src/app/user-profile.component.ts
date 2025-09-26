import { Component, Input } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
  role: string;
}

@Component({
  selector: 'app-user-profile',
  standalone: true,
  template: `
    <div class="user-profile">
      <h2>User Profile</h2>
      <div class="profile-info">
        <p><strong>ID:</strong> {{ user.id }}</p>
        <p><strong>Name:</strong> {{ user.name }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Role:</strong> {{ user.role }}</p>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      border: 1px solid #ccc;
      padding: 16px;
      max-width: 400px;
      margin: 16px;
      border-radius: 4px;
      font-family: Arial, sans-serif;
    }
    .profile-info p {
      margin: 8px 0;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: User;
 // In a real app, you might fetch the user data here
}