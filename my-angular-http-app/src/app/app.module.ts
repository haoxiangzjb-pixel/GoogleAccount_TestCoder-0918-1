import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http'; // Необходимо для HttpClient

import { AppComponent } from './app.component';
import { DataDisplayComponent } from './components/data-display/data-display.component';
import { DataFetcherService1760376078 } from './services/data-fetcher-service-1760376078';

@NgModule({
  declarations: [
    AppComponent,
    DataDisplayComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule // Импортируем модуль для HTTP-запросов
  ],
  providers: [
    DataFetcherService1760376078 // Регистрируем сервис
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }