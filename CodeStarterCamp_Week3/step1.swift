//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 임기웅 on 2022/07/08.
//

import Foundation

struct Person {
    var money: Int
    var name: String
    var gender: String
    var country: String
    
    func eatFood(food: String) {
        print("\(food)를 먹습니다.")
    }
    
    mutating func purchaseCoffee(_ coffee: Coffee, coffeeShop: CoffeeShop) {
        guard let price = coffeeShop.menu[coffee] else {
            print("메뉴에 해당하는 커피가 없습니다.")
            return
        }
        
        if money >= price {
            coffeeShop.makeCoffee(coffee, from: name)
            money -= price
            coffeeShop.sales += price
            print("\(name)의 소지금액 : \(money+price) -> \(money)")
            print("가게 매출액 : \(coffeeShop.sales - price) -> \(coffeeShop.sales) \n")
        } else {
            let ininsufficientPrice = price - money
            print("금액이 \(ininsufficientPrice)원만큼 부족합니다.")
        }
    }
}

class CoffeeShop {
    var sales: Int = 0
    var barista: Person
    var pickUpTable: [Coffee] = [] {
        didSet {
            guard let coffee = pickUpTable.last?.rawValue else {
                return
            }
            print("주문한 \(coffee)이(가) 나왔습니다. 픽업대에서 가져가주세요")
        }
    }
    var menu: [Coffee:Int] = [
        .americano: 2000,
        .espresso: 3000,
        .latte: 2500,
        .mocha: 3000,
        .macchiato: 4000
    ]
    init(barista: Person) {
        self.barista = barista
    }
    
    func makeCoffee(_ coffee: Coffee, from name: String) {
        pickUpTable.append(coffee)
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case espresso = "에스프레소"
    case latte = "라떼"
    case mocha = "모카"
    case macchiato = "마끼아또"
}
