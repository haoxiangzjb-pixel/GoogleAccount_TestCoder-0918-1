import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { DataDisplayComponent } from './data-display/data-display.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, DataDisplayComponent],
  template: `
    <h1>Welcome to {{title}}!</h1>

    <app-data-display></app-data-display>

    <router-outlet />
  `,
  styles: [],
})
export class AppComponent {
  title = 'my-angular-app';
}
