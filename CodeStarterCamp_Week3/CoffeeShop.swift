//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 홍승주 on 2022/04/28.
//

import Foundation

struct CoffeeShop {
   var sales: Int?
    var pickUpTable: Coffee?
   var barista: Person?
   
   func getOrder() {
        print("어떤 커피를 드릴까요?")
    }
    func makeCoffee() {
      print("커피를 만들고 있습니다. 잠시만 기다려 주세요.")
    }
}
