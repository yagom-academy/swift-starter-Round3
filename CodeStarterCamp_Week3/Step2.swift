//
//  Step2.swift
//  CodeStarterCamp_Week3
//
//  Created by Daehoon Lee on 2023/03/07.
//

import Foundation

enum Coffee: String {
    case americano = "아메리카노"
    case cafelatte = "카페라떼"
    case blacktea = "홍차"
    case cafemocha = "카페모카"
    case nfs
}

struct Person {
    var name: String
    var money: Int
    
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        guard let priceOfOrderedCoffee = coffeeShop.menu[coffee] else {
            print("주문할 수 없는 메뉴입니다.")
            return
        }

        if self.money < priceOfOrderedCoffee {
            print("잔액이 \(priceOfOrderedCoffee - self.money)원만큼 부족합니다.")
            return
        }
        
        coffeeShop.make(coffee, for: self.name)
        self.money -= priceOfOrderedCoffee
        coffeeShop.salesRevenue += priceOfOrderedCoffee
//        coffeeShop.pickUpTable.removeFirst()

    }
}

class CoffeeShop {
    var barista: Person
    var salesRevenue: Int = 0
    var menu: Dictionary<Coffee, Int> = [
        Coffee.americano: 2000,
        Coffee.cafelatte: 3000,
        Coffee.blacktea: 2500,
        Coffee.cafemocha: 3000
    ]
    var pickUpTable: Array<String> = Array<String>()
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func make(_ coffee: Coffee, for name: String) {
        self.brewCoffee(ordered: coffee)
        self.printGuideText(with: name, coffee)
    }
    
    func brewCoffee(ordered coffee: Coffee) {
        self.pickUpTable.append(coffee.rawValue)
    }
    
    func printGuideText(with name: String, _ coffee: Coffee) {
        print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
    
}
