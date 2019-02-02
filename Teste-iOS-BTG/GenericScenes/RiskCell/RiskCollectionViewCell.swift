//
//  RiskCellView.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 02/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit
import M13Checkbox

class RiskCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var checkbox: M13Checkbox!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCheckBox()
    }
    
    private func setupCheckBox() {
        checkbox.boxType = .square
        
    }
    
}
