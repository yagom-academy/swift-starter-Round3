//
//  Coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by 김예림 on 2023/06/05.
//

import Foundation

/// Description  - CustomStringConvertible 프로토콜 채택 : 사용자 정의에 따른 텍스트 출력
enum Coffee: CustomStringConvertible {
    case americano
    case caffeLatte
    case espresso
    
    var description: String {
        switch self {
        case .americano:
            return "아메리카노"
        case .caffeLatte:
            return "카페라떼"
        case .espresso:
            return "에스프레소"
        }
    }
    
    var price: Int {
        switch self {
        case .americano:
            return 5000
        case .caffeLatte:
            return 5500
        case .espresso:
            return 4500
        }
    }
}
