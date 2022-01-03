struct Person {
    enum Gender {
        case male, female
    }
    var name: String
    var gender: Gender
    var money: Int
    
    init(name: String, gender: Gender, money: Int = 0) {
        self.name = name
        self.gender = gender
        self.money = money
    }

    mutating func orderCoffeeFromShop(coffee: CoffeeShop.Coffee, from: CoffeeShop) {
        if let price = from.menu[coffee] {
            if price <= money {
                money -= price
                from.order(coffee: coffee)
                print("\(name) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요")
            } else {
                print("잔액이 \(price - money)원만큼 부족합니다.")
            }
        }
    }
}

class CoffeeShop {
    enum Coffee {
        case espresso, americano, cafeLatte, cappuccino, chocolateLatte
    }
    
    var menu = [Coffee: Int]()
    var sales: Int = 0
    var pickUpTable: Coffee?
    var barista: Person
    
    init(barista: Person) {
        self.barista = barista
        howMuchIsEachCoffee()
    }

    func howMuchIsEachCoffee() {
        menu[.espresso] = 1000
        menu[.americano] = 2000
        menu[.cafeLatte] = 3000
        menu[.cappuccino] = 4000
        menu[.chocolateLatte] = 5000
    }

    func order(coffee: Coffee){
        if let price = menu[coffee] {
            sales += price
            pickUpTable = coffee
        }
    }
}

