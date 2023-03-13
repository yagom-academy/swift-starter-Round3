//
//  Step1.swift
//  CodeStarterCamp_Week3
//
//  Created by karen on 2023/03/13.
//

let misterLee = Person(money: 1000, name: "미스터 뤼~")
let missKim = Person(money: 10000, name: "미스 김")
var yagomMenu: Dictionary<Coffee, Int> = [
    Coffee.moca: 5000,
    Coffee.iceMoca: 5500,
    Coffee.americano: 3000,
    Coffee.iceAmericano: 3500,
    Coffee.caramel: 4500,
    Coffee.iceCaramel: 5000,
    Coffee.espresso: 2500,
    Coffee.cappuccino: 4000,
    Coffee.hazelnut: 4000,
    Coffee.latte: 4000,
    Coffee.iceLatte: 4500
]
var yagombucks = CoffeeShop(totalSales:0, barista: misterLee, menu: yagomMenu, pickUpTable: [])


enum Coffee: String {
    case moca = "카페 모카", iceMoca = "아이스 카페모카"
    case americano = "아메리카노", iceAmericano = "아이스 아메리카노"
    case caramel = "카라멜 마끼야또", iceCaramel = "아이스 카라멜 마끼야또"
    case espresso = "에스프레소"
    case cappuccino = "카푸치노"
    case hazelnut = "헤이즐넛"
    case latte = "카페 라떼", iceLatte = "아이스 카페 라떼"
}

class Person {
    var money: Int
    var name: String
    func purchaseCoffee(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        coffeeShop.takeOnOrder(coffee, to: self)
    }
    
    init (money: Int, name: String) {
      self.money = money
      self.name = name
    }
    
}

class CoffeeShop {
    var totalSales: Int
    var barista: Person
    var menu: Dictionary<Coffee, Int>
    var pickUpTable: Array<Coffee> = Array<Coffee>()
    
    func takeOnOrder(_ coffee: Coffee, to orderer: Person) {
        print("\(orderer.name)님에게 \(coffee.rawValue) 주문받았습니다.")
        if let priceOfCoffee = yagomMenu[coffee] {
            print("\(coffee.rawValue)의 금액은 \(priceOfCoffee)입니다.")
            if(orderer.money < priceOfCoffee) {
                print("잔액이 \(priceOfCoffee - orderer.money)원만큼 부족합니다.")
            } else {
                orderer.money = orderer.money - priceOfCoffee
                totalSales = totalSales + priceOfCoffee
                print("고객님의 돈은 : \(orderer.money)원이고, 카페총매출액은 : \(self.totalSales)")
                createCoffee(coffee, for: orderer.name)
            }
        } else {
            print("죄송합니다. 찾으시는 메뉴가 없습니다. 메뉴판을 확인해 주세요!")
        }
    }
    
    func createCoffee(_ coffee: Coffee, for name: String) {
        pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee.rawValue) 준비되었습니다. 픽업대에서 가져가 주세요.")
    }
    
    init(totalSales: Int, barista: Person, menu: Dictionary<Coffee, Int>, pickUpTable: Array<Coffee>) {
        self.totalSales = totalSales
        self.barista = barista
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
}


