//
//  File.swift
//  CodeStarterCamp_Week3
//
//  Created by 이정민 on 2022/04/27.
//

class CoffeeShop {
    private(set) var owner: String
    private(set) var location: String
    private(set) var sales: Int = 0
    private(set) var menu: [Coffee: Int] = [:]
    private var pickUpTable: PickUpTableInfo? {
        willSet(newOrder) {
            if let order = newOrder {
                print("\(order.customer) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        }
    }
    var barista: Person
    
    init(owner: String, location: String, barista: Person) {
        self.owner = owner
        self.location = location
        self.barista = barista
    }
    
    func add(menu: [Coffee: Int]) {
        self.menu = self.menu.merging(menu, uniquingKeysWith: { $1 })
    }
    
    func order(_ coffee: Coffee, for person: Person) {
        if let coffeePrice = self.menu[coffee] {
            if isEnough(money: person.money, for: coffeePrice) {
                person.pay(money: coffeePrice)
                sales += coffeePrice
                pickUpTable = PickUpTableInfo(customer: person.name, coffee: coffee)
            }
        }
    }
    
    private func isEnough(money: Int, for coffeePrice: Int) -> Bool {
        if money > coffeePrice {
            return true
        } else {
            print("잔액이 \(coffeePrice)원만큼 부족합니다")
            return false
        }
    }
}
