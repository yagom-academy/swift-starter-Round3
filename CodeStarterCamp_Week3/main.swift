//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    let age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func personInformation() {
        print("안녕하세요 저는\(self.name)입니다. 저는 \(self.age)살 입니다.")
    }
    func buyCoffe() {
        print("\(self.money)원으로 커피를 구매하였습니다.")
    }
}

struct CoffeeShop {
    var sales: Int?
    var pickUpTable: Bool? = false
    var barista: Person?
    var coffeMenu: Dictionary<String, Int> = ["아메리카노": 4000, "에스프레소": 2500, "바닐라라떼": 4500, "복숭아스무디": 5000, "아인슈패너": 5000, "카페라떼": 4500, "딸기스무디": 5000, "시그니쳐초콜릿": 6000]
    
    func getOrder() {
        print("어떤 커피를 드릴까요?")
    }
    func makeCoffe() {
        print("커피를 만들고 있습니다. 잠시만 기다려 주세요.")
    }
}

enum Coffee:String {
    case 아메리카노, 에스프레소, 바닐라라떼, 복숭아스무디, 아인슈패너, 카페라떼, 딸기스무디, 시그니쳐초콜릿
}

let misterLee: Person = Person(name: "misterLee", age: 25, money: 25000)
let missKim: Person = Person(name: "missKim", age: 24, money: 20000)
let yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)

misterLee.personInformation()
missKim.personInformation()
missKim.buyCoffe()
yagombucks.getOrder()
yagombucks.makeCoffe()
