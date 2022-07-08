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
    var nickName: String? // String? 프로퍼티의 초기값이 꼭 필요 없을 때 사용.
    var money: Int
    
    init(name: String, age: Int, nickName: String, money: Int) {
        self.name = name
        self.age = age
        self.nickName = nickName
        self.money = money
    }
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func drink() {
        print("마시다")
    }
    
    func go() { //go(to: somePlace)
        print("가다")
    }
    
    func order(coffee: Coffee) -> Coffee {
        print("\(coffee)를 주문하다")
        //self.money -= 커피값
        
        return coffee
    }
}

struct CoffeeShop {
    var sales: Int
    // 딕셔너리와 enum중에 고민....
    var menu: [Coffee: Int] = [.americano: 2000, .cappuccino: 2500, .espresso: 1500, .flatWhite: 3000, .latte: 2500, .macchiato: 3000, .mocha: 2500 ]
    var pickUpTable: [String] = []
    var barista: Person?
        
    //init()을 하지 않은 이유: struct에서 제공하는 memberwise 이니셜라이즈를 사용해보기 위함.
    
    func takeAnOrder() {
        print("주문을 받다")
    }
    
    mutating func makeCoffee(orderedCoffee: Coffee) { // make(coffee)
        print("커피를 만들다")
        pickUpTable.append(orderedCoffee.rawValue)
    }
    
}

enum Coffee: String {
    case latte, cappuccino, americano, espresso, flatWhite, macchiato, mocha
}


var misterLee = Person(name: "misterLee", age: 30, nickName: "jin", money: 50000)
var missKim = Person(name: "missKim", age: 29, money: 39000)
var yagombucks = CoffeeShop(sales: 100000)
yagombucks.barista = misterLee

//if let baristaName = yagombucks.barista?.name {
//    print(baristaName)
//}
