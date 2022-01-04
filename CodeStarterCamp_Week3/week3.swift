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

    mutating func buySomething(price: Int) {
        money -= price
    }
}

class CoffeeShop {
    enum Coffee {
        case espresso, americano, cafeLatte, cappuccino, chocolateLatte
    }
    
    var menu = [Coffee: Int]()
    var sales: Int = 0
    var barista: Person
    var pickUpTable: Coffee? {
        didSet {
            print("커피가 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    
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

    func order(coffee: Coffee, forWho: Person) {
        if let price = menu[coffee] {
            if forWho.money >= price {
                forWho.buySomething(price: price)
                sales += price
                print("\(forWho) 님의 ", terminator: "")
                pickUpTable = coffee
            }
        }
    }
}

