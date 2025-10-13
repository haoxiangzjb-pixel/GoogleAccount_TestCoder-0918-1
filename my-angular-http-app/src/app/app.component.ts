import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: `
    <div>
      <h1>Мое Angular-приложение с HTTP-сервисом</h1>
      <app-data-display></app-data-display>
    </div>
  `,
  styles: []
})
export class AppComponent {
  title = 'my-angular-http-app';
}