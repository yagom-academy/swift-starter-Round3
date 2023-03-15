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
    var age: Int
    var money: Int

    mutating func buyCoffee(from memu: Coffee) {
        print(memu.rawValue + " 주세요.")
        
        if let coffeePrice = yagombucks.menu[memu] {
            self.money -= coffeePrice
            
            print(name + "의 남은 돈:\(money)\n")
        } else {
            print("nil")
        }
    }
}

enum Coffee: String {
    case americano = "아메리카노", latte = "라떼", iceTea = "아이스티"
}

struct CoffeeShop {
    var barista: Person
    var income: Int
    var menu: [Coffee: Int]
    var pickUpTable = [Coffee]()
    
    mutating func sellCoffee(menu: Coffee) {
        print(menu.rawValue + " 주문 받았습니다.")
        
        if let coffeePrice = self.menu[menu] {
            self.income += coffeePrice
            
            print("카페 수익:\(income)")
        } else {
            print("nil")
        }
        
        pickUpTable.append(menu)
        print("\(pickUpTable.map{ $0.rawValue }.joined(separator: ", ")) 픽업대에 나와있습니다.")
    }
}

var misterLee = Person(name: "이땡떙", age: 24, money: 40000)
var missKim = Person(name: "김떙떙", age: 28, money: 0)
var yagombucks = CoffeeShop(barista: misterLee, income: 0, menu: [.americano : 2000, .latte: 2500, .iceTea: 3000])

