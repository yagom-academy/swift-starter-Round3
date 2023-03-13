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
    var pickUpTable: [Coffee]
    {
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
    
    ///커피 만들기
    func make(_ coffee: Coffee, for name: String) {
        if let price = menu[coffee] {
            print("\(coffee) 주문 받았습니다.")
            print("바리스타 \(barista.name)(이/가) 제조 합니다.")
            print("커피의 가격은 \(price)입니다.")
            sales += price
            print("매출액 \(sales)원 입니다.")
            pickUpTable.append(coffee)
        } else {
            print("주문 하신 \(coffee)은 저희 매장에 없는 메뉴 입니다.")
        }
    }
    
    /// 픽업테이블
    func coffeeOnPickUpTable() {
        let coffeeOnTheTable = pickUpTable.map {$0.rawValue}.joined(separator: ",")
        if coffeeOnTheTable.isEmpty == false {
            print("\(coffeeOnTheTable)주문 하신 고객님 \(coffeeOnTheTable)(이/가) 준비되었습니다. 픽업대에서 가져가주세요")
        }
    }
}
