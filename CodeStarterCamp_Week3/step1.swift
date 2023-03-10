//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by MARY on 2023/03/07.
//

import Foundation

struct Person {
    let name: String
    var money: Int
    
    mutating func order(_ coffee: Coffee, of coffeshop: CoffeeShop, by name: String) {
        guard let price = coffeshop.menu[coffee] else {
            print("\(coffeshop.name)에 해당 메뉴가 없습니다.")
            return
        }
        
        guard money >= price else {
            print("잔액이 \(price-money)원만큼 부족합니다.")
            return
        }
        
        money -= price
        coffeshop.salesRevenue += price
        coffeshop.make(coffee, for: name)
    }
}

class CoffeeShop {
    let name: String
    var salesRevenue: Int = 0
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee] = []
    var barista: Person
    
    func make(_ coffee: Coffee, for name: String) {
        print("[\(self.name)] \(name)님의 \(coffee.rawValue) 주문이 완료되었습니다.")
        print("[\(self.name)] 바리스타 \(barista.name)가 음료를 준비중입니다.")
        serve(coffee, for: name)
    }
    
    func serve(_ coffee: Coffee, for name: String) {
        pickUpTable.append(coffee)
        print("[\(self.name)] \(name)님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
    
    init(name: String, menu: [Coffee : Int], barista: Person) {
        self.name = name
        self.menu = menu
        self.barista = barista
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case decafAmericano = "디카페인아메리카노"
    case vanillaLatte = "바닐라라떼"
    case hazelnutLatte = "헤이즐넛라떼"
    case caramelmacchiato = "카라멜마끼야또"
}
