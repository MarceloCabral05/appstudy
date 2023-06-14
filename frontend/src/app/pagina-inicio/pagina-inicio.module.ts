import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';

import { PaginaInicioRoutingModule } from './pagina-inicio-routing.module';
import { PaginaInicioComponent } from './pagina-inicio.component';

@NgModule({
  imports: [
    CommonModule,
    IonicModule,
    PaginaInicioRoutingModule
  ],
  declarations: [PaginaInicioComponent]
})
export class PaginaInicioModule { }
