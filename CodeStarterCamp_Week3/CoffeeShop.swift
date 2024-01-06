//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 고혜지 on 1/6/24.
//

import Foundation

final class CoffeeShop {
  let name: String
  let barista: Employee
  let menu: [Coffee: UInt]
  private(set) var sales: UInt = 0
  private(set) var pickUpTable: [(name: String, coffee: Coffee)] = [] {
    didSet {
      guard let newItem = pickUpTable.last else { return }
      print("\(newItem.name)님이 주문하신 \(newItem.coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
  }
  
  init(name: String, barista: Employee, menu: [Coffee: UInt] = [:]) {
    self.name = name
    self.barista = barista
    self.menu = Coffee.allCases.reduce(into: [:]) { (result, item) in
      result[item] = menu[item] ?? item.defaultPrice
    }
    print("\(name)(이/가) 문을 열었고, 바리스타 \(barista.name)(이/가) 출근했습니다.")
  }
  
  deinit {
    print("\(name)(이/가) 문을 닫았고, 바리스타 \(barista.name)(이/가) 퇴근했습니다.")
    print("\(name)의 오늘 매출액은 \(sales)원 입니다.")
    barista.earnMoney(sales)
  }
  
  struct OrderResult {
    var isSuccess: Bool
    var remainingBalance: UInt = 0
    var shortfallAmount: UInt = 0
  }
  
  func takeOrder(_ item: Coffee, from name: String, balance: UInt) throws -> OrderResult {
    guard let price = menu[item] else { throw CoffeeShopError.priceNotFoundInMenu }
    guard balance >= price else { return OrderResult(isSuccess: false, shortfallAmount: price - balance) }
    sales += price
    pickUpTable.append((name, item))
    return OrderResult(isSuccess: true, remainingBalance: balance - price)
  }
  
  func getCoffeeFromPickupTable(by name: String) throws -> Coffee {
    guard let location = pickUpTable.firstIndex(where: { $0.name == name }) else {
      throw CoffeeShopError.coffeeNotFoundAtPickUpTable
    }
    return pickUpTable.remove(at: location).coffee
  }
}

enum Coffee: String, CaseIterable {
  case espresso = "에스프레소"
  case americano = "아메리카노"
  case caffeLatte = "카페라떼"
  case cappuccino = "카푸치노"
  case caffeMocha = "카페모카"
  
  var defaultPrice: UInt {
    switch self {
    case .americano: 4_500
    case .espresso: 4_500
    case .caffeLatte: 5_000
    case .cappuccino: 5_000
    case .caffeMocha: 5_500
    }
  }
}

enum CoffeeShopError: Error {
  case priceNotFoundInMenu
  case coffeeNotFoundAtPickUpTable
}

extension CoffeeShopError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .priceNotFoundInMenu:
      return "메뉴의 가격을 찾을 수 없습니다."
    case .coffeeNotFoundAtPickUpTable:
      return "픽업대에서 커피를 찾을 수 없습니다."
    }
  }
}
