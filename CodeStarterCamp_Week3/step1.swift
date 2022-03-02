//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by makseong on 2022/02/28.
//

import Foundation

class Person {
    var property : Int

    init(property : Int) {
        self.property = property
    }

    func buy() {
    }
}

class CoffeeShop {
    var totalSale : Int
    var menu : [Dictionary<Coffee, Int>] = [[.americano:4500],[.tea: 2500],[.juice: 3000]]
    var pickUpTable : Array<String> = []
    var baristas : Person

    init(totalSale: Int, baristas: Person) {
        self.totalSale = totalSale
        self.baristas = baristas
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
    
    func makeCoffee(drinkType : Coffee) {
        switch drinkType {
        case .americano:
            pickUpTable.append("아메")
        case .tea:
            pickUpTable.append("티")
        case .juice:
            pickUpTable.append("주스")
        }
    }
}

enum Coffee {
    case americano, tea, juice
}
