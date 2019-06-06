//
//  Author+CoreDataClass.swift
//  MicroBloggingApp
//
//  Created by Matthieu PASCAUD on 5/26/19.
//  Copyright © 2019 Matthieu PASCAUD. All rights reserved.
//
//

import Foundation

struct Author: Codable {
    
    let identifier: Int
    let name: String?
    let email: String?
    let username: String?
    let avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case email
        case username = "userName"
        case avatarUrl
    }
  
}
