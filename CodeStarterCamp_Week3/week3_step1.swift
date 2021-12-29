struct Person {
    enum Gender {
        case male, female
    }
    var name: String
    var gender: Gender
    var money: Int = 0
    
    init(name: String, gender: Gender) {
        self.name = name
        self.gender = gender
    }
    
    init(name: String, gender: Gender, money: Int) {
        self.init(name: name, gender: gender)
        self.money = money
    }

    mutating func orderCoffeeFromShop(coffee: CoffeeShop.Coffee, from: CoffeeShop) {
        if let price = from.menu[coffee] {
            money -= price
        }
    }
}

struct CoffeeShop {
    enum Coffee:Int {
        case espresso
        case americano
        case cafeLatte
        case cappuccino
        case chocolateLatte
    }
    
    var menu = [Coffee: Int]()
    var sales: Int = 0
    var pickUpTable: Coffee?
    var barista: Person
    
    init(prices: [Int], barista: Person) {
        menu[.espresso] = prices[0]
        menu[.americano] = prices[1]
        menu[.cafeLatte] = prices[2]
        menu[.cappuccino] = prices[3]
        menu[.chocolateLatte] = prices[4]
        self.barista = barista
    }

    mutating func getOrder(coffee: Coffee){
        if let price = menu[coffee] {
            sales += price
            pickUpTable = coffee
        }
    }
}
