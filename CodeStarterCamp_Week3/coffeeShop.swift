//
//  coffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 이지은 on 2/24/24.
//

class CoffeeShop {
    var sales: Int = 0
    var menu: [String: Int] = [:]
    var pickUpTable: [String] = []
    var barista: Person
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func take(_ order: String) {
        print("주문을 받는다!")
    }
    
    func make(_ coffee: String) {
        print("커피를 만든다!")
        pickUpTable.append(coffee)
        print("만든 커피를 픽업대에 올렸다!")
    }
}

enum Coffee: String {
    case espresso = "Espresso"
    case americano = "Americano"
    case latte = "Latte"
    case vanillaLatte = "Vanilla Latte"
    case caramelMacchiato = "Caramel Macchiato"
}
