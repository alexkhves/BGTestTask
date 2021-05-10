//
//  CustomView.swift
//  BGTestTask
//
//  Created by Alexey Hvesko on 10.05.2021.
//

import UIKit

class CustomView: UIView {
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        self.layer.masksToBounds = false
    }
    
}
