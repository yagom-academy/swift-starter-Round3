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
        
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        print(coffee.rawValue + " 주세요.")
        
        guard let coffeePrice = coffeeShop.menu[coffee] else { return }
            if coffeePrice <= self.money {
                self.money -= coffeePrice
                print(name + "의 남은 돈:\(money)\n")
                
                coffeeShop.make(coffee, for: name)
            } else {
             print("잔액이 \(-(money - coffeePrice))원만큼 부족합니다.\n")
        }
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    case iceTea = "아이스티"
}

class CoffeeShop {
    var barister: Person
    var income: Int
    let menu: [Coffee: Int]
    var pickUpTable = [Coffee]()
    
    init(barister: Person, income: Int, menu: [Coffee: Int]) {
        self.barister = barister
        self.income = income
        self.menu = menu
    }
    
    func make(_ coffee: Coffee, for name: String) {
        print(coffee.rawValue + " 주문 받았습니다.")
        
        guard let coffeePrice = self.menu[coffee] else { return }
            self.income += coffeePrice
        print("카페 수익:\(income)")
        
        pickUpTable.append(coffee)
        print("\(name)님이 주문하신 \(pickUpTable.map{$0.rawValue}.joined(separator: ", "))(이/가) 준비되었습니다. 픽업대에서 가져가주세요.\n")
    }
}

var misterLee = Person(name: "이땡떙", age: 24, money: 40000)
var missKim = Person(name: "김떙떙", age: 28, money: 900000)
var misterJang = Person(name: "장땡떙", age: 56, money: 1000)
var yagombucks = CoffeeShop(barister: misterLee, income: 0, menu: [.americano: 2000, .latte: 2500, .iceTea: 3000])

missKim.order(.latte, of: yagombucks, by: missKim.name)
misterJang.order(.americano, of: yagombucks, by: misterJang.name)
