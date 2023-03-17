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
    var name: String

    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }

    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        guard let orderPrice = coffeeShop.checkMenu(coffee) else { return }
        if canPayment(orderPrice) {
            coffeeShop.make(coffee, for: name)
            money -= orderPrice
        }
    }

    func canPayment(_ orderPrice: Int) -> Bool {
        if money >= orderPrice {
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
    var customerName: String = ""
    var pickUpTable: [Coffee] = [Coffee]() {
        didSet {
            guard let menu = pickUpTable.last?.rawValue else { return }
            print("\(customerName)님이 주문하신 \(menu)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }

    init(barista: Person, menu: [Coffee: Int]) {
        self.barista = barista
        self.menu = menu
    }

    func checkMenu(_ coffee: Coffee) -> Int? {
        guard let orderPrice = menu[coffee] else {
            print("선택하신 커피가 존재하지 않습니다.")
            return nil
        }
        return orderPrice
    }

    func make(_ coffee: Coffee, for name: String) {
        guard let price = menu[coffee] else { return }
        sales += price
        print("\(coffee.rawValue)를 선택하셨습니다. 커피를 추출합니다.")
        customerName = name
        pickUpTable.append(coffee)
    }
}

let misterLee: Person = Person(money: 5000, name: "misterLee")
let missKim: Person = Person(money: 10000, name: "missKim")

let yagombucks: CoffeeShop = CoffeeShop(barista: misterLee, menu: [Coffee.americano: 4500,
                                                                   Coffee.cafeLatte: 5000,
                                                                   Coffee.vanillaLatte: 5500])
