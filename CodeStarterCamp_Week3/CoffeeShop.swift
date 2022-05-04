//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by Seong A Oh on 2022/05/05.
//

import Foundation

class CoffeeShop {
    var revenue: Int
    var menu: [Coffee : Int]
    var barista: [Person] = []
    var pickUpTable: Array = [[String : Coffee]]()
    
    init(revenue: Int, menu: [Coffee: Int]) {
        self.revenue = revenue
        self.menu = menu
    }
    
    func order(coffee: Coffee, name: String) {
        guard let coffeePrice = self.menu[coffee] else {
            return
        }
        self.revenue += coffeePrice
        self.pickUpTable.append(["\(name)" : coffee])
        
        guard let pickUpTableLast = self.pickUpTable.last?.first else {
            return
        }
        print("\(self.pickUpTable.endIndex)번째 주문, \(pickUpTableLast.key)님의 커피 \(pickUpTableLast.value.rawValue)가 나왔습니다")
    }
}

enum Coffee: String {
    case espresso = "에스프레소"
    case americano = "아메리카노"
    case vanillaLatte = "바닐라라떼"
    case cafeMocha = "카페모카"
}
