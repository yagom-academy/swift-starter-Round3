//
//  step2.swift
//  CodeStarterCamp_Week3
//
//  Created by 손윤호 on 2023/03/17.
//

import Foundation

enum Coffee: String {
    case americano = "아메리카노", cafeLatte = "카페라떼", vanillaLatte = "바닐라라떼"
}

class Person {
    var money: Int

    init(money: Int) {
        self.money = money
    }

    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        if let orderPrice = coffeeShop.checkMenu(coffee) {
            if canPayment(orderPrice) {
                coffeeShop.make(coffee, for: name)
                money -= orderPrice
            }
        }
    }

    func canPayment(_ orderPrice: Int) -> Bool {
        if money > orderPrice {
            return true
        } else {
            print("잔액이 \(orderPrice - money)원만큼 부족합니다.")
            return false
        }
    }
}

class CoffeeShop {
    var sales: Int = 0
    var barista: Person
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee] = [Coffee]()

    init(barista: Person, menu: [Coffee: Int]) {
        self.barista = barista
        self.menu = menu
    }

    func checkMenu(_ coffee: Coffee) -> Int? {
        if let orderPrice = menu[coffee] {
            return orderPrice
        } else {
            print("선택하신 커피가 존재하지 않습니다.")
            return nil
        }
    }

    func make(_ coffee: Coffee, for name: String) {
        if let payout = menu[coffee] {
            sales += payout
            print("\(coffee.rawValue)를 선택하셨습니다. 커피를 추출합니다.")
            pickUpTable.append(coffee)
            announcePickUpTableStatus(coffee, name)
        }
    }

    func announcePickUpTableStatus(_ coffee: Coffee, _ name: String) {
        print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

let misterLee: Person = Person(money: 3000)
let missKim: Person = Person(money: 10000)

let yagombucks: CoffeeShop = CoffeeShop(barista: misterLee, menu: [Coffee.americano: 4500,
                                                                   Coffee.cafeLatte: 5000,
                                                                   Coffee.vanillaLatte: 5500])
