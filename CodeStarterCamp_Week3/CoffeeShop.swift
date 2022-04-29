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
   var menu: [Coffee: Int]? = [.아메리카노: 4000, .에스프레소: 2500, .바닐라라떼: 4500, .복숭아스무디: 5000, .아인슈패너: 5000, .카페라떼: 4500, .딸기스무디: 5000, .시그니쳐초콜릿: 6000]

   func getOrder() {
        print("어떤 커피를 드릴까요?")
    }
    func makeCoffee() {
      print("커피를 만들고 있습니다. 잠시만 기다려 주세요.")
    }
}
