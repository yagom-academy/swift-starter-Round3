//
//  File.swift
//  CodeStarterCamp_Week3
//
//  Created by 이정민 on 2022/04/27.
//

class CoffeeShop {
    private(set) var owner: String
    private(set) var location: String
    private(set) var sales: Int = 0
    private(set) var menu: [Coffee: Int] = [:]
    private var pickUpTable: Coffee?
    var barista: Person
    
    init(owner: String, location: String, barista: Person) {
        self.owner = owner
        self.location = location
        self.barista = barista
    }
    
    func add(menu: [Coffee: Int]) {
        self.menu = self.menu.merging(menu, uniquingKeysWith: { $1 })
    }
    
    func order(_ coffee: Coffee, by person: Person) {
        if let coffeePrice = self.menu[coffee] {
            if coffeePrice > person.money {
                print("잔액이 \(coffeePrice)원만큼 부족합니다.")
            } else {
                sales += coffeePrice
                person.money -= coffeePrice
                make(coffee: coffee, by: person)
            }
        }
    }
    
    private func make(coffee: Coffee, by person: Person) {
        var servingComment = "\(person.name) 님의 커피가 준비되었습니다."
        putOnTable(coffee: coffee)
        
        servingComment += pickUpTable != nil ? " 픽업대에서 가져가주세요." : ""
        print(servingComment)
    }
    
    private func putOnTable(coffee: Coffee){
        pickUpTable = coffee
    }
}
