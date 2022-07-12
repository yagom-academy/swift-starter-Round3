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
    var age: Int
    var gender: String
    var height: Int
    var weight: Int
    var job: String
    var money: Int
    init(name: String, age: Int, gender: String, height: Int, weight: Int, job: String, money: Int) {
        self.name = name
        self.age = age
        self.gender = gender
        self.height = height
        self.weight = weight
        self.job = job
        self.money = money
    }
    func sleep() {
        print("잠을 잡니다.")
    }
    func eat(food: String) {
        print("지금 먹는 것은 \(food)입니다.")
    }
    func buy(something: String) {
        print("구매한 것은 \(something)입니다.")
    }
}
class CoffeeShop {
    var name: String
    var menu: Dictionary<String, Int> = ["americano": 4500, "cafeLatte": 5000, "cafeMocha": 5500]
    var pickUpTable: Array<String> = []
    var barista: Person
    var grossSales: Int
    init(name: String, barista: Person, grossSales: Int) {
        self.name = name
        self.barista = barista
        self.grossSales = grossSales
    }
    func takeOrder(order: String) {
        print("\(order) 한 잔 \(menu["\(order)"]!)원 입니다.")
    }
    func makeCoffee(to order: String) {
        print("\(order) 한 잔 제조중입니다.")
    }
    func serveCoffee(ordered: String) {
        pickUpTable.append(ordered)
        print("주문하신 \(ordered) 한 잔 나왔습니다.")
    }
}

enum Coffee {
    case americano, cafeLatte, cafeMocha
}

var misterLee: Person = Person(name: "misterLee", age: 20, gender: "남성", height: 180, weight: 80, job: "바리스타", money: 1000)
var missKim: Person = Person(name: "missKim", age: 21, gender: "여성", height: 162, weight: 55, job: "회사원", money: 1200)
var yagombucks: CoffeeShop = CoffeeShop(name: "야곰벅스", barista: missKim, grossSales: 5000)

yagombucks.barista = misterLee

print("\(yagombucks.barista.name)")
yagombucks.serveCoffee(ordered: "americano")
print(yagombucks.pickUpTable.joined())
