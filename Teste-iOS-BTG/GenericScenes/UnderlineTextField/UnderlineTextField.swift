//
//  UnderlineTextField.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 02/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

class UnderlineTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    private func setupLayout() {
        addUnderlineBottom(color: UIColor.lightGray)
    }
}
