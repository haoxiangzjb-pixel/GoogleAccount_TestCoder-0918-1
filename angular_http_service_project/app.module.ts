import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http'; // Необходимо для HttpClient

import { AppComponent } from './app.component';
import { HttpDataService } from './http-data.service';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule // Импортируем модуль для HTTP-запросов
  ],
  providers: [
    HttpDataService // Регистрируем сервис
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }