//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 고혜지 on 1/6/24.
//

import Foundation

class Person {
  let name: String
  fileprivate(set) var money: UInt
  
  init(name: String, money: UInt) {
    self.name = name
    self.money = money
  }
  
  func checkBalance() {
    print("\(name)의 잔액은 \(money)원 입니다.")
  }
}

final class Employee: Person {
  func earnMoney(_ amount: UInt) {
    money += amount
  }
}

final class Customer: Person {
  func placeOrder(_ item: Coffee, of coffeeShop: CoffeeShop) {
    print("\(name)(이/가) \(coffeeShop.name)에서 \(item.rawValue)를 주문했습니다.")
    do {
      let result = try coffeeShop.takeOrder(item, from: name, balance: money)
      if result.isSuccess {
        money = result.remainingBalance
        try pickUpCoffee(of: coffeeShop)
      } else {
        print("잔액이 \(result.shortfallAmount)원만큼 부족합니다.")
      }
    } catch {
      print("Error: \(error.localizedDescription)")
    }
  }
  
  private func pickUpCoffee(of coffeeShop: CoffeeShop) throws {
    let item = try coffeeShop.getCoffeeFromPickupTable(by: name)
    print("\(name)(이/가) 픽업대에서 \(item.rawValue)를 가져왔습니다.")
  }
}
