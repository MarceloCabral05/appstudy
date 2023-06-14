import { NgModule } from '@angular/core';
import { RouterModule, Routes, PreloadAllModules } from '@angular/router';

const routes: Routes = [
  {
    path: 'paginainicio',
    loadChildren: () => import('./pagina-inicio/pagina-inicio.module').then(m => m.PaginaInicioModule)
  },
  {
    path: 'usuarios',
    loadChildren: () => import('./usuarios/home.module').then( m => m.HomePageModule)
  },
  {
    path: 'login',
    loadChildren: () => import('./login/login-user.module').then( m => m.LoginPageModule)
  },
  {
    path: 'view-message/:id',
    loadChildren: () => import('./view-message/view-message.module').then( m => m.ViewMessagePageModule)
  },
  {
    path: 'edit-user/:id',
    loadChildren: () => import('./edit-user/edit-user.module').then( m => m.EditUserPageModule)
  },
  {
    path: 'topics',
    loadChildren: () => import('./topic/topic.module').then( m => m.TopicPageModule)
  },
  {
    path: 'edit-topic/:id',
    loadChildren: () => import('./edit-topic/edit-topic.module').then( m => m.EditTopicPageModule)
  },
  
  {
    path: '',
    redirectTo: 'paginainicio', // Cambiado a 'paginainicio'
    pathMatch: 'full'
  },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
