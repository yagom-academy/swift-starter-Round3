//
//  step2.swift
//  CodeStarterCamp_Week3
//
//  Created by 홍세희 on 2023/09/12.
//

enum Coffee: String {
    case americano = "아메리카노"
    case cafeLatte = "카페라떼"
    case cappuccino = "카푸치노"
    case mocha = "모카"
    case prapucihno = "프라푸치노"
    case banillaLatte = "바닐라라떼"
}

class Person {
    var money: Int
    var name: String
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }

    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop) {
        if let price = menu[coffee] {
            if money < price {
                print("잔액이 \(price - money)원 만큼 부족합니다. ")
            } else {
                coffeeShop.make(_: coffee, from: name)
                money = price - money
            }
        }
    }
}

class CoffeeShop {
    var sales: Int
    var barista: Person
    var menu: [Coffee: Int]
    
    init(sales: Int, barista: Person, menu: [Coffee: Int]) {
        self.sales = sales
        self.barista = barista
        self.menu = menu
    }
    
    func make(_ coffee: Coffee, from name: String) {
        if let price = menu[coffee] {
            sales += price
        }
        
        var pickUpTable: [Coffee] = [] {
            didSet {
                if let coffeeName = pickUpTable.last {
                    print("\(name)님이 주문하신 \(coffeeName.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
                }
            }
        }
        pickUpTable.append(coffee)
        
    }
    
}

var menu: [Coffee: Int] = [.americano: 1000, .cafeLatte: 3000, .cappuccino: 1500]

