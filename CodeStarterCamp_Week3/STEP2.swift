//
//  STEP1.swift
//  CodeStarterCamp_Week3
//
//  Created by 한겨레 on 2022/07/08.
//

import Foundation

class Person {
    var name: String
    var age: Int
    var money: Int
    
    func order(coffee: Coffee, coffeeShop: CoffeeShop) {
        if let coffeePrice = coffeeShop.menu[coffee] {
            if coffeePrice > money {
                let nonPrice = coffeePrice - money
                print("잔액이 \(nonPrice)원만큼 부족합니다.")
            }
            else {
                coffeeShop.make(coffee: coffee, from: self.name)
                money -= coffeePrice
            }
        }
    }
    
    init (name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
}

class CoffeeShop {
    var coffeeShopName: String
    var todayRevenue: Int
    var barista: Person
    var pickUpTable: [String] = []
    var menu: Dictionary<Coffee, Int> = [.americano: 2000, .espresso: 2500, .cafeLatte: 3000, .cafeMoca: 3500, .vanilaLatte: 4000]
    
    func make(coffee: Coffee, from name: String) {
        if let coffeePrice = menu[coffee]{
            pickUpTable.append("\(coffee)")
            todayRevenue += coffeePrice
            print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    
    init(coffeeShopName: String, todayRevenue: Int, barista: Person) {
        self.coffeeShopName = coffeeShopName
        self.todayRevenue = todayRevenue
        self.barista = barista
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case espresso = "에스프레소"
    case cafeLatte = "카페라떼"
    case cafeMoca = "카페모카"
    case vanilaLatte = "바닐라라뗴"
}
