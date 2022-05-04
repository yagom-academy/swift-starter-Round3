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
    
    func isCoffeeAvailable(_ coffee: Int) -> Bool {
        if money >= coffee {
            return true
        } else {
            print("잔액이 \(coffee - money)원만큼 부족합니다.")
            return false
        }
    }
    
    mutating func pay(for coffeePrice: Int) {
        money -= coffeePrice
    }
    
    mutating func buy(_ coffee: Coffee, at coffeeShop: CoffeeShop) {
        if let coffeePrice = coffeeShop.menuList[coffee] {
            if isCoffeeAvailable(coffeePrice) {
                if coffeeShop.order(coffee, from: name) == true {
                    pay(for: coffeePrice)
                }
            }
        }
    }
}

class CoffeeShop {
    var totalSales = 0
    let menuList: [Coffee: Int] = [.americano: 4000, .latte: 4500, .milkTea: 4500, .vanillaLatte: 5000, .strawberryLatte: 5500]
    var barista: Person
    var customerName: String?
    var pickUpTable: Bool = false {
        didSet {
            if let customer = customerName, pickUpTable == true {
                print("\(customer)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
                pickUpTable = false
                customerName = nil
            }
        }
    }
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func order(_ coffee: Coffee, from customerName: String) -> Bool {
        if let coffeePrice = menuList[coffee] {
            self.customerName = customerName
            makeCoffee()
            increaseSales(coffeePrice)
            return true
        } else {
            return false
        }
    }
    
    func makeCoffee() {
        print("\(barista.name)이(가) 커피를 만들었습니다.")
        pickUpTable = true
    }
    
    func increaseSales(_ price: Int) {
        totalSales += price
    }
}

enum Coffee {
    case americano, latte, milkTea, vanillaLatte, strawberryLatte
}

var missKim = Person(name: "missKim", money: 10000)
let misterLee = Person(name: "misterLee", money: 10000)
var yagombucks = CoffeeShop(barista: misterLee)

missKim.buy(.strawberryLatte, at: yagombucks)
