//
//  UImageView+Cache.swift
//  RobustaTask
//
//  Created by Mahmoud Abolfotoh on 07/10/2022.
//

import UIKit

extension UIImageView {
    
    static var dictionaryImageCache = [String: UIImage]()
    private static let session: URLSession = {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .returnCacheDataElseLoad
        return URLSession(configuration: config)
    }()
    
    func load(_ url: URL) {
        if (Self.dictionaryImageCache[url.path] != nil) {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.image = Self.dictionaryImageCache[url.path]
            }
            return
        }
        
        let task = Self.session.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self else { return }
            if let data = data {
                if let image = UIImage(data: data) {
                    Self.dictionaryImageCache[url.path] = image
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
        task.resume()
    }
}
