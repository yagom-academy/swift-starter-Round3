//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct Person {
    let name: String
    var money: Int = 0
    
    func buyCoffee(coffee: typesOfCoffee) {
        print("\(name)이(가) \(coffee)를 주문합니다.")
    }
}

struct CoffeeShop {
    var totalSales: Int = 0
    var menu: [typesOfCoffee: Int] = [:]
    var pickUpTable: [String] = []
    var barista: Person
    
    func takeOrders() {
        print("\(barista.name)이(가) 주문을 받습니다.")
    }
    
    mutating func makeCoffee(coffee: typesOfCoffee) {
        pickUpTable.append(coffee.rawValue)
        print("주문받은 \(coffee)를 만들었습니다.")
    }
}

enum typesOfCoffee: String {
    case espresso, americano, iceAmericano, cafeLatte, cafeMocha, vanillaLatte
}

let misterLee = Person(name: "Mr.Lee", money: 5000)
let missKim = Person(name: "Ms.Kim", money: 10000)
var yagombucks = CoffeeShop(barista: misterLee)

missKim.buyCoffee(coffee: .espresso)
yagombucks.takeOrders()
yagombucks.makeCoffee(coffee: .espresso)
