//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by QL Jeong on 2023/08/29.
//

import Foundation

class CoffeeShop {
    static let NotificationNamePickup = Notification.Name("CoffeeShop.NotificationName.Pickup")

    enum NotificationKey {
        case pickUpNumber
        case pickUpName
        case pickUpCoffee
    }

    struct MenuItem: Hashable {
        var coffee: Coffee
        var price: Int
    }

    private(set) var name: String
    private(set) var barista: Person?
    private(set) var menu = [CoffeeShop.MenuItem]()
    private(set) var salesAmount = 0
    private(set) var pickUpNames = [String]()
    private(set) var pickUpTable = [Coffee]() {
        didSet(value) {
            guard let clientName = getPickUpName(of: pickUpTable.count),
                  let coffee = pickUpTable.last
            else {
                return
            }

            let notification = Notification(name: CoffeeShop.NotificationNamePickup,
                         object: self,
                         userInfo: [
                             CoffeeShop.NotificationKey.pickUpNumber: pickUpTable.count,
                             CoffeeShop.NotificationKey.pickUpName: clientName,
                             CoffeeShop.NotificationKey.pickUpCoffee: coffee
                         ])

            NotificationQueue.default.enqueue(notification, postingStyle: .now)
        }
    }

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

    func getPrice(of coffee: Coffee) -> Int? {
        guard let item = getMenuItem(of: coffee) else {
            return nil
        }

        return item.price
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

        let pickUpNumber = saleMenuItem(of: item, withClient: client.name)

        return .success(pickUpNumber)
    }

    func make(_ coffee: Coffee, from name: String) -> Result<Int, OrderError> {
        if barista == nil {
            return .failure(.isNotOpen)
        }

        guard let item = getMenuItem(of: coffee) else {
            return .failure(.isNotInMenu)
        }

        let pickUpNumber = saleMenuItem(of: item, withClient: name)

        return .success(pickUpNumber)
    }
}

// MARK: - Private

extension CoffeeShop {
    private func getMenuItem(of coffee: Coffee) -> CoffeeShop.MenuItem? {
        return menu.first { $0.coffee == coffee }
    }

    private func addPickUpInformation(of item: CoffeeShop.MenuItem, withClient client: String) -> Int {
        pickUpNames.append(client)
        pickUpTable.append(item.coffee)

        return pickUpTable.count
    }

    private func getPickUpName(of number: Int) -> String? {
        if (1...pickUpNames.count ~= number) == false {
            return nil
        }

        return pickUpNames[number - 1]
    }

    @discardableResult private func saleMenuItem(of item: CoffeeShop.MenuItem, withClient client: String) -> Int {
        let pickUpNumber = addPickUpInformation(of: item, withClient: client)
        salesAmount += item.price

        return pickUpNumber
    }
}

// MARK: - Description

extension CoffeeShop.MenuItem: CustomStringConvertible {
    var description: String {
        return "\(coffee) \(price)원"
    }
}
