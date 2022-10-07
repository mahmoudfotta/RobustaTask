//
//  Owner.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 06/10/2022.
//

import Foundation

struct Owner: Decodable {
    var avatarURL: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
    }
}

