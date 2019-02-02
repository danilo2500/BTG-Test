//
//  Extension+UIView.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 31/01/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
}
