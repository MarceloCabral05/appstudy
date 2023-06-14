import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SharedDataService {
  private topics: any[] = [];

  constructor() { }

  setTopics(topics: any[]) {
    this.topics = topics;
  }

  getTopics() {
    return this.topics;
  }
}
