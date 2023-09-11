//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee{
    case espresso, americano, latte
    var name : String{
        switch self{
        case .espresso:
            return "espresso"
        case .americano:
            return "americano"
        case .latte:
            return "latte"
        }
    }
}
struct Person{
    var name : String
    var money : Int = 10000
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String){
        if let coffeeValue = coffeeShop.menuBoard[coffee] {
            if  money < coffeeValue{
                let results = coffeeValue - money
                print("잔액이 \(results)원만큼 부족합니다")
            }else{
                money = money - coffeeValue
                coffeeShop.make(coffee, from:name )
            }
        }
    }
}
class CoffeeShop{
    let barista : Person
    var sales : Int = 0
    var menuBoard : [Coffee:Int] = [:]
    var pickUpTable : [Coffee] = []
    
    init(barista: Person, sales: Int, menuBoard: [Coffee : Int], pickUpTable: [Coffee]) {
        self.barista = barista
        self.sales = sales
        self.menuBoard = menuBoard
        self.pickUpTable = pickUpTable
    }
    func make(_ coffee : Coffee, from name : String){
        pickUpTable.append(coffee)
        showPickUpTable(coffee, customer: name)
    }
    func showPickUpTable(_ coffee : Coffee, customer : String){
        print("\(customer)님이 주문하신 \(coffee.name)(이/가) 준비 되었습니다.", terminator: "")
        print("픽업대에서 가져가 주세요.")
    }
}
var minsterLee = Person(name: "minsterLee")
var missKim = Person(name: "missKim")
var Coda = Person(name: "Coda")

var yagombucks = CoffeeShop(barista: minsterLee, sales: 0, menuBoard: [.americano:3000], pickUpTable: [])


missKim.order(.americano, of: yagombucks, by: missKim.name)
Coda.order(.americano, of: yagombucks, by: Coda.name)
