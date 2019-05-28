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
    
    let identifier: Int16
    let name: String?
    let email: String?
    let username: String?
    let avatarUrl: URL?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case email
        case username = "userName"
        case avatarUrl
    }
  
}
