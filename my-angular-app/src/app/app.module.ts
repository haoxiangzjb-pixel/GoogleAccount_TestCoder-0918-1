import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http'; // Импорт HttpClientModule

// Предполагаемый компонент AppComponent
// import { AppComponent } from './app.component';

// Заглушка для AppComponent, так как он не был создан
const AppComponent = {
  selector: 'app-root',
  template: '<div></div>',
};

@NgModule({
  declarations: [
    // AppComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule, // Добавление HttpClientModule в imports
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }