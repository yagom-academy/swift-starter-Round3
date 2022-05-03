import Foundation

class CoffeeShop {
    var sales: Int = 0
    var coffeeMenuWithPrice: [CoffeeMenu: Int]
    var barista: Person?
    var pickUpTable: (IceOrHot, CoffeeMenu, Size)? {
        didSet {
            if let menu = pickUpTable {
                print("missKim 님의 \(menu.0.orderIceOrHot) \(menu.1.coffeeMenuInKorean) \(menu.2.orderBySize)사이즈가 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        }
    }

    init(coffeeMenuWithPrice: [CoffeeMenu: Int], barista: Person) {
        self.coffeeMenuWithPrice = coffeeMenuWithPrice
        self.barista = barista
    }

    init(coffeeMenuWithPrice: [CoffeeMenu: Int]) {
        self.coffeeMenuWithPrice = coffeeMenuWithPrice
    }

    func order(menu: CoffeeMenu, size: Size, iceOrHot: IceOrHot, quantity: Int, customer: Person) {
        var price: Int = 0
        if let defaultPrice = coffeeMenuWithPrice[menu] {
            price = (defaultPrice + size.priceBySize + iceOrHot.priceByIceOrHot) * quantity
        }
        if customer.money < price {
            print("잔액이 \(price)만큼 부족합니다. ")
        } else {
            pickUpTable = (iceOrHot, menu, size)
            sales += price
            customer.money -= price
        }
    }

    func makeCoffee(menu coffee: CoffeeMenu) {
        print("맛있게 \(coffee.coffeeMenuInKorean)를 만들어 보겠습니다!")
    }
}
