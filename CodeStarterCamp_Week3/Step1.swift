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
    case Americano = 4500
    case Latte = 5000
    case Espresso = 3500
    case Juice = 5500
    case Dessert = 6000
    case Goods = 3000
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
        print("\(price)의 가격은 \(price.rawValue)원 입니다.")
    }
    func totalRevenue(_ income : Coffee)-> Int{ //팔때마다 금액이 누적되는 함수
        let sellRevenue : Int = income.rawValue
        revenue += sellRevenue
        return revenue
    }
    func makeCoffee(_ menu : Coffee){ //자신의 메뉴가 제조중인지 알려주는 함수
        print("\(menu)를 만드는 중입니다.")
    }
}
