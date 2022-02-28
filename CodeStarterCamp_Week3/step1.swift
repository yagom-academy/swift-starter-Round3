//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by makseong on 2022/02/28.
//

import Foundation

class Person {
    var moneyYouHave : Int?

    init(moneyYouHave : Int?) {
        self.moneyYouHave = moneyYouHave
    }

    func buy() {
    }
}

class CoffeeShop {
    var totalSale : Int
    var menu : [Dictionary<Coffee, Int>] = [[Coffee: Int]()]
    var pickUpTable : Int
    var barista : String?

    init(totalSale : Int, menu: [[Coffee: Int]], pickUpTable: Int) {
        self.totalSale = totalSale
        self.menu = menu
        self.pickUpTable = pickUpTable
    }

    func takeOrder(drinkType: Coffee) {
        switch drinkType {
        case .americano:
            self.totalSale += self.menu[0][.americano]!
        case .tea:
            self.totalSale += self.menu[1][.tea]!
        case .juice:
            self.totalSale += self.menu[2][.juice]!
        }
    }
    
    func makecoffee(drinkType: Coffee) {
        switch drinkType {
        case .americano:
            print("아메리카노 제조중...")
        case .tea:
            print("티 제조중...")
        case .juice:
            print("주스 제조중...")
        }
    }
}

enum Coffee {
    case americano, tea, juice
}
