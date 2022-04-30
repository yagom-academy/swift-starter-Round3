import Foundation

struct Person {
    let name: String
    var money: Int
    
    func buyCoffee(_ coffee: Coffee) {
        print("\(name)이(가) \(coffee)를 샀습니다")
    }
}

struct CoffeeShop {
    var sales: Int
    var barista: Person
    var pickUpTable: Coffee?
    let menu: [Coffee: Int] = [.americano: 3000, .latte: 4000, .cafeMocha: 5000, .iceChoco: 10000]

    func takeOrder() {}
    func makeCoffee() {}
}

enum Coffee: String {
    case americano = "아메리카노", latte = "라떼", cafeMocha = "카페모카", iceChoco = "아이스초코"
}
