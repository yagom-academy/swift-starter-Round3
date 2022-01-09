//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var budget: Int
    
    func buy(something: Menu, coffeeShop: CoffeeShop) {
        print("\(something.coffeeType)을 삽니다.")
        coffeeShop.order(coffee: something, from: self)
        print("\(self.name) 님의 잔액이 \(self.budget)만큼 남았습니다.")
    }
    
    init(name: String, budget: Int) {
        self.name = name
        self.budget = budget
    }
}

class CoffeeShop {
    var salesRevenue: Int
    var menuList: Array<Menu>
    var pickUpTable: Array<CoffeeType>?
    var barista: Barista?
    
    let yagomAmericano = Menu(coffeeType: CoffeeType.Americano, price: 3000)
    let yagomLatte = Menu(coffeeType: CoffeeType.Latte, price: 3500)
    let yagomBrew = Menu(coffeeType: CoffeeType.Coldbrew, price: 4000)
    let yagomTea = Menu(coffeeType: CoffeeType.Tea, price: 3000)
    
    func order(coffee: Menu, from buyer: Person) {
        
        if buyer.budget < coffee.price {
            print("잔액이 \(coffee.price - buyer.budget)만큼 부족합니다.")
        } else {
            buyer.budget -= coffee.price
            self.salesRevenue += coffee.price
            print("현재 매출액은  \(self.salesRevenue)입니다.")
            makeCoffee(of: coffee)
            print("\(buyer.name) 님의 커피가 준비되었습니다. 픽업대에서 가져가 주세요.")
        }
    }
    func makeCoffee(of: Menu) {
        print("바리스타가 \(of.coffeeType)를 만들고 있습니다.")
        self.pickUpTable?.append(of.coffeeType)
        print("\(of.coffeeType)가 완료되었습니다.")
    }
    
    init(salesRevenue: Int) {
        self.salesRevenue = salesRevenue
        self.menuList = [yagomAmericano, yagomLatte, yagomBrew, yagomTea]
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

var misterLee = Barista(name: "misterLee", budget: 10000)
var missKim = Person(name: "missKim", budget: 10000)
var yagombucks = CoffeeShop(salesRevenue: 0)

yagombucks.barista = misterLee

missKim.buy(something: yagombucks.yagomTea, coffeeShop: yagombucks)





