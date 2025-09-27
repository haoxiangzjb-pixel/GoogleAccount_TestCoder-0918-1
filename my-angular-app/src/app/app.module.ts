import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http'; // Импортируем HttpClientModule

import { AppComponent } from './app.component';
import { DataService } from './data.service';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule // Добавляем в imports
  ],
  providers: [
    DataService // Регистрируем сервис
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }