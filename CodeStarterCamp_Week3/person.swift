//  person.swift
//  CodeStarterCamp_Week3
//
//  Created by song on 2021/12/23.
//

import Foundation

class Person {
    
  var money: Int
  var name: String
    
  init(money: Int, name: String) {
        self.money = money
        self.name = name
      }
   
  //TODO: 나중에 사람이 먼가를 살때 사용할 함수
  func buy() {
   
  }
  
  func takeCoffee(coffee: Coffee, coffeeShop: CoffeeShop) {
    print("커피를 가져갔습니다.")
    coffeeShop.pickUpTable.removeFirst()
  }
}
