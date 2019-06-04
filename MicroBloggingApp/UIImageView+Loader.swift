//
//  File.swift
//  MicroBloggingApp
//
//  Created by Matthieu PASCAUD on 5/29/19.
//  Copyright © 2019 Matthieu PASCAUD. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadImageFrom(link:String, contentMode: UIView.ContentMode) {
        URLSession.shared.dataTask(with: URL(string:link)!) { (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) }
            }
        }.resume()
    }
}
