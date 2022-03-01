//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// struct가 어울릴 것 같다.

struct Person {
    var name: String
    var money: Int
    
    init(name: String, money: Int){
        self.name = name
        self.money = money
    }
    mutating func buySomething(thing: String){
        switch thing{
        case "커피":
            money -= 3000
        case "담배":
            money -= 4500
        case "콜라":
            money -= 2000
        default:
            money -= 0
        }
        
        if money != 10000{
            print("\(name)님이 구매하신 물건은 \(thing)이며, 남은 돈은 \(money)입니다.")
        } else if money == 10000{
            print("\(name)님이 구매하신 물건은 없으며, 남은 돈은 \(money)입니다.")
        }
    }
}

enum Coffee: String{
    case americano = "아메리카노"
    case mixCoffee = "믹스커피"
    case cafeMocha = "카페모카"
    case vanillaLatte = "바닐라라떼"
    case espresso = "에스프레소"
    
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


struct CoffeeShop{
    var cafeName: String
    var cafeProfit: Int
    var pickUpTable: String
    var barista: String
    
    let cafeMenu: [String: Int] = [ Coffee.americano.rawValue : Coffee.americano.coffeePrice(), Coffee.mixCoffee.rawValue : Coffee.mixCoffee.coffeePrice(), Coffee.cafeMocha.rawValue : Coffee.cafeMocha.coffeePrice(), Coffee.vanillaLatte.rawValue : Coffee.vanillaLatte.coffeePrice() , Coffee.espresso.rawValue : Coffee.espresso.coffeePrice()]
    
    mutating func takeOrder(coffee1: String, coffee2: String, coffeePrice: Int){
        print("\(barista)님이 \(coffee1)이랑 \(coffee2) 만들어 드릴게요 !")
        makeCoffee(coffee1: coffee1, coffee2: coffee2, coffeePrice: coffeePrice)
    }
    
    mutating func makeCoffee(coffee1: String, coffee2: String, coffeePrice: Int){
        print("\(coffee1), \(coffee2) 나왔습니다! \(pickUpTable)에 놓을게요!")
        checkProfit(coffeePrice: coffeePrice)
    }
    
    mutating func checkProfit(coffeePrice: Int){
        cafeProfit += coffeePrice
        print("\(cafeName)의 누적 순이익은 \(cafeProfit)입니다!")
    }
    
}

var misterLee = Person(name: "misterLee", money: 10000)
var missKim = Person(name: "missKim", money: 10000)
misterLee.buySomething(thing: "담배")
missKim.buySomething(thing: "커피")

var yagombucks = CoffeeShop(cafeName: "yagombucks", cafeProfit: 150000, pickUpTable: "카운터", barista: misterLee.name)

let cafeMenu = yagombucks.cafeMenu
print("**메뉴판** \n\(cafeMenu)")

let americano = Coffee.americano.rawValue
let mixCoffee = Coffee.mixCoffee.rawValue
let coffeePrice = Coffee.americano.coffeePrice() + Coffee.mixCoffee.coffeePrice()

yagombucks.takeOrder(coffee1: americano, coffee2: mixCoffee, coffeePrice: coffeePrice)

