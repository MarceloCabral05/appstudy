import { Component, inject, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { IonicModule, Platform, ToastController } from '@ionic/angular';
import { DataService, Message } from '../services/data.service';
import axios from 'axios';

@Component({
  selector: 'app-login',
  templateUrl: './login-user.page.html',
  styleUrls: ['./login-user.page.scss'],
})
export class LoginPage implements OnInit {
  public message!: Message;
  private data = inject(DataService);
  private activatedRoute = inject(ActivatedRoute);
  private platform = inject(Platform);

  usuario: any = {};

  constructor(
    private toastController: ToastController, 
    private router: Router
  ) {}

  ngOnInit() {
    const id = this.activatedRoute.snapshot.paramMap.get('id') as string;
    //this.message = this.data.getMessageById(parseInt(id, 10));
    axios.get("http://localhost:3000/user/" + id)
    .then(result => {
      if (result.data.success == true) {
        if(result.data.usuario != null) {
          this.usuario = result.data.usuario;
        } else {
          this.usuario = {};
        }
      } else {
        console.log(result.data.error)
      }
    }).catch(error => {
      console.log(error.message)
    })
  }
  
  showPassword = false;

  togglePasswordVisibility() {
    this.showPassword = !this.showPassword;
  }

  ionViewWillEnter(): void {
    // Verifica si el usuario está logueado
    let token = localStorage.getItem("token");
    if (token) {
      this.router.navigate(["/home"]);
    }
  }

  getBackButtonText() {
    const isIos = this.platform.is('ios');
    return isIos ? 'Inbox' : '';
  }

  register() {
    // Agrega la lógica para el registro de usuario aquí
  }

  loginUser() {
    console.log("usuario", this.usuario);
    var data = {
      email: this.usuario.email,
      password: this.usuario.password
    };

    // URL del servidor de autenticación
    axios.post("http://localhost:3000/user/login", data)
    .then(async (result) => {
      if (result.data.success == true) {
        this.presentToast("Usuario logueado");
        localStorage.setItem("token", result.data.token);

        this.router.navigate(["/home"]);
  
      } else {
        this.presentToast(result.data.error);
      }
    }).catch(error => {
      this.presentToast(error.message);
    })
  }

  async presentToast(message: string) {
    const toast = await this.toastController.create({
      message: message,
      duration: 1500,
      position: 'bottom'
    });
    await toast.present();
  }
}
