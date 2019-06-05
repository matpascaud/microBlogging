//
//  ApiResources.swift
//  MicroBloggingApp
//
//  Created by Matthieu PASCAUD on 5/26/19.
//  Copyright © 2019 Matthieu PASCAUD. All rights reserved.
//

import Foundation

protocol ApiResource {
    associatedtype Model:Decodable
    var baseUrl: String { get }
    var methodPath: String { get }
    var query: String? { get set }
    func makeModel(data:Data) -> Model
}

extension ApiResource {
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: baseUrl)!
        components.path = methodPath
        components.query = query
        return components
    }
    
    var url: URL {
        return urlComponents.url!
    }
}

extension JSONDecoder.DateDecodingStrategy {
    static let iso8601withFractionalSeconds = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        guard let date = Formatter.iso8601.date(from: string) else {
            throw DecodingError.dataCorruptedError(in: container,
                                                   debugDescription: "Invalid date: " + string)
        }
        return date
    }
}

struct AuthorsResource: ApiResource {
    var query: String?
    let baseUrl = "https://sym-json-server.herokuapp.com"
    let methodPath = "/authors"
    
    func makeModel(data: Data) -> [Author]? {
        let decoder = JSONDecoder()
        guard let authors: [Author] = try? decoder.decode([Author].self, from: data) else {
            return nil
        }
        return authors
    }
}

struct PostsResource: ApiResource {
    var query: String?
    let baseUrl = "https://sym-json-server.herokuapp.com"
    let methodPath = "/posts"
    
    func makeModel(data: Data) -> [Post]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601withFractionalSeconds
        guard let posts: [Post] = try? decoder.decode([Post].self, from: data) else {
            return nil
        }
        return posts
    }
}

struct CommentsResource: ApiResource {
    var query: String?
    let baseUrl = "https://sym-json-server.herokuapp.com"
    let methodPath = "/comments"
    
    func makeModel(data: Data) -> [Comment]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601withFractionalSeconds
        guard let comments: [Comment] = try? decoder.decode([Comment].self, from: data) else {
            return nil
        }
        return comments
    }
}
