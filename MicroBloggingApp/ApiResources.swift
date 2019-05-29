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
    let baseUrl = "https://sym-json-server.herokuapp.com"
    var methodPath: String { get }
    func makeModel(data:Data) -> Model
}

extension ApiResource {
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: baseUrl)!
        components.path = methodPath
        return components
    }
    
    var url: URL {
        return urlComponents.url!
    }
}

struct AuthorsResource: ApiResource {
    
    let methodPath = "/authors"
    
    func makeModel(data: Data) -> [Author]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        guard let authors: [Author] = try? decoder.decode([Author].self, from: data) else {
            return nil
        }
        return authors
    }
}
