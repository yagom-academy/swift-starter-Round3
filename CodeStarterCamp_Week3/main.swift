//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct Person {
    let name: String
    var money: Int
    
    func buyCoffee(coffee: typesOfCoffee) {
        print("\(name)이(가) \(coffee.rawValue)를 주문합니다.")
    }
}

struct CoffeeShop {
    var totalSales: Int = 0
    var menu: [typesOfCoffee: Int] = [:]
    var pickUpTable: [String] = []
    let barista: Person
    
    func takeOrders() {
        print("바리스타 \(barista.name)이(가) 주문을 받습니다.")
    }
    
    mutating func makeCoffee(coffee: typesOfCoffee) {
        pickUpTable.append(coffee.rawValue)
        print("주문받은 \(coffee.rawValue)를 만들었습니다.")
    }
}

enum typesOfCoffee: String {
    case espresso = "에스프레소"
    case americano = "아메리카노"
    case iceAmericano = "아이스 아메리카노"
    case cafeLatte = "카페라떼"
    case cafeMocha = "카페모카"
    case vanillaLatte = "바닐라라떼"
}

let misterLee = Person(name: "Mr.Lee", money: 5000)
let missKim = Person(name: "Ms.Kim", money: 10000)
var yagombucks = CoffeeShop(barista: misterLee)

missKim.buyCoffee(coffee: .espresso)
yagombucks.takeOrders()
yagombucks.makeCoffee(coffee: .espresso)
