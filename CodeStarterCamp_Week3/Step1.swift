//
//  Step1.swift
//  CodeStarterCamp_Week3
//
//  Created by karen on 2023/03/13.
//

let misterLee = Person(money: 1000, name: "미스터 뤼~")
var missKim = Person(money: 9000, name: "미스 김")
var yagomMenu: Dictionary<Coffee, Int> = [
    .moca: 5000,
    .iceMoca: 5500,
    .americano: 3000,
    .iceAmericano: 3500,
    .caramel: 4500,
    .iceCaramel: 5000,
    .espresso: 2500,
    .cappuccino: 4000,
    .hazelnut: 4000,
    .latte: 4000,
    .iceLatte: 4500
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

struct Person {
    var money: Int
    var name: String
    mutating func purchaseCoffee(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        if let selectedCoffee = yagomMenu[coffee] {
            if(money < selectedCoffee) {
                print("잔액이 \(selectedCoffee - money)원만큼 부족합니다.")
                print("\(self)")
            } else {
                money = money - selectedCoffee
                yagombucks.takeOnOrder(coffee, to: self)
            }
        }
    }
    
}

struct CoffeeShop {
    var totalSales: Int
    var barista: Person
    var menu: Dictionary<Coffee, Int>
    var pickUpTable: Array<Coffee> = Array<Coffee>()
    
    mutating func takeOnOrder(_ coffee: Coffee, to orderer: Person) {
        print("\(orderer.name)님에게 \(coffee.rawValue) 주문받았습니다.")
        if let priceOfCoffee = yagomMenu[coffee] {
            totalSales = totalSales + priceOfCoffee
            createCoffee(coffee, for: orderer.name)
        } else {
            print("죄송합니다. 찾으시는 메뉴가 없습니다. 메뉴판을 확인해 주세요!")
        }
    }
    
    mutating func createCoffee(_ coffee: Coffee, for name: String) {
        pickUpTable.append(coffee)
        print("\(name)님이 주문하신 \(coffee.rawValue) 준비되었습니다. 픽업대에서 가져가 주세요.")
    }

}


