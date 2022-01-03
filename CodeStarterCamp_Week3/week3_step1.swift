//struct Person {
//    enum Gender {
//        case male, female
//    }
//    var name: String
//    var gender: Gender
//    var money: Int
//
//    init(name: String, gender: Gender, money: Int = 0) {
//        self.name = name
//        self.gender = gender
//        self.money = money
//    }
//
//    mutating func orderCoffeeFromShop(coffee: CoffeeShop.Coffee, from: CoffeeShop) {
//        if let price = from.menu[coffee] {
//            money -= price
//        }
//    }
//}
//
//struct CoffeeShop {
//    enum Coffee {
//        case espresso, americano, cafeLatte, cappuccino, chocolateLatte
//    }
//
//    var menu = [Coffee: Int]()
//    var sales: Int = 0
//    var pickUpTable: Coffee?
//    var barista: Person
//
//    init(barista: Person) {
//        self.barista = barista
//        howMuchIsEachCoffee()
//    }
//
//    mutating func howMuchIsEachCoffee() {
//        menu[.espresso] = 1000
//        menu[.americano] = 2000
//        menu[.cafeLatte] = 3000
//        menu[.cappuccino] = 4000
//        menu[.chocolateLatte] = 5000
//    }
//
//    mutating func order(coffee: Coffee){
//        if let price = menu[coffee] {
//            sales += price
//            pickUpTable = coffee
//        }
//    }
//}
