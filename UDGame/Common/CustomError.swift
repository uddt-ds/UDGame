//
//  CustomError.swift
//  UDGame
//
//  Created by Lee on 7/20/25.
//

import Foundation

enum CustomError: Error {
    case inputError

    var title: String {
        switch self {
        case .inputError: return "잘못된 입력입니다"
        }
    }
}
