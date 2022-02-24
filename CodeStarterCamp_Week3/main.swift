//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation


class Person {
    var money: Int?
    var baristarMan: String
    var baristarGirl: String
    init(money: Int, baristarMan: String, baristarGirl: String) {
        self.money = money
        self.baristarMan = baristarMan
        self.baristarGirl = baristarGirl
    }
    init(baristarMan: String, baristarGirl: String) {
        self.baristarMan = baristarMan
        self.baristarGirl = baristarGirl
    }
    func buyCoffee() {
        print("커피 주문할게요")
    }
}
class CoffeeShop {
    
    var salesMoney: Int
    var baristar: String
    //종류와 가격을 같이 표기하기 위해 dictionary를 사용해봤습니다.
    var coffeeMenu: Dictionary<String, Int> = [:]
    //pickUpTable이 어떤 기능을 하는지 잘 이해하지 못해 일단 string type으로 설정 해 봤습니다
    var pickUpTable: String
    init(salesMoney: Int, baristar: String, coffeeMenu: Dictionary<String, Int> , pickUpTable: String) {
        self.salesMoney = salesMoney
        self.baristar = baristar
        self.coffeeMenu = coffeeMenu
        self.pickUpTable = pickUpTable
    }
    func makeCoffeAndOrder(coffe: Dictionary<String, Int>) {
        coffeeMenu = ["iceAmericano": 45000, "espresso": 3000, "cafeLatte": 5200]
        if coffe == ["iceAmericano": 45000] {
            print("아이스 아메리카노 주문 받았습니다")
        } else if coffe  == ["espresso": 3000] {
            print("에스프레소 주문 받았습니다")
        } else {
            print("카페라테 주문 받았습니다")
        }
    }
}

enum Menupan: String {
    // 열거형에 string 타입으로 가격까지 붙여 봤습니다
    case iceAmericano = "아이스 아메리카노 4500원입니다"
    case esopresso = "에소프레소 3000원 입니다"
    case cafeLatte = "카페라떼 5000원 입니다"
}

//Person 타입의 인스턴스로 misterLee , missKim 을 생성해봅시다.
var myPerson: Person = Person(baristarMan: "", baristarGirl: "")
myPerson.baristarGirl = "missKim"
myPerson.baristarMan = "misterLee"
var yagomBucks: CoffeeShop = CoffeeShop(salesMoney: 0, baristar: "", coffeeMenu: ["": 0], pickUpTable: "" )
yagomBucks.baristar = myPerson.baristarMan

print("저희 yagomBucks의 baristar는\(myPerson.baristarMan)입니다")
