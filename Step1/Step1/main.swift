//
//  main.swift
//  Step1
//
//  Created by 이진 on 2023/03/14.
//

import Foundation

class Person {
    var money: Int
    init(money: Int) {
        self.money = money
    }

    func buyCoffee() {
        print("커피를 구매합니다")
    }
}

class CoffeeShop {
    var sales: Int
    var barista: Person
    let menuTable: Dictionary<String, Int> = ["americano" : 2000, "cappuccino" : 3000, "caffeLatte" : 4000]
    var pickUpTable: Array<String> = Array<String>()
    init(sales: Int, barista: Person) {
        self.sales = sales
        self.barista = barista
    }
    
    func orderCoffee(menu: Coffee) {
        pickUpTable.append(menu.rawValue)
        print("\(pickUpTable[0])를 주문합니다.")
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case cappuccino = "카푸치노"
    case caffeLatte = "카페라떼"
}

let misterLee = Person(money: 500000)
let missKim = Person(money: 1000000)

misterLee.buyCoffee()   // Person이 커피를 구매하는 메서드 시연

let yagombucks = CoffeeShop(sales: 10000000, barista: misterLee)

yagombucks.orderCoffee(menu: .americano)    // 메뉴를 주문받고 커피를 만들어 pickUpTable에 할당하는 메서드 시연

print(yagombucks.barista.money) // 야곰벅스의 바리스타(미스터 리)의 돈 출력
