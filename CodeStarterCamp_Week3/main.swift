//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    var money: Int
    
    init (name: String, money: Int){
        self.name = name
        self.money = money
    }
    
    func buyItem(someItem: String) {
        print("\(someItem)을(를) 구입하셨습니다.")
    }
}

struct CoffeeShop {
    var barista: Person?
    var salesRevenue: Int = 0
    var menuBoard: [CoffeeType: Int] = [:]
    var pickUpTable: Int?
    
    func orderAndMakeCoffee(orderCoffee: CoffeeType) {
        if menuBoard.keys.contains(orderCoffee) {
            print("\(orderCoffee)을(를) 주문하셨습니다.\(orderCoffee)을(를) 만듭니다.")
            if let someCoffeePrice = menuBoard[orderCoffee] {
                print("가격은 \(someCoffeePrice)원 입니다.")
            }
        } else {
            print("그런 커피는 없습니다.")
        }
    }
}

enum CoffeeType {
    case americano, cafeLatte, espresso, cappuccino, cafeMocha
}

let misterLee = Person(name: "misterLee", money: 100_000)
let missKim = Person(name: "missKim", money: 200_000)
var yagombucks = CoffeeShop()

yagombucks.menuBoard[.americano] = 4500
yagombucks.menuBoard[.cafeLatte] = 5000
yagombucks.menuBoard[.espresso] = 3500
yagombucks.menuBoard[.cappuccino] = 5000
yagombucks.menuBoard[.cafeMocha] = 5000
yagombucks.pickUpTable = 10
yagombucks.orderAndMakeCoffee(orderCoffee: .americano)
yagombucks.barista = misterLee

if let baristaName = yagombucks.barista?.name {
    print("바리스타 이름은 \(baristaName)입니다.")
} else {
    print("바리스타가 없습니다. 사장이 직접 운영해요.")
}
