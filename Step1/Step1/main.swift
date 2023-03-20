//
//  main.swift
//  Step1
//
//  Created by 이진 on 2023/03/14.
//

import Foundation

struct Person {
    var money: Int
    
    init(money: Int) {
        self.money = money
    }

    func buy(coffee: Coffee, from coffeeShop: CoffeeShop) {
        coffeeShop.order(coffee: coffee)
    }
}

struct CoffeeShop {
    var sales: Int
    var barista: Person
    let menu: Dictionary<Coffee, Int> = [.americano : 2000, .cappuccino : 3000, .caffeLatte : 4000]
    var pickUpTable: Array<String> = Array<String>()
    
    init(sales: Int, barista: Person) {
        self.sales = sales
        self.barista = barista
    }
    
    mutating func order(coffee: Coffee) {
        print("\(coffee.rawValue)를 주문합니다.")
        pickUpTable.append(coffee.rawValue) //Cannot use mutating member on immutable value: 'self' is immutable
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case cappuccino = "카푸치노"
    case caffeLatte = "카페라떼"
}

let misterLee = Person(money: 500000)
let missKim = Person(money: 1000000)
let yagombucks = CoffeeShop(sales: 10000000, barista: misterLee)

misterLee.buy(coffee: .americano, from: yagombucks)

print(yagombucks.barista.money)
