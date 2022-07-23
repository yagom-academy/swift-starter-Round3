//
//  STEP1.swift
//  CodeStarterCamp_Week3
//
//  Created by 한겨레 on 2022/07/08.
//
/*
import Foundation

struct Person {
    var name: String
    var age: Int
    var money: Int
    
    mutating func purchaseCoffee(price: Int) {
        print("안녕하세요 주문을 시작합니다.")
        if money>=price {
            self.money -= price
            print("\(price)원 을 지불합니다.")
        }
        else {
            print("잔액이 부족합니다.")
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
    
    func orderedMenu(coffee: Coffee) {
        print("안녕하세요! \(coffeeShopName) 입니다. 주문 도와드리겠습니다.")
        if let orderedCoffeePrice = menu[coffee] {
            print("주문하신 \(coffee)의 가격은 \(orderedCoffeePrice)원 입니다.")
            todayRevenue += orderedCoffeePrice
            print("매출이 \(orderedCoffeePrice)원 올랐습니다. 오늘 총 매출은 \(todayRevenue)입니다.")
            makeCoffee(coffee: coffee)
        }
    }
    
    func makeCoffee(coffee: Coffee) {
        print("주문하신 \(coffee) 나왔습니다.")
        pickUpTable.append("\(coffee) 손님")
    }
    
    init(coffeeShopName: String, todayRevenue: Int, barista: Person) {
        self.coffeeShopName = coffeeShopName
        self.todayRevenue = todayRevenue
        self.barista = barista
    }
}

enum Coffee {
    case americano
    case espresso
    case cafeLatte
    case cafeMoca
    case vanilaLatte
}
*/
