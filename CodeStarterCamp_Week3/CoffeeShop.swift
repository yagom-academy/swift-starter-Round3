//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 정선아 on 2022/04/27.
//

import Foundation

struct CoffeeShop {
    var owner: String
    var openingHours: String
    var coffeeShopProfit: Int?
    var menu: [Coffee: Int]
    var pickUpTable: Coffee? = nil
    var barista: Person?
    init(owner: String, openingHours: String, coffeeShopProfit: Int? = nil, menu: [Coffee: Int] = [:], barista: Person? = nil) {
        self.owner = owner
        self.openingHours = openingHours
        self.coffeeShopProfit = coffeeShopProfit
        self.menu = menu
        self.barista = barista
    }
    func makeCoffee(_ coffee: Coffee) {
        print("\(coffee)를 만드는 중입니다.")
    }
}

//커피 종류 열거형 생성
enum Coffee: String {
    case americano, caffeLatte, caramelMacchiato
    
    static var menu: [Coffee: Int] {
        return [.americano: 4000, .caffeLatte: 4500, .caramelMacchiato: 5000]
    }
}
