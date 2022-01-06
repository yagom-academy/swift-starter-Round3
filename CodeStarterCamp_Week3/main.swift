//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var budget: Int
    
    func buy(something: String) {
        print("\(something)을 삽니다.")
    }
    
    init(budget: Int) {
        self.budget = budget
    }
}

class CoffeeShop {
    var salesRevenue: Int
    var menuList: Array<Menu>
    var pickUpTable: Array<Menu>?
    var barista: Barista?
    
    func order(coffee: Menu, from: Person) {
        
    }
    func makeCoffee(of: Menu) {
        
    }
    
    init(salesRevenue: Int, menuList: Array<Menu>) {
        self.salesRevenue = salesRevenue
        self.menuList = menuList
    }
}

class Barista: Person {
    var workPlace: CoffeeShop?
}

struct Menu {
    var coffeeType: CoffeeType
    var price: Int
}

enum CoffeeType {
    case Americano
    case Latte
    case Coldbrew
    case Tea
}

var misterLee = Barista(budget: 10000)
var missKim = Person(budget: 10000)
var yagomAmericano = Menu(coffeeType: CoffeeType.Americano, price: 3000)
let yagomLatte = Menu(coffeeType: CoffeeType.Latte, price: 3500)
let yagomBrew = Menu(coffeeType: CoffeeType.Coldbrew, price: 4000)
let yagomTea = Menu(coffeeType: CoffeeType.Tea, price: 3000)
var yagomMenuList = [yagomAmericano, yagomLatte, yagomBrew, yagomTea]
var yagombucks = CoffeeShop(salesRevenue: 0, menuList: yagomMenuList)
yagombucks.barista = misterLee



