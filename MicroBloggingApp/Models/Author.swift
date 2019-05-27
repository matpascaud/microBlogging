//
//  Author+CoreDataClass.swift
//  MicroBloggingApp
//
//  Created by Matthieu PASCAUD on 5/26/19.
//  Copyright © 2019 Matthieu PASCAUD. All rights reserved.
//
//

import Foundation
import CoreData

class Author: NSManagedObject, Codable {

    @NSManaged public var identifier: Int16
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var username: String?
    @NSManaged public var avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case email
        case username = "userName"
        case avatarUrl
        case address
    }
    
    required convenience init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext!] as? NSManagedObjectContext else { fatalError() }
        guard let entity = NSEntityDescription.entity(forEntityName: "Author", in: context) else { fatalError() }
        
        self.init(entity: entity, insertInto: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.identifier = try container.decodeIfPresent(Int16.self, forKey: .identifier) ?? 0
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.username = try container.decodeIfPresent(String.self, forKey: .username)
        self.avatarUrl = try container.decodeIfPresent(String.self, forKey: .avatarUrl)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(identifier, forKey: .identifier)
        try container.encode(name, forKey: .name)
        try container.encode(email, forKey: .email)
        try container.encode(username, forKey: .username)
        try container.encode(avatarUrl, forKey: .avatarUrl)
    }
}
