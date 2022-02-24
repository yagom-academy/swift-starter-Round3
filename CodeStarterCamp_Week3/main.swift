import Foundation

enum Coffee {
    case Americano
    case Latte
    case cappuccino
    case coldBrew
}

class Person {
    var money: Int
    var feeling: String
    
    func buyThings(coffee: Coffee) {
        print("안녕하세요. \(coffee) 한 잔 주시겠어요?")
    }
    init(money: Int, feeling: String) {
        self.money = money
        self.feeling = feeling
    }
}
