import { Component, OnInit } from '@angular/core';
import {Resource} from '../resource';
import {Location} from "@angular/common"

@Component({
  selector: 'app-tarrif',
  templateUrl: './tarrif.component.html',
  styleUrls: ['./tarrif.component.css']
})
export class TarrifComponent implements OnInit {

  resources: Resource[] = [
    {name: "Prąd", price: 0.58},
    {name: "Gaz", price: 1.95},
    {name: "Woda zimna", price: 9.85},
    {name: "Woda ciepła", price: 34.67},
    {name: "Śmieci", price: 65},
  ] 
  
  constructor(private location: Location) { }

  ngOnInit(): void {
  }

  back(): void {
    this.location.back();
  }

}
