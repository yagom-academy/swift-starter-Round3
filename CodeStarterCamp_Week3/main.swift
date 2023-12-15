//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by csp.
//  Copyright © csp academy. All rights reserved.
//

enum Coffee {
    case americano
    case espresso
    case latte
    case cappuccino
    case caramelMacchiato
}

class Person {
    enum Job {
        case customer, barista, boss
    }
    
    var nickName: String
    var job: Job?
    
    var money: Int = 0
    
    convenience init(nickName: String, job: Job, money: Int) {
        self.init(nickName: nickName, job: job)
        self.money = money
    }
    
    convenience init(nickName: String, job: Job) {
        self.init(nickName: nickName)
        self.job = job
    }
    
    init(nickName: String) {
        self.nickName = nickName
    }
    
    func buyCoffees(_ coffees: [Coffee: Bool], at coffeeShop: CoffeShop) {
        for (coffee, isHot) in coffees {
            buyCoffee(coffee, isHot: isHot, at: coffeeShop)
        }
    }
    
    func buyCoffee(_ coffee: Coffee, isHot: Bool, at coffeeShop: CoffeShop){
        guard let coffeePrice = coffeeShop.menu[coffee] else {
            print("메뉴판에 없는 음료를 주문하셨네요. 메뉴를 다시 확인해 주시겠어여?")
            return
        }
        
        if money >= coffeePrice {
            print("\(nickName)이(가) \(coffee)를 주문합니다.")
            
            money -= coffeePrice
            print("잔액 : \(money)")
            coffeeShop.order([coffee: isHot], price: coffeePrice)
        } else {
            print("잔액이 부족합니다.")
        }
    }
}

class CoffeShop {
    var shopName: String
    var barista: Person!
    
    var totalRevenue: Int = 0
    var menu: [Coffee: Int]
    
    var pickUpTable: [Coffee] = []
    
    init(shopName: String, menu: [Coffee: Int]) {
        self.shopName = shopName
        self.menu = menu
    }
    
    func order(_ orderMenu: [Coffee: Bool], price: Int) {
        for (coffee, isHot) in orderMenu {
            makeCoffee(coffee, isHot: isHot)
            totalRevenue += price
            print("\(shopName) 매출액: \(totalRevenue)")
        }
    }
    
    func makeCoffee(_ coffee: Coffee, isHot: Bool) {
        let coffeeIs: String = isHot ? "뜨거운" : "아이스"
        print("\(shopName)에서 바리스타 \(barista.nickName)(이)가 \(coffeeIs) \(coffee)를(을) 만들었습니다.")
        
        pickUpTable.append(coffee)
    }
}


let misterLee: Person = Person(nickName: "misterLee", job: Person.Job.barista)
let missKim: Person = Person(nickName: "missKim", job: Person.Job.customer, money: 10000)


let menu: [Coffee: Int] = [
    .americano: 1500,
    .espresso: 1500,
    .latte: 2000,
    .cappuccino: 2500,
    .caramelMacchiato: 3000
]
let yagombucks: CoffeShop = CoffeShop(shopName: "yagombucks", menu: menu)
yagombucks.barista = misterLee
