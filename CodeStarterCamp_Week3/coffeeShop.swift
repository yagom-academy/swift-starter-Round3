//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by song on 2021/12/23.
//

import Foundation

struct CoffeeShop {
    
  let menu: Array<Coffee> = [Coffee.milk,
                             Coffee.americano]
  var barista: Person
  var totalSales: Int
  var pickUpTable: [Coffee] = [] {
    didSet {
      print("준비중입니다.")
  }
}
    
         
  mutating func order(customer: Person, coffee: Coffee, coffeeShop: CoffeeShop) -> Int{
    var customerMoney = customer.money
    var coffeeShopTotalSales = coffeeShop.totalSales
      
    if customerMoney < coffee.rawValue {
      print("\(coffee)를 주문받았습니다")
      print("\(coffee)의 값은\(coffee.rawValue)입니다.")
      print("잔액이 \(coffee.rawValue - customerMoney)원 부족합니다.")
  } else {
      customerMoney -= coffee.rawValue
      coffeeShopTotalSales += coffee.rawValue
      print("\(coffee)를 주문받았습니다")
      print("\(coffee)의 값은\(coffee.rawValue)입니다.")
      print("\(coffee)에 대한 계산 도와드리겠습니다.")
      print("내잔액 : \(customerMoney), 카페 총매출: \(coffeeShopTotalSales)")
      makeCoffee(customer: customer.name, coffee: coffee)
    }
     return customerMoney
  }

  mutating func makeCoffee(customer: String, coffee: Coffee) {
    pickUpTable.append(coffee)
    print("\(customer)님의 \(coffee)가 준비되었습니다. 픽업대에서 가져가 주세요.")
    
    }
  }

enum Coffee: Int {
    case milk = 10000
    case americano = 100
}
