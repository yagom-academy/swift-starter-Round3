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
    var age: Int = 0
    var gender: String = "gender"
    var height: Int = 0
    var weight: Int = 0
    var job: String = "job"
    var money: Int
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
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
    
    func order(coffee: Coffee, coffeeShop: CoffeeShop) {
        print("저 \(coffee.rawValue) 한 잔 주세요!")
        if let order = coffeeShop.menu[coffee] {
            if money < order {
                print("잔액이 \(order - money)만큼 부족합니다.")
            } else {
                money = money - order
                coffeeShop.takeOrder(coffee: coffee, from: self)
            }
        } else {
            coffeeShop.takeOrder(coffee: coffee, from: self)
        }
    }
}
class CoffeeShop {
    var name: String
    var menu: Dictionary<Coffee, Int> = [.americano: 4500, .cafeLatte: 5000, .cafeMocha: 5500]
    var pickUpTable: Array<Coffee> = []
    var barista: Person
    var grossSales: Int = 0
    init(name: String, barista: Person) {
        self.name = name
        self.barista = barista
    }
    
    func takeOrder(coffee: Coffee, from person: Person) {
        if let order = menu[coffee] {
            print("\(coffee.rawValue) 한 잔 \(order)원 입니다.")
            grossSales += order
            make(coffee: coffee, from: person)
        } else {
            print("고객님 그 메뉴는 저희 매장에서 판매하지 않습니다.")
        }
    }
    
    func make(coffee: Coffee, from person: Person) {
        print("\(coffee.rawValue) 한 잔 제조중입니다.")
        serve(coffee: coffee, to: person)
    }
    
    func serve(coffee: Coffee, to person: Person) {
        pickUpTable.append(coffee)
        print("\(person.name)고객님! 주문하신 \(coffee.rawValue) 한 잔 나왔습니다.")
    }
    
    func launchNewMenu(newOne: Coffee, price: Int) {
        menu[newOne] = price
        print("신메뉴 출시! \(newOne.rawValue)!")
    }
}

enum Coffee: String {
    case americano = "아메리카노", cafeLatte = "카페라떼", cafeMocha = "카페모카", vanillaLatte = "바닐라라떼", caramelMacchiato = "캬라멜마끼아또"
}

var missKim: Person = Person(name: "미스김", money: 50000)
var misterLee: Person = Person(name: "미스터리", money: 30000)
misterLee.job = "바리스타"
var yagombucks: CoffeeShop = CoffeeShop(name: "야곰벅스", barista: misterLee)
missKim.order(coffee: .americano, coffeeShop: yagombucks)
print(missKim.money)
print(yagombucks.grossSales)
missKim.money = 4000
missKim.order(coffee: .caramelMacchiato, coffeeShop: yagombucks)
yagombucks.launchNewMenu(newOne: .caramelMacchiato, price: 6000)
missKim.order(coffee: .caramelMacchiato, coffeeShop: yagombucks)
