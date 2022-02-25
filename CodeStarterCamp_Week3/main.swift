//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
  let money: Int
  func buyThing() {
  }
}

struct CoffeeShop {
  let salesRevenue: Int
  let menus: [Coffee: Int] = [:]
  let pickUpTable: [Coffee] = []
  
  func takeAnOrder(of coffee: Coffee) {
  }
  
  func make(coffee: Coffee) {
  }
}

enum Coffee {
  case americano
  case latte
  case cappuccino
  case caffeMocha
  case espresso
}
