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
    var barista: Person
    let menu: Dictionary<Coffee, Int> = [.americano: 3000, .caffeLatte: 5000, .greenTea: 4000]
    var pickUpTable: Array<String> = Array<String>() {
        didSet {
            if let orderedCoffee = pickUpTable.last {
                print("주문하신 \(orderedCoffee)(이/가) 준비되었습니다.")
            }
        }
    }
    
    init(sales: Int, barista: Person){
        self.sales = sales
        self.barista = barista
    }
    
    func make(_ coffee: Coffee, for name: String) {
        pickUpTable.append(coffee.rawValue)
    }
}

struct Person {
    var name: String
    var age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }

    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop) {
        if let coffeePrice = coffeeShop.menu[coffee] {
            if money - coffeePrice < 0 {
                print("잔액이 \(coffeePrice - money)원만큼 모자랍니다")
            } else {
                coffeeShop.make(coffee, for: name)
                money -= coffeePrice
                coffeeShop.sales += coffeePrice
                print("\(name)의 잔액: \(money)원, 커피숍의 잔액: \(coffeeShop.sales)원")
                print()
            }
        }
    }
}

var customer = Person(name: "jin", age: 13, money: 10000)
var employee = Person(name: "joo", age: 25, money: 5000)
let starbucks = CoffeeShop(sales: 50000, barista: employee)

customer.order(.americano, of: starbucks)
customer.order(.caffeLatte, of: starbucks)
customer.order(.greenTea, of: starbucks)
