//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by QL Jeong on 2023/08/29.
//

import Foundation

class Person {
    enum Gender {
        case male, female, other
    }

    private(set) var name: String
    private(set) var age: Int
    private(set) var gender: Person.Gender
    private(set) var mbti: MBTI
    private(set) var money: Int
    private(set) var pickUpNotification: Notification?

    init(name: String, age: Int, gender: Person.Gender, mbti: MBTI, money: Int) {
        self.name = name
        self.age = age
        self.gender = gender
        self.mbti = mbti
        self.money = money

        NotificationCenter.default.addObserver(forName: CoffeeShop.NotificationNamePickup,
                                               object: nil,
                                               queue: .main) { [weak self] in
            self?.coffeeShopPickupObserver(from: $0 as Notification)
        }
    }
}

// MARK: - Public

extension Person {
    func buyCoffee(_ coffee: Coffee, atShop shop: CoffeeShop) -> String {
        var result = ""
        let orderStatus = shop.requestOrder(coffee: coffee, from: self)
        switch orderStatus {
        case .success(let pickUpNumber):
            result = "\(pickUpNumber)번 손님 주문하신 \(coffee) 나왔습니다."
        case .failure(let error):
            result = error.message
        }

        return result
    }

    func increaseMoney(_ amount: Int) {
        money += amount
    }

    func requestPayment(_ amount: Int) -> Bool {
        if money < amount {
            return false
        }

        money -= amount
        return true
    }

    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) -> String {
        guard let price = coffeeShop.getPrice(of: coffee) else {
            return "주문 할 수 없는 메뉴 입니다."
        }

        if money < price {
            return "잔액이 \(price - money)원만큼 부족합니다."
        }

        var result = ""
        let orderStatus = coffeeShop.make(coffee, from: name)
        switch orderStatus {
        case .success(let pickUpNumber):
            _ = requestPayment(price)
            result = getPickUpMessage(of: pickUpNumber)
        case .failure(let error):
            result = error.message
        }

        return result
    }
}

// MARK: - Observer

extension Person {
    private func coffeeShopPickupObserver(from notification: Notification) {
        if notification.name != CoffeeShop.NotificationNamePickup {
            return
        }
        self.pickUpNotification = notification
    }
}

// MARK: - Private

extension Person {
    private func getPickUpMessage(of pickUpNumber: Int) -> String {
        guard let number = pickUpNotification?.userInfo?[CoffeeShop.NotificationKey.pickUpNumber] as? Int,
              let name = pickUpNotification?.userInfo?[CoffeeShop.NotificationKey.pickUpName] as? String,
              let coffee = pickUpNotification?.userInfo?[CoffeeShop.NotificationKey.pickUpCoffee] as? Coffee
        else {
            return "수신된 데이터가 없습니다."
        }

        self.pickUpNotification = nil
        if number != pickUpNumber {
            return "잘못된 픽업 번호 입니다."
        }

        return "\(name) 님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요."
    }
}

// MARK: - Description

extension Person.Gender: CustomStringConvertible {
    var description: String {
        switch self {
        case .male:
            return "남성"
        case .female:
            return "여성"
        case .other:
            return "기타"
        }
    }
}
