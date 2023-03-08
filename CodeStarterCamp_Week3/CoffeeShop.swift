//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by tom on 2023/03/08.
//

import Foundation

struct CoffeeShop {
    var name: String
    var sales: Int
    var barista: Person
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee.RawValue]
    
    init(name: String, sales: Int, barista: Person, menu: [Coffee : Int], pickUpTable: [Coffee.RawValue]) {
        self.name = name
        self.sales = sales
        self.barista = barista
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
    mutating func takeOrderCoffee(coffeeMenu:Coffee) {
        if let price = menu[coffeeMenu] {
            print("\(coffeeMenu)주문 받았습니다.")
            print("주문하신 \(coffeeMenu)의 가격은\(price)입니다.")
            sales += price
            pickUpTable.append(coffeeMenu.rawValue)
        } else {
            print("주문 하신 \(coffeeMenu)은 저희 매장에 없는 메뉴 입니다.")
        }
    }
    
    func coffeeOnPickUpTable() {
        let bindedCoffees = pickUpTable.joined(separator: ",")
        print("테이블에는 \(bindedCoffees)의 커피가 있습니다.")
    }
}
