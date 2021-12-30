//
//  person.swift
//  CodeStarterCamp_Week3
//
//  Created by song on 2021/12/23.
//

import Foundation

struct Person {
    
  var money: Int
  let name: String
    
  func buy() {
  //TODO: 나중에 사람이 먼가를 살때 사용할 함수
  }
  
   func takeCoffee(coffee: Coffee, coffeeShop: CoffeeShop) {
    var CoffeeShopPickUpTable = coffeeShop.pickUpTable
    print("커피를 가져갔습니다.")
    CoffeeShopPickUpTable.removeFirst()
    print(CoffeeShopPickUpTable)
    }
}
