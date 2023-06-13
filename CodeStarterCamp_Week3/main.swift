//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum Coffee {
    case americano, latte, espresso
}

class Person {
    var money: Int
    var name: String
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }
    
    func orderCoffee(_ Coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        coffeeShop.makeCoffee(Coffee, for: self.name)
        self.money -= coffeeShop.menuList[Coffee] ?? 0
        coffeeShop.sales += coffeeShop.menuList[Coffee] ?? 0
        if self.money < 0 {
            print("잔액이 \(abs(self.money))만큼 부족합니다.")
        }
    }
}

class CoffeeShop {
    var sales: Int
    var barista: Person
    var pickUpTable: [Coffee] = []
    var menuList: [Coffee: Int] = [.americano: 4500, .latte: 4800, .espresso : 4000]
        
    init(sales: Int, barista: Person, pickUpTable: [Coffee]) {
        self.sales = sales
        self.barista = barista
        self.pickUpTable = pickUpTable
    }
    
    func takingOrder() {
        print("커피 주문을 받습니다.")
    }

    func makeCoffee(_ coffee: Coffee, for name: String) {
        pickUpTable.append(coffee)
        if pickUpTable.isEmpty == false {
            print("\(name)이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
}

var missKim: Person = Person(money: 10000, name: "김여사님")
var baristaBear: Person = Person(money: 100, name: "곰바리스타")
var yagombucks: CoffeeShop = CoffeeShop(sales: 100000, barista: baristaBear, pickUpTable: [])
missKim.orderCoffee(.americano, of: yagombucks, by: missKim.name)
