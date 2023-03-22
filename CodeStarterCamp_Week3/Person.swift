class Person {
    let name: String
    var money: Int
    var coffeeList: [Coffee] = []
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func orderCoffee(_ coffee: Coffee, from coffeeShop: CoffeeShop) {
        guard let price = coffeeShop.menu[coffee] else {
            print("\(coffeeShop.name)의 메뉴에 \(coffee)가 없습니다.")
            return
        }
        
        if price > self.money {
            print("\(coffeeShop.name)을 구매할 잔액이 \(price - money)원만큼 부족합니다.")
            return
        } else {
            self.money -= price
            coffeeShop.receiveOrder(coffee, by: self.name)
        }

    }
    
    func pickUpCoffee(from coffeeShop: CoffeeShop) {
        if let coffee = coffeeShop.serveCoffee(customerName: self.name) {
            self.coffeeList.append(coffee)
        }
    }
}
