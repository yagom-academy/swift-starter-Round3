//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

let menu: [Coffee: Int] = [.caffelatte: 5000, .americano: 4500, .caffemocha: 5500, .coldbrew: 4500, .espresso: 4000]
var pickupTable = [Coffee]()

struct Person {
    var money: Int
    let name: String
    
    mutating func order(_ coffee: Coffee, of coffeeshop: CoffeeShop, by name: String) {
        if let cost = menu[coffee], self.money < cost {
            print("잔액이 \(cost - self.money)원 만큼 부족합니다.")
        }
        if let cost = menu[coffee], self.money >= cost {
            self.money -= cost
            coffeeshop.make(coffee, from: self.name)
        }
    }
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }
}

class CoffeeShop {
    var barista: Person
    var sales: Int
    var menus: [Coffee: Int]
    var pickupTable: [Coffee]

    func make(_ coffee: Coffee, from name: String) {
        if let cost = menus[coffee] {
            self.pickupTable.append(coffee)
            self.sales += cost
            if self.pickupTable.isEmpty != true {
                print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        }
    }
    
    init(barista: Person, sales: Int, menus: [Coffee: Int], pickupTable: [Coffee]) {
        self.barista = barista
        self.sales = 0
        self.menus = menus
        self.pickupTable = pickupTable
    }
}

enum Coffee: String {
    case caffelatte = "카페라떼"
    case americano = "아메리카노"
    case caffemocha = "카페모카"
    case coldbrew = "콜드브루"
    case espresso = "에스프레소"
}

var missKim = Person(money: 5000, name: "missKim")
var misterLee = Person(money: 50000, name: "misterLee")
let yagombucks = CoffeeShop.init(barista: misterLee, sales: 0, menus: menu, pickupTable: pickupTable)

missKim.order(.caffelatte, of: yagombucks, by: "missKim")
