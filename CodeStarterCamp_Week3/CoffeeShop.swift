//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 정선아 on 2022/04/27.
//

import Foundation

class CoffeeShop {
    let owner: String
    let openingHours: String
    var coffeeShopProfit: Int = 0
    var menu: [Coffee: Int]
    var pickUpTable: Coffee? = nil
    var barista: Person?
    init(owner: String, openingHours: String, menu: [Coffee: Int] = [:], barista: Person?) {
        self.owner = owner
        self.openingHours = openingHours
        self.menu = menu
        self.barista = barista
    }
    
    func order(_ coffee: Coffee) {
        
    }
    
    func makeCoffee(_ coffee: Coffee) {
        pickUpTable = coffee
        print("\(coffee)가 완성되어 픽업 테이블에 올라왔습니다.")
    }
}

//커피 종류 열거형 생성
enum Coffee: String {
    case americano, caffeLatte, caramelMacchiato
    
    static var menu: [Coffee: Int] {
        return [.americano: 4000, .caffeLatte: 4500, .caramelMacchiato: 5000]
    }
}
