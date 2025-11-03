import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule, Routes } from '@angular/router';

import { AppComponent } from './app.component';
import { DataListComponent } from './data-list.component';
import { DataDetailComponent } from './data-detail.component';
import { DataService } from './data.service';

// Define routes
const routes: Routes = [
  { path: '', component: DataListComponent },
  { path: 'detail/:id', component: DataDetailComponent },
  { path: '**', redirectTo: '' }
];

@NgModule({
  declarations: [
    AppComponent,
    DataListComponent,
    DataDetailComponent
  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot(routes)
  ],
  providers: [
    DataService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }