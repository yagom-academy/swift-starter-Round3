struct Person {
    var name: String
    var age: Int
    var mbti: String
    var money: Int
    
    mutating func orderCoffee(_ coffee: Coffee, at coffeeShop: CoffeeShop) {
        if let price = coffeeShop.menu[coffee] {
            if money < price {
                print("잔액이 \(price - money)원만큼 부족합니다.")
            } else {
                money -= price
                coffeeShop.makeOrderedCoffee(coffee, for: name)
            }
        } else {
            print("존재하지 않는 메뉴입니다.")
        }
    }
}

class CoffeeShop {
    var baristaName: String
    var beanType: BeanType
    var tableNumbers: Int
    var salesAmount: Int = 0
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee] = []
    
    init(baristaName: String, beanType: BeanType, tableNumbers: Int, menu: [Coffee : Int]) {
        self.baristaName = baristaName
        self.beanType = beanType
        self.tableNumbers = tableNumbers
        self.menu = menu
    }   
    
    func makeOrderedCoffee(_ coffee: Coffee, for name: String) {
        pickUpTable = [coffee]
        salesAmount += menu[coffee] ?? 0
        print("\(name)님이 주문하신 \(coffee.rawValue)가(이) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case cafeLatte = "카페라떼"
    case cappuccino = "카푸치노"
    case einspanner = "아인슈페너"
}

enum BeanType {
    case arabica, robusta, liberica
}

var missKim: Person = Person(name: "missKim", age: 35, mbti: "INTP", money: 100_000)
var yagombucks: CoffeeShop = CoffeeShop(baristaName: "misterLee", beanType: .arabica, tableNumbers: 45,
                                        menu: [.americano: 5000, .cafeLatte : 5500, .cappuccino: 5800, .einspanner: 6500])

missKim.orderCoffee(.cappuccino, at: yagombucks)
