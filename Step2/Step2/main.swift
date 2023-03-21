//
//  main.swift
//  Step2
//
//  Created by 이진 on 2023/03/21.
//

import Foundation

enum Coffee: String {
    case americano = "아메리카노"
    case caffeLatte = "라떼"
    case greenTea = "녹차"
}

class CoffeeShop {
    var sales: Int
    var pickUpTable: Array<String> = Array<String>()
    
    init(sales: Int){
        self.sales = sales
    }
    
    func make(_ coffee: Coffee, for name: String) {
        pickUpTable.append(coffee.rawValue)
        if let coffeeOnPickUpTable = pickUpTable.last {
            print("\(name)님이 주문하신 \(coffeeOnPickUpTable)(이/가) 준비되었습니다.")
        }
    }
}

struct Person {
    var name: String
    var age: Int
    var money: Int
    let menu: Dictionary<Coffee, Int> = [.americano: 3000, .caffeLatte: 5000, .greenTea: 4000]
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }

    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop) {
        if let coffeePrice = menu[coffee] {
            if money - coffeePrice < 0 {
                print("잔액이 \(coffeePrice - money)원만큼 모자랍니다")
            } else {
                coffeeShop.make(coffee, for: name)
                money = money - coffeePrice
                coffeeShop.sales = coffeeShop.sales + coffeePrice
                print("\(name)의 잔액: \(money)원, 커피숍의 잔액: \(coffeeShop.sales)원")
                print()
            }
        }
    }
}

var misterLee = Person(name: "jin", age: 13, money: 10000)
let starbucks = CoffeeShop(sales: 50000)

misterLee.order(.americano, of: starbucks)
misterLee.order(.caffeLatte, of: starbucks)
misterLee.order(.greenTea, of: starbucks)
