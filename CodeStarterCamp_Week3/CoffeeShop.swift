//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by tom on 2023/03/08.
//

import Foundation

class CoffeeShop {
    var name: String
    var sales: Int
    var barista: Person
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee] {
        didSet {
            coffeeOnPickUpTable()
        }
    }
    
    init(name: String, sales: Int, barista: Person, menu: [Coffee : Int], pickUpTable: [Coffee]) {
        self.name = name
        self.sales = sales
        self.barista = barista
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
    func takeOrderCoffee(_ coffeeMenu:Coffee) {
        if let price = menu[coffeeMenu] {
            print("주문하신 \(coffeeMenu)의 가격은\(price)입니다.")
            sales += price
            pickUpTable.append(coffeeMenu)
            print("매출액 \(sales)원 입니다.")
        } else {
            print("주문 하신 \(coffeeMenu)은 저희 매장에 없는 메뉴 입니다.")
        }
    }
    
    func make(_ coffee: Coffee, for naem: String) {
        if let price = menu[coffee] {
            sales += price
            pickUpTable.append(coffee)
            print("커피의 가격은 \(price)입니다.")
            print("매출액 \(sales)원 입니다.")
        } else {
            print("주문 하신 \(coffee)은 저희 매장에 없는 메뉴 입니다.")
        }
    }
    
    func coffeeOnPickUpTable() {
        let bindedCoffees = pickUpTable.map {$0.rawValue}.joined(separator: ",")
        if bindedCoffees.contains(bindedCoffees) {
            print("테이블에는 \(bindedCoffees)의 커피가 있습니다.")
        } else {
            return
        }
    }
}
