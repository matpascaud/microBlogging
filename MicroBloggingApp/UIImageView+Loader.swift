//
//  File.swift
//  MicroBloggingApp
//
//  Created by Matthieu PASCAUD on 5/29/19.
//  Copyright © 2019 Matthieu PASCAUD. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func downloadImageFrom(link:String, contentMode: UIView.ContentMode, superview: UITableViewCell?) {
        let url = URL(string:link)!
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            self.contentMode =  contentMode
            self.image = cachedImage
            superview?.setNeedsLayout()
        }
        else {
            URLSession.shared.dataTask(with: url) { (data, response, error) -> Void in
                DispatchQueue.main.async {
                    self.contentMode =  contentMode
                    if let data = data {
                        let image = UIImage(data: data)
                        self.image = image
                        imageCache.setObject(image!, forKey: url.absoluteString as NSString)
                        superview?.setNeedsLayout()
                    }
                }
                }.resume()
        }
    }
}
