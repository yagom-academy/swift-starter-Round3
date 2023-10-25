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
    var age: UInt
    var money: Int
    
    init?(name: String, age: UInt, money: Int) {
        if (0...100).contains(age) == false || name.isEmpty {
            return nil
        }
        self.name = name
        self.age = age
        self.money = money
    }
    
    func orderMenu (coffeeName: CoffeeShop.Menu) {
        if self.money < coffeeName.rawValue {
            print ("\(self.name)!! 잔액이 부족합니다. 현재잔액은 \(self.money)입니다.")
        } else {
            self.money = money - coffeeName.rawValue
            print("\(self.name)은(는) \(coffeeName)을(를) 주문하였습니다. 남은 잔액은\(self.money)입니다.")
    
        }
    }
}

class CoffeeShop {
    
    var name: String
    var barista: Person!
    var revenue: Int
    var pickUpTable: Dictionary<String, Menu> = [:]
    enum Menu: Int {
        case americano = 1500
        case latte = 3500
        case espresso = 1000
    
    }
    
    init (name: String, barista: Person?, revenue: Int) {
        self.name = name
        self.barista = barista
        self.revenue = revenue
    }
       
    func takeOrder (coffeeName: Menu, customer: Person) {
        print("안녕하세요.\(self.name)입니다. 주문하시겠요?")
        customer.orderMenu(coffeeName: coffeeName)
        print("바리스타 \(self.barista.name)이(가) \(coffeeName)를 주문받았습니다.")
    }
        
    func serveOrder (name: String, coffeeName: Menu) -> Dictionary<String, Menu>{
        print("\(name)님의 \(coffeeName)가 픽업테이블에 준비되었습니다.")
        let CoffeMenu: [String: Menu] = [name: coffeeName]
        self.revenue += coffeeName.rawValue
        return CoffeMenu
    }
}
    

guard let missKim: Person = Person(name: "missKim", age: 23, money: 1000) else {
    fatalError("Person missKim initializing failed")
}
guard let misterLee: Person = Person(name: "misterLee", age: 30, money: 1500) else {
    fatalError("Person misterLee initializing failed")
}
let yagombucks: CoffeeShop = CoffeeShop(name:"yagombucks", barista: misterLee, revenue: 0)
yagombucks.takeOrder(coffeeName: .espresso, customer: missKim)
yagombucks.pickUpTable = (yagombucks.serveOrder(name: "missKim", coffeeName: .espresso))
print("\(yagombucks.name)의 매출액은 \(yagombucks.revenue)입니다.")

