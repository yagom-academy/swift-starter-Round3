//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person { // 물건 구매 후 남은 돈 알려주면 될듯
    
    var name: String
    var money: Int
    
    init(name: String, money: Int){
        self.name = name
        self.money = money
    }
    
    func buySomething(thing: String) {
        var defaultCount = 0
        switch thing{
        case "커피":
            money -= 3000
        case "담배":
            money -= 4500
        case "콜라":
            money -= 2500
        default:
            money += 0
            defaultCount += 1
        }
        if defaultCount == 0 {
            print("\(name)님이 구매하신 물건은 \(thing)이며, 남은 금액은 \(money)원 입니다.")
        } else if defaultCount == 1{
            print("\(name)님, 해당 물건은 구매할 수 없으며, 남은 금액은 \(money)원 입니다.")
        }
    }
}

// 수입을 부가적으로 올려서 알려주기
// 열거형 이용해서 캎페이익
var cafeProfit = 0

class CoffeeShop {
    
    var cafeName: String
    var cafeProfit: Int
    var barista: String
    var pickUpTable: String
    
    init(cafeName: String, cafeProfit: Int, barista: String, pickUpTable: String){
        self.cafeName = cafeName
        self.cafeProfit = cafeProfit
        self.barista = barista
        self.pickUpTable = pickUpTable
    }
    
    func takeOrder(coffeeType : String){
            print("\(coffeeType) 준비해 드리겠습니다, \(barista)님이 준비해주실거에요 !")
            makeCoffee(coffeeType: coffeeType)
    }
    
    func makeCoffee(coffeeType: String){
        print("\(coffeeType)을 만들기 위해 샷을.. 내리는 중 .. ")
        print("주문하신 \(coffeeType) 나왔습니다 ~~! \(pickUpTable)에 놓을게요!")
    }
    
    func printCafeProfit(){
        
        print("\(cafeName)의 누적 이익은 \(cafeProfit)원 입니다 !")
        
    }

}

enum Coffee: Int{
    case americano
    case mixCoffee
    case cafeMocha
    case vanillaLatte
    case espresso
    
    func coffeePrice() -> Int{
        switch self{
        case .americano:
            return 3000
        case .mixCoffee:
            return 2500
        case .cafeMocha:
            return 3500
        case .vanillaLatte:
            return 4000
        case .espresso:
            return 2500
        }
    }
}

var misterLee = Person(name: "misterLee", money: 10000)
var missKim = Person(name: "missKim", money: 50000)
misterLee.buySomething(thing: "신발")
missKim.buySomething(thing: "담배")

let americano = Coffee.americano
let vanillaLatte = Coffee.vanillaLatte

var yagombucks = CoffeeShop(cafeName: "yagombucks", cafeProfit: 10000, barista: "misterLee", pickUpTable: "카운터")
yagombucks.takeOrder(coffeeType: "\(americano)")
yagombucks.cafeProfit += americano.coffeePrice()

yagombucks.takeOrder(coffeeType: "\(vanillaLatte)")
yagombucks.cafeProfit += vanillaLatte.coffeePrice()

yagombucks.printCafeProfit()
