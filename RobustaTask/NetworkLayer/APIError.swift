//
//  APIError.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 06/10/2022.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case invalidData
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .requestFailed, .invalidData:
            return ErrorMessages.Default.RequestFailed
        }
    }
}

extension APIError {
    struct ErrorMessages {
        struct Default {
            static let RequestFailed = "Resquest failed. Please, try again later."
        }
    }
}
