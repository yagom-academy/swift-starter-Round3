//
//  OrderResult.swift
//  CodeStarterCamp_Week3
//
//  Created by QL Jeong on 2023/08/29.
//

import Foundation

enum OrderResult: Error {
    case finished(Int, String)
    case isNotOpen
    case isNotInMenu
    case noHaveMoney
}

// MARK: - Description

extension OrderResult: LocalizedError {
    var errorDescription: String? {
        switch self {
        case let .finished(number, item):
            return "\(number)번 손님 주문하신 \(item) 나왔습니다."
        case .isNotOpen:
            return "영업 준비중 입니다."
        case .isNotInMenu:
            return "주문 할 수 없는 메뉴 입니다."
        case .noHaveMoney:
            return "잔액이 부족 합니다."
        }
    }
}

