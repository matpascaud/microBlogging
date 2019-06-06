//
//  Comment.swift
//  MicroBloggingApp
//
//  Created by Matthieu Pascaud on 05/06/2019.
//  Copyright © 2019 Matthieu PASCAUD. All rights reserved.
//

import Foundation

struct Comment: Codable {
    let identifier: Int
    let date: Date?
    let body: String?
    let userName: String?
    let email: String?
    let avatarUrl: String?
    let postId: Int?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case date
        case body
        case userName
        case email
        case avatarUrl
        case postId
    }
}
