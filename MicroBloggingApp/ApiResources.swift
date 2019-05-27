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
    //var baseUrl: String { get }
    var methodPath: String { get }
    func makeModel(data:Data) -> Model
}

extension ApiResource {
    /*
    var urlComponents: URLComponents {
        var components = URLComponents(string: baseUrl)!
        components.path = methodPath
        return components
    }
    */
    var url: URL {
        let baseUrl = "https://sym-json-server.herokuapp.com"
        let url = baseUrl + methodPath
        return URL(string: url)!
    }
}

struct AuthorsResource: ApiResource {
    //var baseUrl = "https://sym-json-server.herokuapp.com"
    
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
