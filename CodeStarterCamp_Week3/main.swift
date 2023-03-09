struct Person {
    var name: String
    var age: Int
    var height: Double
    var weight: Double
    var mbti: String
    var money: Int
    
    func buyCoffee(at: CoffeeShop, type: Coffee) {
        print("\(type.rawValue) 한 잔 주세요~")
    }
}

struct CoffeeShop {
    var baristaName: Person
    var beanType: BeanType
    var tableNumbers: Int
    var salesAmount: Double
    var menu: [Coffee.RawValue: Int]
    var pickUpTable: [Coffee.RawValue]?
    
    mutating func makeOrderedCoffee(_ type: Coffee) {
        pickUpTable = [type.rawValue]
        print("주문하신 \(type.rawValue) 나왔습니다~")
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case cafeLatte = "카페라떼"
    case cappuccino = "카푸치노"
    case einspanner = "아인슈페너"
}

enum BeanType {
    case arabica
    case robusta
    case liberica
}

var misterLee: Person = Person(name: "미스터리", age: 30, height: 175.5, weight: 70, mbti: "ESFJ", money: 50000)
var missKim: Person = Person(name: "미스킴", age: 35, height: 170, weight: 55, mbti: "INTP", money: 230000)

var yagombucks: CoffeeShop = CoffeeShop(baristaName: misterLee, beanType: .arabica, tableNumbers: 45, salesAmount: 20_000_000, menu: ["아메리카노": 5000, "카페라떼" : 5500, "카푸치노": 5800, "아인슈페너": 6500])

yagombucks.makeOrderedCoffee(Coffee.einspanner)
