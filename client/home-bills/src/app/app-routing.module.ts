import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { TarrifComponent } from './tarrif/tarrif.component';

const routes: Routes = [
  {path: '', component: HomeComponent},
  {path: 'tarrif', component: TarrifComponent}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
