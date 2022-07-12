//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var name: String = "name"
    var age: Int = 0
    var gender: String = "gender"
    var height: Int = 0
    var weight: Int = 0
    var job: String = "job"
    var money: Int = 0
    init(){}
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
    
    func order(coffee: Coffee) {
        print("저 \(coffee.rawValue) 한 잔 주세요!")
    }
}
class CoffeeShop {
    var name: String
    var menu: Dictionary<Coffee, Int> = [.americano: 4500, .cafeLatte: 5000, .cafeMocha: 5500]
    var pickUpTable: Array<Coffee> = []
    var barista: Person
    var grossSales: Int
    init(name: String, barista: Person, grossSales: Int) {
        self.name = name
        self.barista = barista
        self.grossSales = grossSales
    }
    
    func takeOrder(coffee: Coffee) {
        if let order = menu[coffee] {
            print("\(coffee.rawValue) 한 잔 \(order)원 입니다.")
        } else {
            print("고객님 그 메뉴는 저희 매장에서 판매하지 않습니다.")
        }
    }
    
    func makeCoffee(to order: Coffee) {
        print("\(order.rawValue) 한 잔 제조중입니다.")
    }
    
    func serveCoffee(ordered: Coffee) {
        pickUpTable.append(ordered)
        print("주문하신 \(ordered.rawValue) 한 잔 나왔습니다.")
    }
    
    func launchNewMenu(newOne: Coffee, price: Int) {
        menu[newOne] = price
        print("신메뉴 출시! \(newOne.rawValue)!")
    }
}

enum Coffee: String {
    case americano = "아메리카노", cafeLatte = "카페라떼", cafeMocha = "카페모카", vanillaLatte = "바닐라라떼", caramelMacchiato = "캬라멜마끼아또"
}

var misterLee: Person = Person(name: "misterLee", age: 20, gender: "남성", height: 180, weight: 80, job: "바리스타", money: 100000)
var missKim: Person = Person()
var yagombucks: CoffeeShop = CoffeeShop(name: "야곰벅스", barista: misterLee, grossSales: 0)

print("\(yagombucks.barista.name)")
missKim.order(coffee: .americano)
yagombucks.takeOrder(coffee: .americano)
yagombucks.serveCoffee(ordered: .americano)
missKim.order(coffee: .caramelMacchiato)
yagombucks.takeOrder(coffee: .caramelMacchiato)
missKim.order(coffee: .cafeLatte)
yagombucks.takeOrder(coffee: .cafeLatte)
yagombucks.serveCoffee(ordered: .cafeLatte)
yagombucks.launchNewMenu(newOne: .caramelMacchiato, price: 6000)
