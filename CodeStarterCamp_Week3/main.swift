//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//class Person {
//    private var money: Int
//
//    init(money: Int) {
//        self.money = money
//    }
//
//    func buyCoffee(_ coffee: Coffee, _ coffeeShop: CoffeeShop) {
//        if let coffeePrice = coffeeShop.menu[coffee] {
//                money = money - coffeePrice
//        }
//        coffeeShop.orderCoffee(coffee)
//    }
//
//    var getMoney: Int {
//        get {
//            return money
//        }
//    }
//}

struct Person {
    private var _money: Int = 0
    var name: String = ""
    
    mutating func buyCoffee(_ coffee: Coffee, _ coffeeShop: CoffeeShop) {
        if let coffeePrice = coffeeShop.menu[coffee] {
            if _money >= coffeePrice {
                _money = _money - coffeePrice
            } else {
                print("잔액이 \(coffeePrice - _money)원 만큼 부족합니다. ")
                return
            }
        }
        coffeeShop.orderCoffee(coffee, name)
    }
    
    var money: Int {
        get {
            return self._money
        }
        set {
            self._money = newValue
        }
    }
}

class CoffeeShop {
    var sales: Int
    var barista: Person?
    var orderer: String = ""
    let menu: [Coffee: Int] = [Coffee.espresso: 100, Coffee.americano: 200, Coffee.macchiato: 300,
                               Coffee.cappuccino: 400, Coffee.caffeLatte: 500, Coffee.affogato: 600]
    var pickUpTable: Bool = false {
        didSet {
            if pickUpTable {
                print("\(orderer) 님의 커피가 준비되엇습니다. 픽업대에서 가져가주세요.")
            }
        }
    }
    
    init(sales: Int) {
        self.sales = sales
    }
    
    func orderCoffee(_ coffee: Coffee, _ orderer: String) {
        if let coffeePrice = menu[coffee] {
            self.sales += coffeePrice
            self.orderer = orderer
            pickUpTable = true
        }
    }
}

enum Coffee: String {
    case espresso = "에스프레소"
    case americano = "아메리카노"
    case macchiato = "마끼아또"
    case cappuccino = "카푸치노"
    case caffeLatte = "카페라떼"
    case affogato = "아포가토"
}

var missKim: Person = Person()
missKim.money = 10000
missKim.name = "missKim"

var misterLee: Person = Person()
misterLee.money = 50000
misterLee.name = "miserLee"

var yagombucks: CoffeeShop = CoffeeShop(sales: 0)
yagombucks.barista = misterLee

missKim.buyCoffee(Coffee.espresso, yagombucks)
