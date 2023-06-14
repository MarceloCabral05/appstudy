import { Component, OnInit } from '@angular/core';
import { Platform, MenuController } from '@ionic/angular';
import { Router } from '@angular/router';
import axios from 'axios';

@Component({
  selector: 'app-pagina-inicio',
  templateUrl: './pagina-inicio.component.html',
  styleUrls: ['./pagina-inicio.component.scss'],
})
export class PaginaInicioComponent implements OnInit {
  topicos: any[] = [];
  usuarios: any[] = [];

  constructor(
    private platform: Platform,
    private menu: MenuController,
    private router: Router
  ) {}

  ngOnInit() {
    this.listarTopicos();
    this.listarUsuarios();
  }

  listarTopicos() {
    axios
      .get('http://localhost:3000/topics')
      .then((response) => {
        this.topicos = response.data;
      })
      .catch((error) => {
        console.log(error);
      });
  }

  listarUsuarios() {
    axios
      .get('http://localhost:3000/users/list')
      .then((response) => {
        this.usuarios = response.data;
      })
      .catch((error) => {
        console.log(error);
      });
  }

  loginUser() {
    // Agrega la lógica para el inicio de sesión del usuario aquí
    this.router.navigate(['/login']);
  }

  registerUser() {
    // Agrega la lógica para el registro de usuario aquí
    this.router.navigate(['/register']);
  }

  logoutUser() {
    // Agrega la lógica para el cierre de sesión del usuario aquí
    localStorage.removeItem('token');
    this.router.navigate(['/login']);
  }

  deslogOutApiToken() {
    // Agrega la lógica para el deslogOut de API Token aquí
  }

  deslogOutUsuario() {
    // Agrega la lógica para el deslogOut de Usuario aquí
  }
}
