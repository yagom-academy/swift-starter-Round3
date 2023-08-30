//
//  MBTI.swift
//  CodeStarterCamp_Week3
//
//  Created by QL Jeong on 2023/08/29.
//

import Foundation

enum MBTI {
    case INFJ, INFP, INTJ, INTP
    case ISFJ, ISFP, ISTJ, ISTP
    case ENFJ, ENFP, ENTJ, ENTP
    case ESFJ, ESFP, ESTJ, ESTP
}

// MARK: - Description

extension MBTI: CustomStringConvertible {
    var description: String {
        switch self {
        case .INFJ:
            return "INFJ" // 내향적, 직관적, 감정적, 판단적
        case .INFP:
            return "INFP" // 내향적, 직관적, 감정적, 인식적
        case .INTJ:
            return "INTJ" // 내향적, 직관적, 사고적, 판단적
        case .INTP:
            return "INTP" // 내향적, 직관적, 사고적, 인식적
        case .ISFJ:
            return "ISFJ" // 내향적, 감각적, 감정적, 판단적
        case .ISFP:
            return "ISFP" // 내향적, 감각적, 감정적, 인식적
        case .ISTJ:
            return "ISTJ" // 내향적, 감각적, 사고적, 판단적
        case .ISTP:
            return "ISTP" // 내향적, 감각적, 사고적, 인식적
        case .ENFJ:
            return "ENFJ" // 외향적, 직관적, 감정적, 판단적
        case .ENFP:
            return "ENFP" // 외향적, 직관적, 감정적, 인식적
        case .ENTJ:
            return "ENTJ" // 외향적, 직관적, 사고적, 판단적
        case .ENTP:
            return "ENTP" // 외향적, 직관적, 사고적, 인식적
        case .ESFJ:
            return "ESFJ" // 외향적, 감각적, 감정적, 판단적
        case .ESFP:
            return "ESFP" // 외향적, 감각적, 감정적, 인식적
        case .ESTJ:
            return "ESTJ" // 외향적, 감각적, 사고적, 판단적
        case .ESTP:
            return "ESTP" // 외향적, 감각적, 사고적, 인식적
        }
    }
}
