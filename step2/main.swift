//
//  main.swift
//  step2
//
//  Created by 한지석 on 2022/03/04.
//

import Foundation

// missKim은 야곰벅스의 오더 메소드를 호출해 커피 주문
// 주문과 동시에 미스킴의 돈은 커피의 가격만큼 줄어듬. 매출액은 커피 가격만큼 증가
// 미스킴이 가지고 있는 도닝 적다면, 같은 문구를 출력

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
    }
  
    
}

enum Coffee: String, CaseIterable{
    case americano
    case mixCoffee
    case cafeMocha
    case vanillaLatte
    case espresso
    
    var coffeePrice: Int{
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
    var pickUpTable: String = "주방" {
        didSet {
            print("커피는 \(oldValue)에서 만든 후, \(pickUpTable)에 올려 놓을게요!")
        }
    }
    var barista: Person
    
    let cafeMenu = Coffee.allCases.map({ "\($0)" }) .joined(separator: ", ")
    
    
    mutating func order(coffee: Coffee, customer: inout Person){ // 주문시 missKim 가격 다운 & 야곰벅스 매출액 증가

        let coffeePrice = coffee.coffeePrice // 3000
        // 함수의 파라미터는 기본적으로 let
        if customer.money < coffeePrice{
            print("잔액이 \(-(customer.money - coffeePrice))원 만큼 부족합니다!")
            print("카페 이익 : \(cafeProfit), \(customer.name)님의 남은 돈 : \(customer.money)")

        } else {
            
            cafeProfit += coffeePrice
            customer.money -= coffeePrice // missKim
            makeCoffee(coffee: coffee, customer: customer)
            
        }
        
    }
    
    mutating func makeCoffee(coffee: Coffee, customer: Person){

        print("\(coffee)는 바리스타 \(barista.name)님이 만들고 있습니다!")
        print("\(customer.name) 님의 커피가 준비되었습니다! \(pickUpTable)에서 가져가주세요!")
        print("카페 이익 : \(cafeProfit), \(customer.name)님의 남은 돈 : \(customer.money)")
    }
    
}

var misterLee = Person(name: "misterLee", money: 15000)
var missKim = Person(name: "missKim", money: 5000)
var seok = Person(name: "seok", money: 3000)

var yagombucks = CoffeeShop(cafeName: "yagombucks", cafeProfit: 100000, barista: misterLee)

print("**카페메뉴** \n[\(yagombucks.cafeMenu)]")

yagombucks.pickUpTable = "픽업 테이블"

yagombucks.order(coffee: .americano, customer: &missKim)
yagombucks.order(coffee: .vanillaLatte, customer: &seok)
