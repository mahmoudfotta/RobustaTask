//
//  Endpoint.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 06/10/2022.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var params: [String: Any]? { get }
    var headers: [String: String]? { get }
    var parameterEncoding: ParameterEnconding { get }
    var method: HTTPMethod { get }
}

extension Endpoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        var queryItems: [URLQueryItem] = []
        switch parameterEncoding {
        case .defaultEncoding:
            if let params = params, method == .get {
                queryItems.append(contentsOf: params.map {
                    return URLQueryItem(name: "\($0)", value: "\($1)")
                })
            }
        case .jsonEncoding:
            break
        }
        components.queryItems = queryItems
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(key, forHTTPHeaderField: value)
            }
        }
        
        guard let params = params, method != .get else { return request }
        
        switch parameterEncoding {
        case .defaultEncoding:
            request.httpBody = params.percentEscaped().data(using: .utf8)
        case .jsonEncoding:
            request.setJSONContentType()
            let jsonData = try? JSONSerialization.data(withJSONObject: params)
            request.httpBody = jsonData
        }
        return request
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum ParameterEnconding {
    case defaultEncoding
    case jsonEncoding
}
