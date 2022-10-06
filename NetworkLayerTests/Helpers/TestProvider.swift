//
//  TestProvider.swift
//  NetworkLayerTests
//
//  Created by Mahmoud Abolfotoh on 06/10/2022.
//

import Foundation
@testable import RobustaTask

enum TestProvider {
    case first
    case second
}

extension TestProvider: Endpoint {
    var base: String {
        return "https://api.github.com"
    }
    
    var path: String {
        switch self {
        case .first:
            return "/first"
        case .second:
            return "/second"
        }
    }
    
    var params: [String : Any]? {
        switch self {
        case .first:
            return nil
        case .second:
            return ["page":"1"]
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameterEncoding: ParameterEnconding {
        switch self {
        case .first:
            return ParameterEnconding.defaultEncoding
        case .second:
            return ParameterEnconding.jsonEncoding
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .first:
            return .get
        case .second:
            return .post
        }
    }
    
    
    
}
