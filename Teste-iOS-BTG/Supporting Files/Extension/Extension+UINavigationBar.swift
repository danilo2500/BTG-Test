//
//  Extension+UINavigationBar.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 03/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func setGradientBackground(colors: [UIColor]) {
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors)
        
        setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
    }
}
