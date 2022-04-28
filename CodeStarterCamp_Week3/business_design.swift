import Foundation

struct Person {
    var money: Int
    func buyCoffee() {}
}

struct CoffeeShop {
    var sales: Int
    var barista: Person
    let menu = ["americano": 3000, "latte": 4000, "cafeMocha": 5000, "iceChoco": 10000]
    
    func pickUpTable() {}
    func takeOrder() {}
    func makeCoffee() {}
}

enum Coffee: String {
    case americano = "아메리카노", latte = "라떼", cafeMocha = "카페모카", iceChoco = "아이스초코"
}
