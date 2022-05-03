import Foundation

class Person {
    let name: String
    let age: Int
    var money: Int

    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }

    func buyCoffee(menu: CoffeeMenu, size: Size, iceOrHot: IceOrHot) {
        print("안녕하세요~ \(iceOrHot.orderIceOrHot)\(menu.coffeeMenuInKorean), \(size.orderBySize)사이즈로 주문하겠습니다!")
    }
}

class CoffeeShop {
    var sales: Int = 0
    var coffeeMenuWithPrice: [CoffeeMenu: Int]
    var barista: Person
    var pickUpTable: CoffeeMenu? {
        didSet {
            if let menu = pickUpTable {
                print("주문하신 \(menu.coffeeMenuInKorean) 픽업테이블 위에 있습니다~")
            }
        }
    }

    init(coffeeMenuWithPrice: [CoffeeMenu: Int], barista: Person) {
        self.coffeeMenuWithPrice = coffeeMenuWithPrice
        self.barista = barista
    }

    func order(menu: CoffeeMenu, size: Size, iceOrHot: IceOrHot, quantity: Int) {
        var price: Int = 0
        if let defaultPrice = coffeeMenuWithPrice[menu] {
            price = (defaultPrice + size.priceBySize + iceOrHot.priceByIceOrHot) * quantity
        }
        print("감사합니다 주문하신 음료 총 가격은 \(price)원 입니다~")
    }

    func makeCoffee(menu coffee: CoffeeMenu) {
        print("맛있게 \(coffee.coffeeMenuInKorean)를 만들어 보겠습니다!")
    }
}

enum CoffeeMenu {
    case americano
    case capouccino
    case latte

    var coffeeMenuInKorean: String {
        get {
            switch self {
            case .americano:
                return "아메리카노"
            case .capouccino:
                return "카푸치노"
            case .latte:
                return "라떼"
            }
        }
    }
}

enum Size {
    case small
    case medium
    case large

    var orderBySize: String {
        get {
            switch self {
            case .small:
                return "스몰"
            case .medium:
                return "미디엄"
            case .large:
                return "라지"
            }
        }
    }

    var priceBySize: Int {
        get {
            switch self {
            case .small:
                return 0
            case .medium:
                return 500
            case .large:
                return 1000
            }
        }
    }
}

enum IceOrHot {
    case ice
    case hot

    var orderIceOrHot: String {
        get {
            switch self {
            case .ice:
                return "아이스"
            case .hot:
                return "핫"
            }
        }
    }

    var priceByIceOrHot: Int {
        get {
            switch self {
            case .ice:
                return 300
            case .hot:
                return 0
            }
        }
    }
}

let misterLee = Person(name: "Lee", age: 26, money: 10000)
let missKim = Person(name: "Kim", age: 31, money: 15000)
let yagombucks = CoffeeShop(coffeeMenuWithPrice: [.americano: 4500, .capouccino: 4800, .latte: 5000], barista: misterLee)
