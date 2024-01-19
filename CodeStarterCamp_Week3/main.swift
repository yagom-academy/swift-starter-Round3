//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//Person
class Person: Hashable{
    var name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    // Hashable 프로토콜을 준수하기 위해 == 연산자를 구현합니다.
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }

    // hash(into:) 메서드를 구현하여 객체를 고유하게 식별할 수 있는 방법을 제공합니다.
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    // 주문하기
    func orderMenu(shop: inout CoffeeShop, menu: Coffee) {
        guard let price = shop.menu[menu], price < money else {
            shop.rejectOrder()
            complain()
            return
        }
        
        money -= price
        shop.makeCoffee(customer: self, order: menu)
        getMyOrder(shop: shop)
        thank(shop: shop)
    }
    
    // 불평하기
    func complain() {
        print("아니 뭐 이리 비싼 가게가 있어요!(버럭) 저 갈거예요 퉤퉤퉤")
    }
    
    // 물건 받기
    func getMyOrder(shop: CoffeeShop) {
        guard var table = shop.pickUpTable else {return}
        
        table = table.filter{$0.keys.first != self}
        shop.pickUpTable = table
        
        print("\(self)가 물건을 가지고 감)")
    }
    
    // 감사하기
    func thank(shop: CoffeeShop) {
        print("아주 가성비가 좋고 맛있네요~ 감사합니다^^")
    }

    
}

//CoffeeShop
class CoffeeShop {
    var earning: Int
    var menu: [Coffee : Int]
    var pickUpTable: [[Person : Coffee]]?
    var barista: Person?
    
    init(earning: Int, menu: [Coffee : Int]) {
        self.earning = earning
        self.menu = menu
    }
    
    func makeCoffee(customer: Person, order: Coffee) {
        print("메뉴를 준비 중입니다")
        earning += menu[order] ?? 0
        pickUpTable?.append([customer : order])
        print("메뉴가 모두 준비되었어요. 픽업대에서 메뉴를 픽업해주세요!")
    }
    
    func rejectOrder() {
        print("손님 돈이 부족하십니다")
    }
    
}


//Coffee
enum Coffee{
    case americon
    case latte
    case tea
}



//make misterLee , missKim
let misterLee: Person = Person(name: "이러바오", money: 10000)
let missKim: Person = Person(name: "김아이바오", money: 10000)

// yagombucks 창업

var yagombucks: CoffeeShop = CoffeeShop(earning: 0, menu: [.americon: 5000, .latte: 6000, .tea: 70000])

//barista 고용
yagombucks.barista = misterLee


// 주문
missKim.orderMenu(shop: &yagombucks, menu: .latte)

print(yagombucks.earning)
print(missKim.money)


