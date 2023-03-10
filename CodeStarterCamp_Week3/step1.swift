//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by MARY on 2023/03/07.
//

import Foundation

struct Person {
    let name: String
    var money: Int
    
    mutating func order(_ coffee: Coffee, of coffeeshop: CoffeeShop, by name: String) {
        guard let price = coffeeshop.menu[coffee] else {
            print("\(coffeeshop.name)에 해당 메뉴가 없습니다.")
            return
        }
        
        guard money >= price else {
            print("잔액이 \(price-money)원만큼 부족합니다.")
            return
        }
        
        money -= price
        coffeeshop.get(money: price)
        coffeeshop.make(coffee, for: name)
    }
    
    func pickUp(_ coffee: Coffee, of coffeeshop: CoffeeShop, by name: String) {
        guard let index:Int = coffeeshop.pickUpTable.firstIndex(where: {$0.name == name && $0.coffee == coffee}) else {
            print("픽업대에 해당 음료가 없습니다.")
            return
        }
        coffeeshop.pickUpTable.remove(at: index)
        print("픽업대에서 \(coffee)를 가져왔습니다.")
    }
}

struct Orders {
    let name: String
    let coffee: Coffee
}

class CoffeeShop {
    let name: String
    var menu: [Coffee: Int]
    var barista: Person
    var salesRevenue: Int = 0
    var pickUpTable: [Orders] = [] {
        didSet {
            guard pickUpTable.count > oldValue.count else { return }
            guard let customer = pickUpTable.last else { return }
            
            print("[\(name)] \(customer.name)님이 주문하신 \(customer.coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
            showPickUpTable()
        }
    }
    
    func get(money: Int) {
        salesRevenue += money
    }
    
    func make(_ coffee: Coffee, for name: String) {
        print("[\(self.name)] \(name)님의 \(coffee.rawValue) 주문이 완료되었습니다.")
        print("[\(self.name)] 바리스타 \(barista.name)가 음료를 준비중입니다.")
        serve(coffee, for: name)
    }
    
    func serve(_ coffee: Coffee, for name: String) {
        pickUpTable.append(Orders(name: name, coffee: coffee))
    }
    
    func showPickUpTable() {
        for _ in 1...pickUpTable.count { print("⛾", terminator: "") }
        print("")
    }
    
    init(name: String, menu: [Coffee : Int], barista: Person) {
        self.name = name
        self.menu = menu
        self.barista = barista
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case decafAmericano = "디카페인아메리카노"
    case vanillaLatte = "바닐라라떼"
    case hazelnutLatte = "헤이즐넛라떼"
    case caramelmacchiato = "카라멜마끼야또"
}
