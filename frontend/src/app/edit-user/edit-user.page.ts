import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Platform, ToastController } from '@ionic/angular';
import { DataService, Message } from '../services/data.service';
import axios from 'axios';

@Component({
  selector: 'app-edit-user',
  templateUrl: './edit-user.page.html',
  styleUrls: ['./edit-user.page.scss'],
})
export class EditUserPage implements OnInit {
  public message!: Message;
  usuario: any = {};

  constructor(
    private toastController: ToastController,
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private platform: Platform,
    private data: DataService
  ) {}

  ngOnInit() {
    const id = this.activatedRoute.snapshot.paramMap.get('id') as string;
    //this.message = this.data.getMessageById(parseInt(id, 10));
    axios.get("http://localhost:3000/user/" +id)
      .then(result => {
        if (result.data.success == true) {
          this.usuario = result.data.usuario || {};
        } else {
          console.log(result.data.error);
        }
      })
      .catch(error => {
        console.log(error.message);
      });
  }

  getBackButtonText() {
    const isIos = this.platform.is('ios');
    return isIos ? 'Inbox' : '';
  }

  saveUser() {
    console.log("usuario", this.usuario);
    const data = {
      id: this.usuario.id,
      name: this.usuario.name,
      last_name: this.usuario.last_name,
      email: this.usuario.email,
      password: this.usuario.password
    };

    // Url del postman
    axios.post("http://localhost:3000/users/update", data)
      .then(async (result) => {
        if (result.data.success == true) {
          this.presentToast("Usuario guardado");
          this.router.navigate(["/home"]);
        } else {
          this.presentToast(result.data.error);
        }
      })
      .catch(error => {
        this.presentToast(error.message);
      });
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
