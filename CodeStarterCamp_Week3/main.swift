//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var money: Int
    var name: String
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }
    
    mutating func buyCoffee(coffee: coffeeMenu, shop: CoffeeShop) {
        if let coffeePrice = shop.menu[coffee] {
            if money >= coffeePrice {
                print("\(name)이(가) \(coffee)를 구매합니다.")
                money -= coffeePrice
                print("\(name)의 잔액은 \(money)원 입니다.")
                shop.order(coffee: coffee, customerName: name)
            } else {
                print("잔액이 \(coffeePrice - money)만큼 부족합니다.")
            }
        }
    }
}

class CoffeeShop {
    var sales: Int = 0
    var menu: [coffeeMenu: Int]
    var barista: Person
    var customer: String?
    var pickUpTable: coffeeMenu?
    
    init(sales: Int, menu: [coffeeMenu: Int], barista: Person) {
        self.sales = sales
        self.menu = menu
        self.barista = barista
    }
    
    func order(coffee: coffeeMenu, customerName: String) {
        customer = customerName
        print("\(customerName)의 \(coffee) 주문이 들어왔습니다.")
        if let coffeePrice = menu[coffee] {
            sales += coffeePrice
            print("커피샵의 총매출액은 \(sales) 입니다.")
        }
        pickUpTable = coffee
        makeCoffee()
    }
    
    func makeCoffee() {
        print("바리스타 \(barista.name)이(가) 커피를 추출합니다.")
        pickUp()
    }
    
    func pickUp() {
        if let name = customer {
            if let coffee = pickUpTable {
                print(name,"님의 \(coffee)가 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        } else {
            print("커피가 준비되지 않았습니다.")
        }
    }
    
}

enum coffeeMenu {
    case 아메리카노, 카페라떼, 카페모카, 에스프레소, 카라멜마끼야또
}

let misterLee: Person = Person(money: 10000, name: "misterLee")
var missKim: Person = Person(money: 3000, name: "missKim")
let yagombucks = CoffeeShop(sales: 0, menu: [.카라멜마끼야또: 3800, .카페모카: 3500, .카페라떼: 3000, .아메리카노: 2500, .에스프레소: 2500], barista: misterLee)
missKim.buyCoffee(coffee: .아메리카노, shop: yagombucks)


