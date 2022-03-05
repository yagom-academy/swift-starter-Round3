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
  private var money: Int = 0
  
  init(name: String) {
    self.name = name
  }
  
  func buy(coffee: Coffee, from coffeeShop: CoffeeShop) {
    if self.money < coffee.price {
      print("잔액이 \(coffee.price - self.money)원만큼 부족합니다")
    } else {
      self.money -= coffee.price
      coffeeShop.takeAnOrder(of: coffee, from: self)
    }
  }
}

class CoffeeShop {
  private var barista: Person
  private var salesRevenue: Int = 0
  private var menus: [Coffee] = Coffee.allCases
  private var pickUpTable: [Coffee] = []
  
  init(barista: Person) {
    self.barista = barista
  }
  
  func takeAnOrder(of coffee: Coffee, from customer: Person) {
    self.salesRevenue += coffee.price
    make(coffee: coffee, for: customer)
  }
  
  private func make(coffee: Coffee, for customer: Person) {
    self.pickUpTable.append(coffee)
    print("\(customer.name) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요")
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

let misterLee = Person(name: "misterLee")
let missKim = Person(name: "missKim")

let yagombucks = CoffeeShop(barista: misterLee)
missKim.buy(coffee: .americano, from: yagombucks)
