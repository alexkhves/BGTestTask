//
//  CustomTextView.swift
//  BGTestTask
//
//  Created by Alexey Hvesko on 10.05.2021.
//

import UIKit

class CustomTextView: UITextView {
    
    func hyperLink(title: String, urlString: String) {
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.link, value: urlString, range: NSRange(location: 0, length: attributedString.length))
        
        self.attributedText = attributedString
    }
    
}
