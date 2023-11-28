//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//


// 2023-11-28 by ss_12_daeho8078
// Round3-Step1: 타입과 인스턴스 관계

import Foundation

enum Coffee {
    case Americano
    case Latte
    case Choco
    case Caramel
    case Mint
    
}

//Person 타입을 구조체로 설정
struct Person {
    var money: Int = 0
    
    func buyCoffee(){
        print("커피를 구매하였습니다.")
    }
}


//CoffeShop 타입을 구조체로 설정
struct CoffeeShop {
    var barista: Person
    var totalSales: Int = 0
    var coffeeMenu: String = ""
    var coffeePrice: Int = 0
    var pickUpTable: [String] = []
    
    
    mutating func orderCoffee(coffeMenu: String){
        self.coffeeMenu = coffeMenu
       
    }
    
    mutating func makeCoffee(){
        self.pickUpTable.append(self.coffeeMenu)
    }
}


var misterLee: Person = Person()
var missKim: Person = Person()

var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)



