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
    let baseUrl = Constants.baseUrl
    let methodPath = Constants.authorsPath
    
    func makeModel(data: Data) -> [Author]? {
        var authors: [Author]?
        do {
            let decoder = JSONDecoder()
            authors = try decoder.decode([Author].self, from: data)
            Storage.store(authors!, to: .documents, as: "authors.txt")
        } catch let error {
            print(error)
        }
        return authors
    }
}

struct PostsResource: ApiResource {
    var query: String?
    let baseUrl = Constants.baseUrl
    let methodPath = Constants.postsPath
    
    func makeModel(data: Data) -> [Post]? {
        var posts: [Post]?
        do {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601withFractionalSeconds
        posts = try decoder.decode([Post].self, from: data)
        
        } catch let error {
            print(error)
        }
        return posts
    }
}

struct CommentsResource: ApiResource {
    var query: String?
    let baseUrl = Constants.baseUrl
    let methodPath = Constants.commentsPath
    
    func makeModel(data: Data) -> [Comment]? {
        var comments: [Comment]?
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601withFractionalSeconds
            comments = try decoder.decode([Comment].self, from: data)
        } catch let error {
            print(error)
        }
        return comments
    }
}
