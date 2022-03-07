//
//  Type.swift
//  CodeStarterCamp_Week3
//
//  Created by Jinyoung Yoo on 2022/03/07.
//

import Foundation

enum Coffee: String {
    case americano, cafeLatte, vanilaLatte, cafeMoca, chocoLatte
}

struct Person {
    var money: Int
    
    mutating func buyStuff(price: Int) {
        if money >= price {
            print("\(price)를 내고 구매하였습니다!")
            money -= price
        } else {
            print("열심히 일해서 돈을 더 법시다!")
        }
    }
}

class CoffeeShop {
    var sales: Int
    var barista: Person!
    let menuBoard: [Coffee: Int]
    var pickUpTable: Bool {
        didSet {
            if pickUpTable {
                print("주문하신 커피가 완성되어 픽업대에 올려졌습니다!")
            }
        }
    }
    
    init(amerianoPrice: Int, cafeLattePrice: Int, vanilaLattePrice: Int, cafeMocaPrice: Int,
         chocoLattePrice: Int) {
        sales = 0
        menuBoard = [
            .americano: amerianoPrice,
            .cafeLatte: cafeLattePrice,
            .vanilaLatte: vanilaLattePrice,
            .cafeMoca: cafeMocaPrice,
            .chocoLatte: chocoLattePrice
        ]
        pickUpTable = false
    }
    
    func takeOrder(coffee: Coffee) {
        let price = menuBoard[coffee] ?? 0
        
        if price != 0 {
            print("\(coffee.rawValue)을 주문 받았습니다!")
            sales += price
            pickUpTable = true
        } else {
            print("메뉴에 없는 커피를 주문하셨네요...메뉴판을 잘 봐주세요!")
        }
        if pickUpTable {
            pickUpTable = false
        }
    }
}
