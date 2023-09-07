//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffe{
    case asspresso, americano, latte
    var name : String{
        switch self{
        case .asspresso:
            return "asspresso"
        case .americano:
            return "americano"
        case .latte:
            return "latte"
        }
    }
    var values : Int{
        switch self{
        case .americano:
            return 4000
        case .latte:
            return 5000
        case .asspresso:
            return 3500
        }
    }
}
struct Person{
    var name : String
    var money : Int = 10000
    mutating func order(drink : Coffe){
        if money < drink.values{
            print("잔액이 부족합니다")
        }else{
            money -= drink.values
            print("\(drink.name)를 주문합니다")
            print("\(money)원 남았습니다.")
        }
    }
}
struct CoffeShop{
    var barista : Person
    var sales : Int = 0
    var menuBoard : Coffe = .americano
    var pickUpTable : [Coffe] = []
    
    mutating func salesCoffe(){
        print("\(self.sales)원 벌었습니다.")
    }
    mutating func takeOrder(menu : Coffe){
        print("\(menu)의 가격은 \(menu.values)원 입니다.")
        sales += menu.values
        makeCoffe(menu: menu.name)
        pickUpTable.append(menu)
    }
    func makeCoffe(menu : String){
        print("\(menu)를 만듭니다.")
    }
    func showPickUpTable(){
        for  drink in pickUpTable{
            print("\(drink)가 완성되었습니다.")
        }
    }
}
var minsterLee = Person(name: "minsterLee")
var missKim = Person(name: "missKim")

var yagombucks = CoffeShop(barista: minsterLee)
