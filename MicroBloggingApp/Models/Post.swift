//
//  Post.swift
//  MicroBloggingApp
//
//  Created by Matthieu Pascaud on 29/05/2019.
//  Copyright © 2019 Matthieu PASCAUD. All rights reserved.
//

import Foundation

struct Post: Codable {
    let identifier: Int16
    let date: String?
    let title: String?
    let body: String?
    let imageUrl: String?
    let authorId: Int16?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case date
        case title
        case body
        case imageUrl
        case authorId
    }
}
