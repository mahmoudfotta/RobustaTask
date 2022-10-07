//
//  Repository.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 06/10/2022.
//

import Foundation

struct Repository: Decodable {
    var name: String?
    var fullName: String?
    var description: String?
    var owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case name, description, owner
        case fullName = "full_name"
    }
}
