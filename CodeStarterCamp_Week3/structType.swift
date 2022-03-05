//
//  structType.swift
//  CodeStarterCamp_Week3
//
//  Created by ohtt on 2022/03/05.
//

import Foundation

struct PersonStruct {
  let name: String
  private var money: Int
  
  init(name: String, money: Int) {
    self.name = name
    self.money = money
  }
  
  func hasEnoughMoney(toBuy coffee: Coffee) -> Bool {
    return self.money >= coffee.price
  }
  
  mutating func buy(coffee: Coffee) {
      self.money -= coffee.price
  }
}

struct CoffeeShopStruct {
  private var barista: PersonStruct
  private var salesRevenue: Int = 0
  private var menus: [Coffee] = Coffee.allCases
  private var pickUpTable: [(coffee: Coffee, name: String)] = [] {
    didSet {
      guard let customerName = pickUpTable.last?.name else { return }
      call(customerName)
    }
  }
  
  init(barista: PersonStruct) {
    self.barista = barista
  }
  
  mutating func takeAnOrder(of coffee: Coffee, from customer: String) {
    self.salesRevenue += coffee.price
    make(coffee: coffee, for: customer)
  }
  
  mutating private func make(coffee: Coffee, for customer: String) {
    self.pickUpTable.append((coffee, customer))
  }
  
  private func call(_ customerName: String) {
    print("\(customerName) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요")
  }
}


