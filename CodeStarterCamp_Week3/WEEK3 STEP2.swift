//
//  WEEK3 STEP2.swift
//  CodeStarterCamp_Week3
//
//  Created by oh namjun on 2022/07/14.
//

import Foundation

class Person {
    var name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func order(_ coffee: Coffee, from coffeeShop: CoffeeShop) {
        print("\(coffee.rawValue)를 주문했습니다.")
        
        guard let price = coffeeShop.coffeeMenuList[coffee.rawValue] else {
            print("저희 매장에서는 주문하신 메뉴가 없습니다.")
            return
        }
        if self.money > price {
            self.money -= price
            
            print("결제되었습니다. 남은 잔액은 \(self.money)원 입니다.")

            coffeeShop.makeCoffee(coffee, for: self.name)
        } else {
            print("잔액이 \(price - self.money)원만큼 부족합니다")
        }
    }
}

class CoffeeShop {
    var sales: Int
    var pickUpTable: Array<Coffee> = []
    let coffeeMenuList: Dictionary<String, Int> = ["아메리카노": 5000, "카페라떼": 6500, "녹차라떼": 6500, "카페모카": 7000]
    
    init(sales: Int) {
        self.sales = sales
    }
    
    func makeCoffee(_ coffee: Coffee, for name: String) {
        self.sales += coffeeMenuList[coffee.rawValue] ?? 0
        self.pickUpTable.append(coffee)
        
        print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        print("현재 매장의 매출액은 \(self.sales)원")
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case cafeLatte = "카페라떼"
    case greenLatte = "녹차라떼"
    case cafeMocha = "카페모카"
}
