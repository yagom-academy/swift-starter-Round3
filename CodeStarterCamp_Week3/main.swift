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
    
    func buyCoffee() {
        print("커피를 삽니다")
    }
}

class CoffeeShop {
    var sales: Int
    var barista: Person
    lazy var pickUpTable: [Coffee] = makeCoffee()
    var menuList: [Coffee:Int] = [:]
        
    init(sales: Int, barista: Person, menuList: [Coffee : Int]) {
        self.sales = sales
        self.menuList = menuList
        self.barista = barista
    }
    
    func takingOrder() {
        print("커피 주문을 받습니다.")
    }

    func makeCoffee() -> [Coffee]  {
        print("커피를 만듭니다.")
        return []
    }
}

var misterLee: Person = Person(money: 0, name: "misterLee")
var missKim: Person = Person(money: 0, name: "missKim")
var yagombucks: CoffeeShop = CoffeeShop(sales: 0, barista: misterLee, menuList: [Coffee.americano: 1500])

