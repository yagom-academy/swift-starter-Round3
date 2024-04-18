import Foundation


class Person {
    var name: String
    var money: Int = 100000
    
    init(name: String){
        self.name = name
    }
    func buyCoffee() {
        print("커피살래요")
    }
    
}

enum CoffeeType {
    case americano
    case latte
    case capuccino
    case frappuccino
}
struct CoffeeShop {
    var sales: Int = 100000000
    var menuTable: [CoffeeType : Int] = [.americano : 4500, .capuccino : 5500, .frappuccino : 6000, .latte : 5500]
    var pickUpTable: [String] = []
    var barista: String
    mutating func makeCoffee(menu: String) {
        pickUpTable.append(menu)
    }
}


var misterLee: Person = Person(name: "misterLee")
var missKim: Person = Person(name: "missKim")
var yagombucks: CoffeeShop

yagombucks = CoffeeShop(barista: misterLee.name)

