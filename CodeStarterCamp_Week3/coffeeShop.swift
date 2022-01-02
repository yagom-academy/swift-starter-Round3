//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by song on 2021/12/23.
//

import Foundation

class CoffeeShop {
    
  let menu: Array<Coffee> = [.milk,
                             .americano]
  var barista: Person
  var totalSales: Int
  var pickUpTable: [Coffee] = [] {
    didSet {
      print("준비중입니다.")
  }
}
  init(menu: Array<Coffee>, barista: Person, totalSales: Int, pickUpTable: Array<Coffee>) {
    self.barista = barista
    self.totalSales = totalSales
    self.pickUpTable = pickUpTable
  }
    
  func order(customer: Person, coffee: Coffee, coffeeShop: CoffeeShop) {
    if customer.money < coffee.rawValue {
      print("\(coffee)를 주문받았습니다")
      print("\(coffee)의 값은\(coffee.rawValue)입니다.")
      print("잔액이 \(coffee.rawValue - customer.money)원 부족합니다.")
  } else {
      customer.money -= coffee.rawValue
      coffeeShop.totalSales += coffee.rawValue
      print("\(coffee)를 주문받았습니다")
      print("\(coffee)의 값은\(coffee.rawValue)입니다.")
      print("\(coffee)에 대한 계산 도와드리겠습니다.")
      print("내잔액 : \(customer.money), 카페 총매출: \(coffeeShop.totalSales)")
      makeCoffee(customer: customer.name, coffee: coffee)
    }
  }

   func makeCoffee(customer: String, coffee: Coffee) {
    pickUpTable.append(coffee)
    print("\(customer)님의 \(coffee)가 준비되었습니다. 픽업대에서 가져가 주세요.")
    }
  }

enum Coffee: Int {
    case milk = 10000
    case americano = 100
}
