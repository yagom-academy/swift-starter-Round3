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
    var pickUpTable: [Coffee]
    
    init(name: String, sales: Int, barista: Person, menu: [Coffee : Int], pickUpTable: [Coffee]) {
        self.name = name
        self.sales = sales
        self.barista = barista
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
    mutating func takeOrderCoffee(_ coffeeMenu:Coffee) {
        if let price = menu[coffeeMenu] {
            print("\(coffeeMenu)주문 받았습니다.")
            print("주문하신 \(coffeeMenu)의 가격은\(price)입니다.")
            sales += price
            pickUpTable.append(coffeeMenu)
        } else {
            print("주문 하신 \(coffeeMenu)은 저희 매장에 없는 메뉴 입니다.")
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
    
    mutating func order(_ coffee: Coffee, from name: String, _ person: Person) {
        if let price = menu[coffee] {
            let myMoney : Int = person.money
            let coffeePrice : Int = price
            let changeMoney = myMoney - coffeePrice
            let absChangeMoney = abs(changeMoney)
            
            if myMoney > coffeePrice {
                print("\(name) 님의 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가 주세요.")
                sales += price
                pickUpTable.append(coffee)
                print("\(name)의 남은돈 \(absChangeMoney)원 입니다.")
                print("매출액 \(sales)원 입니다.")
            } else {
                print("\(name)의 잔액이 \(absChangeMoney)원만큼 부족 합니다")
            }
        } else {
            print("주문 하신 \(coffee)은 저희 매장에 없는 메뉴 입니다.")
        }
    }
}
