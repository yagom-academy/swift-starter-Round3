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

class CoffeeShop {
    
    var checkMakeCoffee = 0

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
        checkProfit(coffeeType: coffeeType)
        if checkMakeCoffee == 0 {
            print("\(coffeeType) 준비해 드리겠습니다, \(barista)님이 준비해주실거에요 !")
            makeCoffee(coffeeType: coffeeType)
        } else if checkMakeCoffee == 1 {
            print("해당 커피는 안팝니다.. !!!")
        }
    }
    
    func makeCoffee(coffeeType: String){
        print("\(coffeeType)을 만들기 위해 샷을.. 내리는 중 .. ")
        print("주문하신 \(coffeeType) 나왔습니다 ~~! \(pickUpTable)에 놓을게요!")
    }
    func checkProfit(coffeeType: String){
            switch coffeeType{
            case "아메리카노":
                cafeProfit += 3000
            case "믹스커피":
                cafeProfit += 2500
            case "카페모카":
                cafeProfit += 3500
            case "바닐라라떼":
                cafeProfit += 4000
            default:
                cafeProfit += 0
                checkMakeCoffee += 1
        }
    }
}

enum coffee {
    case 아메리카노, 믹스커피, 카페모카, 바닐라라떼, 에스프레소
}

func checkCoffee(coffee: coffee){
    switch coffee{
    case .아메리카노, .믹스커피, .바닐라라떼, .카페모카:
        print("아 \(coffee) 있습니다 !")
    case .에스프레소:
        print("아 \(coffee)…그건 없어요 ㅠㅠ")
    }
}

var misterLee = Person(name: "misterLee", money: 10000)
var missKim = Person(name: "missKim", money: 50000)
misterLee.buySomething(thing: "신발")
missKim.buySomething(thing: "담배")

var yagombucks = CoffeeShop(cafeName: "yagombucks", cafeProfit: 10000, barista: "misterLee", pickUpTable: "카운터")
yagombucks.takeOrder(coffeeType: "아메리카노")

checkCoffee(coffee: .아메리카노)
checkCoffee(coffee: .에스프레소)
