//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
  var money: Int
  init(money: Int) {
    self.money = money
  }
    func buy(){
      print("물건을 구매합니다.")
  }
}


struct CoffeeShop {
  var totalSales = 0
  var barista: Person?
  let menu: [String: Int] = ["americano": 100, "cappuchino": 120]
  var pickUpTable = "pickUpTable"
  func takeOrder(){
    print("주문을 받습니다.")
  }
  func makeCoffee(){
    print("커피를 만듭니다.")
  }
}


enum Coffee {
  case milk
  case iceamricano
  case cappuccino
}


var yagombucks: CoffeeShop = CoffeeShop()
let misterKim: Person = Person(money: 0)

yagombucks.barista = misterKim
