//
//  RepositoriesListProvider.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 06/10/2022.
//

import Foundation

enum RepositoriesListProvider {
    case getRepositoriesList
}

extension RepositoriesListProvider: Endpoint {
    var base: String {
        return "https://api.github.com"
    }
    
    var path: String {
        return "/repositories"
    }
    
    var params: [String : Any]? {
        return nil
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameterEncoding: ParameterEnconding {
        return .defaultEncoding
    }
    
    var method: HTTPMethod {
        return .get
    }
}
