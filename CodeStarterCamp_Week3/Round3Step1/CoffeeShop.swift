//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by QL Jeong on 2023/08/29.
//

import Foundation

class CoffeeShop {
    struct MenuItem: Hashable {
        var coffee: Coffee
        var price: Int
    }

    private(set) var name: String
    private(set) var barista: Person?
    private(set) var menu = [CoffeeShop.MenuItem]()
    private(set) var pickUpTable = [Coffee]()
    private(set) var salesAmount = 0

    init(name: String, barista: Person? = nil, menu: [CoffeeShop.MenuItem] = []) {
        self.name = name
        self.barista = barista
        self.menu = menu
    }
}

// MARK: - Public

extension CoffeeShop {
    func setBarista(_ barista: Person) {
        self.barista = barista
    }

    func setMenu(_ items: [CoffeeShop.MenuItem]) {
        self.menu = items
    }

    func getMenuItem(of coffee: Coffee) -> CoffeeShop.MenuItem? {
        return menu.first { $0.coffee == coffee }
    }

    func requestOrder(coffee: Coffee, from client: Person) -> Result<Int, OrderError> {
        if barista == nil {
            return .failure(.isNotOpen)
        }

        guard let item = getMenuItem(of: coffee) else {
            return .failure(.isNotInMenu)
        }

        if client.requestPayment(item.price) == false {
            return .failure(.noHaveMoney)
        }

        let pickUpNumber = saleMenuItem(of: item)

        return .success(pickUpNumber)
    }

    func saleMenuItem(of item: CoffeeShop.MenuItem) -> Int {
        let pickUpNumber = processOrder(of: item)
        salesAmount += item.price

        return pickUpNumber
    }
}

// MARK: - Private

extension CoffeeShop {
    private func processOrder(of item: CoffeeShop.MenuItem) -> Int {
        pickUpTable.append(item.coffee)

        return pickUpTable.count
    }
}

// MARK: - Description

extension CoffeeShop.MenuItem: CustomStringConvertible {
    var description: String {
        return "\(coffee) \(price)원"
    }
}
