//
//  CustomImageView.swift
//  BGTestTask
//
//  Created by Alexey Hvesko on 09.05.2021.
//

import UIKit

class CustomImageView: UIImageView {
    
    func downloadImage(url: URL, cache: NSCache<NSString, UIImage>) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self!.image = image
                        cache.setObject(image, forKey: url.absoluteString as NSString)
                    }
                }
            }
        }
    }
    
}
