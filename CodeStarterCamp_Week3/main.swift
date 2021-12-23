//  main.swift
//  CodeStarterCamp_Week3
//  Created by yagom
//  Copyright © yagom academy. All rights reserved

import Foundation

class Person {
    let name: String
    let birthYear: Int
    var moneyPurse: Int?
    
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
    
    func buy(something: Any) {
        print("\(something)을 구매하였습니다.")
    }
    
    func move(to: Any) {
        print("\(name)님이 \(to)로 이동합니다.")
    }
    
    func drinkCoffee(_ coffee: Coffee) -> Coffee {
        move(to: "야곰벅스")
        print("\(coffee)를 주문받고 대기합니다.")
        return coffee
    }
}

enum Coffee {
    case americano
    case espresso
    case cafeLatte
    case caffeMocha
    case hotChocolate
    
    var price: Int {
        switch self {
        case .americano:
            return 3000
        case .espresso:
            return 2500
        case .cafeLatte:
            return 3500
        case .caffeMocha:
            return 3500
        case .hotChocolate:
            return 3500
        }
    }
}

struct CoffeeShop {
    private var totalSales: Int = 0
    var barista: Person
    var pickUpTable: [Coffee]?
    
    init(barista: Person) {
        self.barista = barista
    }
    
    mutating func orderDrink(coffee: Coffee, customer: Person) {
        print("\(coffee) 메뉴와 \(coffee.price)원 지불 받았습니다.")
        if let customerMoney = customer.moneyPurse, customerMoney < coffee.price {
            print("잔액이 {\(customerMoney-coffee.price)} 원만큼 부족합니다.")
        } else {
            customer.moneyPurse? -= coffee.price
            totalSales += coffee.price
            makeDrink(coffee: coffee, barista: self.barista)
            pickUpTable(coffee: coffee, customer: customer)
        }
    }
    
    func makeDrink(coffee: Coffee, barista: Person) {
        print("\(barista.name)가 \(coffee)를 만들기 시작합니다.")
    }
    
    mutating func pickUpTable(coffee: Coffee, customer: Person) {
        self.pickUpTable?.append(coffee)
        guard let customerCoffee = self.pickUpTable else { return }
        print("\(customer.name) 님의 \(customerCoffee)가 준비되었습니다. 픽업대에서 가져가주세요.")
        self.pickUpTable?.removeAll()
    }
}
var misterLee = Person(name: "Mr.Lee", birthYear: 1998)
var misterkim = Person(name: "김쿼카", birthYear: 1997)
misterkim.moneyPurse = 10000

var yagombucks = CoffeeShop(barista: misterLee)
yagombucks.orderDrink(coffee: .hotChocolate, customer: misterkim)
