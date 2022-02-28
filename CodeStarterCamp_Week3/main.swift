//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
  let name: String
  var money: Int = 0
  
  init(name: String) {
    self.name = name
  }
  
  func buyThing() {
  }
}

class CoffeeShop {
  var barista: Person
  var salesRevenue: Int = 0
  var menus: [Coffee] = Coffee.allCases
  var pickUpTable: [Coffee] = []
  
  init(barista: Person) {
    self.barista = barista
  }
  
  func takeAnOrder(of coffee: Coffee) {
  }
  
  func make(coffee: Coffee) {
  }
}

enum Coffee: CaseIterable {
  case americano
  case latte
  case cappuccino
  case caffeMocha
  case espresso
  
  var price: Int {
    switch self {
    case .americano:
      return 3000
    case .latte:
      return 4000
    case .cappuccino:
      return 4000
    case .caffeMocha:
      return 5000
    case .espresso:
      return 3000
    }
  }
}

let misterLee = Person()
let missKim = Person()

let yagombucks = CoffeeShop(barista: misterLee)
