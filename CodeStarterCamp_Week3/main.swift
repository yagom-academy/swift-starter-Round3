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
    
    mutating func buyCoffee(_ coffee: Coffee, _ coffeeShop: CoffeeShop) -> Coffee {
        if let coffeePrice = coffeeShop.menu[coffee] {
            _money = _money - coffeePrice
        }
        return coffee
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

struct CoffeeShop {
    var sales: Int = 0
    var barista: Person?
    var pickUpTable: Bool = false
    let menu: [Coffee: Int] = [Coffee.espresso: 100, Coffee.americano: 200, Coffee.macchiato: 300,
                               Coffee.cappuccino: 400, Coffee.caffeLatte: 500, Coffee.affogato: 600]
    
    mutating func orderCoffee(_ coffee: Coffee) {
        pickUpTable = true
        
        if let coffeePrice = menu[coffee] {
            self.sales += coffeePrice
        }

        print("\(coffee.rawValue)가 주문 되었습니다.")
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
var misterLee: Person = Person()
misterLee.money = 50000

var yagombucks: CoffeeShop = CoffeeShop(sales: 0)

yagombucks.barista = misterLee

yagombucks.orderCoffee(missKim.buyCoffee(Coffee.espresso, yagombucks))
//잔액출력
print(missKim.money)



