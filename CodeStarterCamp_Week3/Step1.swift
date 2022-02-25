//
//  Step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 지상률 on 2022/02/24.
//

import Foundation

class Person {
    var name: String
    var age: Int
    var money: Int
    
    init?(name: String, age: Int , money: Int) {
        if name.count == 0 {
            return nil
        }
        if (0...120).contains(age) == false {
            return nil
        }
        self.name = name
        self.age = age
        self.money = money
    }
    func buySomeThings(things: String){
        print("\(name)이 \(things)를 구매하셨습니다.")
    }
}

enum Coffee: Int {
    case Americano
    case Latte
    case Espresso
    case Juice
    case Dessert
    case Goods
    
    func printCoffeePrice()-> Int{
        switch self{
        case .Americano:
            return 4500
        case .Latte:
            return 5000
        case .Espresso:
            return 3500
        case .Dessert:
            return 6000
        case .Juice:
            return 5500
        case .Goods:
            return 3000
        }
        
    }
}


class CoffeShop{
    var revenue: Int
    var menu: Coffee!
    var barista : Person!
    var pickUpTable : Bool
    
    init(revenue: Int, pickUpTable : Bool){
        self.revenue = revenue //보통은 하루 수입은 0원부터 출발한다.
        self.pickUpTable = pickUpTable
    }

    func showCoffeePrint(_ price : Coffee){ //메뉴를 고르면 얼마인지 보여주는 함수
        print("\(price)의 가격은 \(price.printCoffeePrice())원 입니다.")
    }
    
    func makeCoffee(_ menu : Coffee){ //자신의 메뉴가 제조중인지 알려주는 함수
        print("\(menu)를 만드는 중입니다.")
    }
}
