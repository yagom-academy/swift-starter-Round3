//
//  Coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by QL Jeong on 2023/08/29.
//

import Foundation

struct Coffee: Hashable {
    enum Name {
        case espresso, americano, caffeLatte, mocha, irish
    }

    enum Size {
        case short, tall, grande, venti, trenta
    }

    var name: Self.Name
    var size: Self.Size
    var isHot = true
}

// MARK: - Description

extension Coffee: CustomStringConvertible {
    var description: String {
        return isHot ? "\(name) \(size)" : "아이스 \(name) \(size)"
    }
}

extension Coffee.Name: CustomStringConvertible {
    var description: String {
        switch self {
        case .espresso:
            return "에스프레소"
        case .americano:
            return "아메리카노"
        case .caffeLatte:
            return "카페라떼"
        case .mocha:
            return "모카"
        case .irish:
            return "아이리쉬"
        }
    }
}

extension Coffee.Size: CustomStringConvertible {
    var description: String {
        switch self {
        case .short:
            return "Short"
        case .tall:
            return "Tall"
        case .grande:
            return "Grande"
        case .venti:
            return "Venti"
        case .trenta:
            return "Trenta"
        }
    }
}
