import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http'; // Импорт HttpClientModule

import { AppComponent } from './app.component';
import { DataService } from './http-data-fetcher.service'; // Импорт сервиса

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule // Добавление в imports
  ],
  providers: [
    DataService // Регистрация сервиса
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }