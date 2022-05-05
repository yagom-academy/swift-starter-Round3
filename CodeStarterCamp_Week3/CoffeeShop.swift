//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 홍승주 on 2022/04/28.
//

import Foundation

class CoffeeShop {
    var sales: Int
    var pickUpTable: Coffee?
    var barista: Person?
    var menu: [Coffee: Int] = [.아메리카노: 4000, .에스프레소: 2500, .바닐라라떼: 4500, .복숭아스무디: 5000, .아인슈패너: 5000, .카페라떼: 4500, .딸기스무디: 5000, .시그니쳐초콜릿: 6000]
   
    init(sales: Int) {
        self.sales = sales
    }
   
    func getOrder(_ coffee: Coffee, _ person: Person) {
        if let coffeePrice = menu[coffee] {
            if coffeePrice <= person.money {
                self.sales += coffeePrice
                person.money -= coffeePrice
                makeCoffee(coffee, person)
            } else {
                print("잔액이 \(coffeePrice - person.money)원 만큼 부족합니다.")
            }
        } else {
            print("주문하신 음료는 없는 음료입니다.")
        }
    }
   
    func makeCoffee(_ coffee: Coffee, _ person: Person) {
        pickUpTable = coffee
        print("\(person.name)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요")
    }
}

