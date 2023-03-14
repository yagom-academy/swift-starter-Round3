//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 김형철 on 2023/03/09.
//

import Foundation

typealias CoffeePrice = Int

class CoffeeShop {
    var barista: Person
    var sales: Int
    var menu: Dictionary<Coffee, CoffeePrice>
    var pickUpTable: [Coffee]
    
    init(barista: Person, sales: Int, menu: Dictionary<Coffee, CoffeePrice>, pickUpTable: [Coffee]) {
        self.barista = barista
        self.sales = sales
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
    func takeOrder(_ coffee: Coffee, for name: String) {
        
        pickUpTable = []
        
        pickUpTable.append(coffee)
                                
        if let coffeePrice = menu[coffee] {
            sales = sales + coffeePrice
        
        }
        
        print(#"\#(name) 님이 주문하신 \#(pickUpTable[pickUpTable.endIndex-1].rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요."#)
        
    }
    
    
}
