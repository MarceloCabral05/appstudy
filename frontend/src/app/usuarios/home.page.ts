import { Component, OnInit, Inject } from '@angular/core';
import { RefresherCustomEvent } from '@ionic/angular';
import { MessageComponent } from '../message/message.component';

import { DataService, Message } from '../services/data.service';
import axios from 'axios';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnInit {
  private data: DataService;
  
  usuarios: any = [];

  constructor(@Inject(DataService) dataService: DataService) {
    this.data = dataService;
  }

  refresh(ev: any) {
    setTimeout(() => {
      (ev as RefresherCustomEvent).detail.complete();
    }, 3000);
  }

  getMessages(): Message[] {
    return this.data.getMessages();
  }

  // Actualizar luego de modificar
  ionViewWillEnter(): void {
    // this.getUsers();
  }
  ngOnInit(): void {
    this.getUsers();
  }

  // Recuperar info del backend
   getUsers () {
    let token = localStorage.getItem("token");
    let config = {
      headers : {
      "Authorization" : token
    }
  }

    axios.get("http://localhost:3000/users/list", config)
    .then(result => {
      if (result.data.success == true) {
        this.usuarios = result.data.usuarios;
      } else {
        console.log(result.data.error)
      }
    }).catch(error => {
      console.log(error.message)
    })
  }
}
