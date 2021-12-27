//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by song on 2021/12/23.
//

import Foundation

class CoffeeShop {
  enum Coffee {
    case milk
    case iceamricano
    case cappuccino
    case americano
  }
  let menu  = [Coffee.americano: 100, Coffee.cappuccino: 120, Coffee.milk: 130, Coffee.iceamricano: 140]
    
  var barista: Person?
  var totalSales: Int
  var pickupTable: [String] = []
    
  init(totalSales: Int, pickupTable: Array<String>) {
    self.totalSales = totalSales
    self.pickupTable = pickupTable
  }
   
  func takeOrder() {
    print("주문을 받습니다.")
  }
  func makeCoffee() {
    print("커피를 만듭니다.")
  }
}
