//
//  Extension+UINavigationBar.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 03/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func setGradientBackground() {
        let colorOne = UIColor(named: "gradientOne")!
        let colorTwo = UIColor(named: "gradientTwo")!
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: [colorOne, colorTwo])
        
        setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
    }
}
