//
//  Formatter.swift
//  MicroBloggingApp
//
//  Created by Matthieu Pascaud on 05/06/2019.
//  Copyright © 2019 Matthieu PASCAUD. All rights reserved.
//

import Foundation

extension Formatter {
    static let iso8601: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
    static let iso8601noFS = ISO8601DateFormatter()
}
