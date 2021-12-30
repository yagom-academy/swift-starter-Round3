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
            money -= price
        }
    }
}

struct CoffeeShop {
    enum Coffee: CaseIterable {
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

    mutating func howMuchIsEachCoffee() {
        for coffee in Coffee.allCases {
            print("\(coffee)의 가격: ", terminator: "")
            menu[coffee] = Int(readLine()!)!
        }
    }

    mutating func getOrder(coffee: Coffee){
        if let price = menu[coffee] {
            sales += price
            pickUpTable = coffee
        }
    }
}
