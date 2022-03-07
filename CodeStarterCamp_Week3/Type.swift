//
//  Type.swift
//  CodeStarterCamp_Week3
//
//  Created by Jinyoung Yoo on 2022/03/07.
//

import Foundation

enum Coffee: String {
    case americano, cafeLatte, vanilaLatte, cafeMoca, chocoLatte, greenTeaLatte
}

class Person {
    var money: Int
    let name: String
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }
    func buyStuff(price: Int) -> Bool {
        if money >= price {
            money -= price
            print("\(name): \(price)원 내겠습니다! (\(money)원 남았네...)")
            return true
        } else {
            print("\(name): 어라,, 돈이 없어서 못사네요...")
        }
        return false
    }
}

class CoffeeShop {
    var sales: Int
    var barista: Person?
    let menuBoard: [Coffee: Int]
    let name: String
    
    var pickUpTable: Bool {
        didSet {
            if pickUpTable {
                print("\(name): 주문하신 커피가 완성되어 픽업대에 올려졌습니다!")
            }
        }
    }
    
    init(amerianoPrice: Int, cafeLattePrice: Int, vanilaLattePrice: Int, cafeMocaPrice: Int,
         chocoLattePrice: Int, name: String) {
        sales = 0
        menuBoard = [
            .americano: amerianoPrice,
            .cafeLatte: cafeLattePrice,
            .vanilaLatte: vanilaLattePrice,
            .cafeMoca: cafeMocaPrice,
            .chocoLatte: chocoLattePrice
        ]
        pickUpTable = false
        self.name = name
    }
    
    func takeOrder(coffee: Coffee, customer: Person) {
        let price = menuBoard[coffee] ?? 0
        
        print("""
        \(name): 무엇을 주문하시겠습니까?
        \(customer.name): \(coffee) 하나요!
        """)
        if price != 0 {
            if customer.buyStuff(price: price) {
                print("\(name): \(coffee.rawValue) 주문 받았습니다! (만드는 중...)")
                sales += price
                pickUpTable = true
            } else {
                print("\(name): 다른 커피를 주문해주세요!")
            }
        } else {
            print("\(name): 메뉴에 없는 커피를 주문하셨네요...메뉴판을 잘 봐주세요!")
        }
        if pickUpTable {
            pickUpTable = false
        }
        print("")
    }
}
