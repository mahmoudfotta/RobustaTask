//
//  URLRequest+Extensions.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 06/10/2022.
//

import Foundation

extension URLRequest {
    mutating func setJSONContentType() {
        setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    }
}
