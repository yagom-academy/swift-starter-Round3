//
//  week3_step2.swift
//  CodeStarterCamp_Week3
//
//  Created by 정경우 on 2022/11/16.
//
/*
import Foundation

struct Person {
    var name: String
    var gender: String
    var age: Int
    var money: Int
    
    mutating func orderCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
        if let price = coffeeShop.menu[coffee] {
            if money >= price {
                coffeeShop.revenue += price
                money = money - price
                print("커피 가격은 \(price)원이고 남은 돈 \(money)원 입니다.")
                print("가게 매출은 \(coffeeShop.revenue)원 입니다")
            } else {
                print("잔액이 원만큼 부족합니다.")
            }
            
        }
    }
}


class CoffeeShop {
    var shopName: String
    var revenue: Int
    var barista: Person
    var menu: [Coffee: Int] = [:]
    var pickUpTable: [String] = []
    
    func makeCoffee(from name: String, coffee: Coffee) {
        pickUpTable.append("\(coffee)")
        for num in 0...(pickUpTable.count - 1) {
            print("\(name)님 주문하신 \(pickUpTable[num])",terminator: "")
            print("(이/가) 나왔습니다. 픽업대에서 가져가주세요.")
            pickUpTable.removeAll()
        }
    }
    
    init(shopName: String, barista: Person, revenue: Int) {
        self.shopName = shopName
        self.barista = barista
        self.revenue = revenue
        
        for coffee in Coffee.all {
            menu[coffee] = coffee.rawValue
        }
    }
}

enum Coffee: Int {
    case americano = 1000
    case latte = 2000
    case ade = 3000
    case smoothie = 4000
    static let all = [americano, latte, ade, smoothie]
}


var misterLee: Person = Person(name: "misterLee", gender: "male", age: 28, money: 30000)
var missKim: Person = Person(name: "missKim", gender: "female", age: 21, money: 20000)
var yagombucks: CoffeeShop = CoffeeShop(shopName: "yagombucks", barista: misterLee, revenue: 0)

misterLee.orderCoffee(coffeeShop: yagombucks, coffee: .americano)
yagombucks.makeCoffee(from: misterLee.name, coffee: .americano)
misterLee.orderCoffee(coffeeShop: yagombucks, coffee: .latte)
yagombucks.makeCoffee(from: misterLee.name, coffee: .latte)
misterLee.orderCoffee(coffeeShop: yagombucks, coffee: .smoothie)
yagombucks.makeCoffee(from: misterLee.name, coffee: .smoothie)
*/
