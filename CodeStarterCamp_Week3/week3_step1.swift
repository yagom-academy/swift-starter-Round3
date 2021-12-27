enum Gender {
    case male, female
}

struct Person {
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
    
    mutating func doOrder(price: Int) {
        money -= price
    }
}

struct CoffeeShop {
    enum Coffee {
        case espresso, americano, cafe_latte, cappuccino, chocolate_latte
    }
    var menu = [Coffee : Int]()
    var sales: Int = 0
    var pickUpTable: [String]
    var barista: Person
    
    init(barista: Person) {
        menu[Coffee.espresso] = 3000
        menu[Coffee.americano] = 4000
        menu[Coffee.cafe_latte] = 4500
        menu[Coffee.cappuccino] = 4500
        menu[Coffee.chocolate_latte] = 4500
        pickUpTable = []
        self.barista = barista
    }
    
    mutating func getOrderFromSomeone(order: [Coffee], from: Person) -> Int? {
        var totalPrice: Int = 0
        
        for coffee in order {
            if let price = menu[coffee] {
                totalPrice += price
            } else {
                print("메뉴에 없는 커피입니다. 주문을 취소합니다.")
                return nil
            }
        }
        print("주문이 접수되었습니다.")
        sales += totalPrice
        pickUpTable.append(from.name)
        return totalPrice
    }
}
