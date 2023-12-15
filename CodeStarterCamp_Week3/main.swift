//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by Nat Kim on 2023/12/07.
//

import Foundation

// Step1
enum Coffee: String {
    case americano
    case latte
    case vanila
    case coldbrew
}


struct Person {
    var name: String
    var money: Int = 0
    var receipt: Int = 0
    var orderMenus: [Coffee]
    
    
    init(name: String, money:Int, orderMenus: [Coffee]) {
        self.name = name
        self.money = money
        self.orderMenus = orderMenus
    }
    
    mutating func orderCoffee(from shop: inout CoffeeShop) {
        for orderMenu in orderMenus {
            shop.sellCoffee(customer: self, orderMenus: orderMenu)

            if let price = shop.menu[orderMenu], money >= price {
                money -= price
            }
        }
    }
    
    func getMyOrder() {
        
    }
    
}


struct CoffeeShop {
    var shopName: String
    var sales: Int
    var menu: [Coffee: Int]
    var barista: Person?
    var customers: [Person]
    

    var pickUpTable: [String] = []
    
    init(shopName: String, sales: Int, menu: [Coffee : Int], barista: Person? = nil, customers: [Person], pickUpTable: [String]) {
        self.shopName = shopName
        self.sales = sales
        self.menu = menu
        self.barista = barista
        self.customers = customers
        self.pickUpTable = pickUpTable
    }

    mutating func sellCoffee(customer: Person, orderMenus: Coffee) {
        guard let price = menu[orderMenus] else {
            print("주문이 올바르지 않습니다.")
            return
        }
        if customer.money >= price {
            orderNotification(type: orderMenus)
        } else {
            print("돈이 부족합니다.")
        }
    }
    
    mutating func orderNotification(type: Coffee) {
        pickUpTable.append(type.rawValue)
        print("\(type)이(가) 준비되었습니다.")
    }
}

let misterLee = Person(name: "misterLee", money: 20000, orderMenus: [.vanila])
let missKim = Person(name: "missKim", money: 15000, orderMenus: [.coldbrew, .latte])
var yagomBucks = CoffeeShop(
    shopName: "yagomBucks",
    sales: 0,
    menu: [.americano: 2500,
           .latte: 3500,
           .vanila: 4500,
           .coldbrew: 5000,
    ],
    barista: misterLee,
    customers: [misterLee, missKim],
    pickUpTable: []
)

print(misterLee)
print(missKim)
print(yagomBucks)
