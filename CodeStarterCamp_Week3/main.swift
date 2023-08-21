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
    var height: Double
    var weight: Double
    var money: Int
    
    init(name: String, height: Double, weight: Double, money: Int) {
        self.name = name
        self.height = height
        self.weight = weight
        self.money = money
    }
    
    func purchaseCoffee(from coffeeShop: CoffeeShop, typeOfCoffee: Coffee) {
        let strTypeOfCoffee = typeOfCoffee
        if let typeOfCoffee = coffeeShop.menu[typeOfCoffee] {
            if money >= typeOfCoffee {
                money -= typeOfCoffee
                defer { // 흐름상 결제이후 잔액이 표현되는게 좋을 것 같아 defer를 사용하였습니다.
                    print("\(money)원이 남았습니다.")
                }
                coffeeShop.orderCoffee(from: self, typeOfCoffee: strTypeOfCoffee)
            } else {
                let shortage = typeOfCoffee - money
                            print("잔액이 \(shortage)원만큼 부족합니다.")
            }
        }
        
    }
}

class CoffeeShop {
    var sales: Int
    var menu = [Coffee:Int]() //Dictionary<Coffee, Int>
    var pickUpTable: [Coffee]
    var barista: Person
    
    init(sales: Int, menu: Dictionary<Coffee, Int>, pickUpTable: [Coffee], barista: Person) {
        self.sales = sales
        self.menu = menu
        self.pickUpTable = []
        self.barista = barista
    }
    
    
    
    func orderCoffee(from customer: Person, typeOfCoffee: Coffee) {
        if let price = menu[typeOfCoffee] {
            sales += price
            makeCoffee(coffee: typeOfCoffee)
            print("\(typeOfCoffee) 결제가 완료되었습니다.") // 코드가 제대로 작동되는지 확인하기 위함
        }
    }
    //coffee 메뉴를 CoffeeShop 안에서 설정할 수 있도록 하는 기능을 추가하자.
    func addMenu(coffeeLabel: Coffee, price: Int) {
        menu[coffeeLabel] = price
    }
    
    func makeCoffee(coffee: Coffee) {
        pickUpTable.append(coffee)
    }
    
}

enum Coffee {
    case iceAmericano, caffeMocha, brewCoffee
}

let misterLee = Person(name: "misterLee", height: 180.0, weight: 70.0, money: 30000)
let missKim = Person(name: "missKim", height: 170.0, weight: 60.0, money: 30000)
//let yagombucksMenu: [Coffee: Int] = [.iceAmericano: 4000, .caffeMocha: 7000, .brewCoffee: 8000]


// -MARK: CoffeShop 타입 인스턴스 생성 및 바리스타 할당
let yagombucks = CoffeeShop(sales: 0, menu: [:], pickUpTable: [], barista: misterLee)
yagombucks.addMenu(coffeeLabel: .brewCoffee, price: 8000)
yagombucks.addMenu(coffeeLabel: .iceAmericano, price: 4000)
yagombucks.addMenu(coffeeLabel: .caffeMocha, price: 7000)

missKim.purchaseCoffee(from: yagombucks, typeOfCoffee: .caffeMocha)
missKim.purchaseCoffee(from: yagombucks, typeOfCoffee: .iceAmericano)
