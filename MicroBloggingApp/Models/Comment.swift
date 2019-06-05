//
//  Comment.swift
//  MicroBloggingApp
//
//  Created by Matthieu Pascaud on 05/06/2019.
//  Copyright © 2019 Matthieu PASCAUD. All rights reserved.
//

import Foundation

struct Comment: Codable {
    let identifier: Int16
    let date: String?
    let userName: String?
    let body: String?
    let avatarUrl: String?
    let postId: Int16?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case date
        case userName
        case body
        case avatarUrl
        case postId
    }
}