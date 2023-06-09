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

struct Menu {
    var price: Int
    var coffeeList: [Coffee]
}


class CoffeeShop {
    var sales: Int
    var barista: Person?
    var pickUpTable: [Coffee] = []
    var menulist: Menu

    init(sales: Int, pickUpTable: [Coffee], menulist: Menu) {
        self.sales = sales
        self.pickUpTable = pickUpTable
        self.menulist = menulist
    }
    
    convenience init(sales: Int, pickUpTable: [Coffee], menulist: Menu, barista: Person?) {
        self.init(sales: sales, pickUpTable: pickUpTable, menulist: menulist)
        self.barista = barista
    }
    
    func order() {
        print("커피 주문을 받습니다.")
    }

    func makeCoffee() -> [Coffee] {
        return self.pickUpTable
    }
}

var misterLee: Person = Person(money: 0, name: "misterLee")
var missKim: Person = Person(money: 0, name: "missKim")
var yagombucks: CoffeeShop = CoffeeShop(sales: 0, pickUpTable: [], menulist: Menu(price: 0, coffeeList: []))
yagombucks.barista = misterLee
