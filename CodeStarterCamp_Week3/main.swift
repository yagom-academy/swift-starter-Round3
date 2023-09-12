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
    var menuBoard : [Coffee:Int]
    var pickUpTable : [Coffee:String] = [:]{
        didSet{
            if let coffee = pickUpTable.keys.first, let name = pickUpTable.values.first{
                showPickUpTable(coffee, customer: name)
            }
        }
    }
    init(barista: Person, menuBoard: [Coffee:Int]) {
        self.menuBoard = menuBoard
        self.barista = barista
    }
    func make(_ coffee: Coffee, from name: String){
        if let coffeeValue = menuBoard[coffee] {
            sales += coffeeValue
            pickUpTable.updateValue(name, forKey: coffee)
//            showPickUpTable(coffee, customer: name)
        }
    }
    func showPickUpTable(_ coffee: Coffee, customer: String){
        print("\(customer)님이 주문하신 \(coffee.name)(이/가) 준비 되었습니다.", terminator: "")
        print("픽업대에서 가져가 주세요.")
    }
}
var minsterLee = Person(name: "minsterLee")
var missKim = Person(name: "missKim")
var Coda = Person(name: "Coda")

var yagombucks = CoffeeShop(barista: minsterLee, menuBoard: [.americano:3000])

missKim.order(.americano, of: yagombucks, by: missKim.name)
Coda.order(.americano, of: yagombucks, by: Coda.name)
