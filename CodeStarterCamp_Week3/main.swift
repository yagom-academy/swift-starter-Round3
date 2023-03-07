//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var haveMoney: Int
    var name: String
    
    //커피 주문하는 함수
    mutating func orderCoffee(personName: String, coffeePrice: Int, coffeeName: String) {
        if self.haveMoney >= coffeePrice {
            print("\(coffeeName) 주세요.")
            self.haveMoney -= coffeePrice
        }
        else {
            print("\(coffeePrice - self.haveMoney)원 만큼 돈이 부족하네")
        }
    }
    
}

struct CoffeeShop {
    var revenue: Int = 0
    var menu: [Coffee: Int] = [Coffee.espresso: 3000, Coffee.americano: 3500, Coffee.cafeLatte: 4000, Coffee.cappuccino: 4500]
    var pickUpTabke: [String] = []
    var barista: Person?
    
    //커피 주문받고 만드는 함수
    mutating func makeCoffee(personName: String, coffeePrice: Int, coffeeName: Coffee) {
        if coffeePrice > 0 {
            if let coffee = menu[coffeeName] {
                self.revenue += coffee
                putInPickUpTable(coffeeName: coffeeName)
            }
            else {
                print("해당 커피가 없습니다")
            }
        }
    }
    
    //커피 pickUpTable에 올려놓는 함수
    func putInPickUpTable(coffeeName: Coffee) {
        print("주문하신 \(coffeeName)가 나왔습니다.")
    }
    
}

enum Coffee: String{
    case espresso = "에스프레소"
    case americano = "아메리카노"
    case cafeLatte = "카페라떼"
    case cappuccino = "카푸치노"
}



