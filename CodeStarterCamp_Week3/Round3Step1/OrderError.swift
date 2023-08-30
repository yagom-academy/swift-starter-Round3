//
//  OrderResult.swift
//  CodeStarterCamp_Week3
//
//  Created by QL Jeong on 2023/08/29.
//

import Foundation

enum OrderError: Error {
    case isNotOpen
    case isNotInMenu
    case noHaveMoney
}

// MARK: - Public

extension OrderError {
    var message: String {
        switch self {
        case .isNotOpen:
            return "영업 준비중 입니다."
        case .isNotInMenu:
            return "주문 할 수 없는 메뉴 입니다."
        case .noHaveMoney:
            return "잔액이 부족 합니다."
        }
    }
}

