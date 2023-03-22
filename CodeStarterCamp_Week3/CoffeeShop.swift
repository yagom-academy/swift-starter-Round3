class CoffeeShop {
    let name: String
    var revenue: Int = 0
    var menu: [Coffee : Int]
    var pickUpTable: [String : Coffee] = [:]
    var barista: [Person]
    
    init(name: String, menu: [Coffee : Int], barista: [Person]) {
        self.name = name
        self.menu = menu
        self.barista = barista
    }
    
    func receiveOrder(_ coffee: Coffee, by customerName: String) {
        guard let price = self.menu[coffee] else {
            print("잘못된 주문입니다.")
            return
        }
        
        print("\(customerName)님이 \(coffee)를 주문했습니다.")
        self.revenue += price
        
        makeCoffee(coffee, for: customerName)
    }
    
    func makeCoffee(_ coffee: Coffee, for customerName: String) {
        print("\(customerName)님이 주문한 \(coffee) 제조가 완료되었습니다.")
        
        self.pickUpTable[customerName] = coffee
        print("픽업대에서 가져가주세요.")
    }
    
    func serveCoffee(customerName: String) -> Coffee? {
        guard let coffee = pickUpTable.removeValue(forKey: customerName) else {
            print("아직 커피 제조 중입니다. 조금만 기다려주세요.")
            return nil
        }
        
        print("\(customerName)님이 주문한 \(coffee)를 픽업해갔습니다!")
        
        return coffee
    }
}
