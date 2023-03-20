class Person {
    var name: String
    var money: Int
    var coffeeList: [Coffee]
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
        self.coffeeList = []
    }
    
    func orderCoffee(_ coffee: Coffee, _ coffeeShop: CoffeeShop) {
        if coffeeShop.menu[coffee] != nil {
            print("\(coffeeShop.name)의 메뉴에 \(coffee)가 없습니다.")
            return
        }
        
        self.money -= coffeeShop.receiveCoffeeOrder(coffee, by: self.name)
    }
    
    func pickUpCoffee(_ coffeShop: CoffeeShop) {
        guard let coffee = coffeShop.pickUpTable[self.name] else {
            print("아직 커피 제조 중입니다. 조금만 기다려주세요.")
            return
        }
        
        self.coffeeList.append(coffee)
    }
}

class CoffeeShop {
    var name: String
    var revenue: Int
    var menu: [Coffee: Int]
    var pickUpTable: [String:Coffee]
    var barista: [Person]
    
    init(name: String, menu: [Coffee:Int], barista: [Person]) {
        self.name = name
        self.revenue = 0
        self.menu = menu
        self.pickUpTable = [:]
        self.barista = barista
    }
    
    func receiveCoffeeOrder(_ coffee: Coffee, by customerName: String) -> Int {
        guard let price = self.menu[coffee] else {
            print("잘못된 주문입니다.")
            return 0
        }
        
        print("\(customerName)님이 \(coffee)를 주문했습니다.")
        self.revenue += price
        
        return price
    }
    
    func makeCoffe(_ coffee: Coffee, for customerName: String) {
        print("\(customerName)님이 주문한 \(coffee) 제조가 완료되었습니다.")
        self.pickUpTable[customerName] = coffee
    }
}

enum Coffee: String {
    case americano = "americano"
    case caffeLatte = "caffeLatte"
    case cappucino = "cappucino"
    case caffeMocha = "caffeMocha"
    case macchiato = "macchiato"
}
