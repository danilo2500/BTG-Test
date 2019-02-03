//
//  CheckBox.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 02/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

protocol CheckBoxDelegate: class {
    func valueDidChange(value: Bool)
}

class CheckBox: UIButton {

    var isChecked: Bool = true {
        didSet{
            updateCheckBoxImage()
        }
    }
    weak var delegate: CheckBoxDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    private func setupLayout() {
        addBorder(width: 1, color: UIColor.btg_blue)
        cornerRadius = 5
        tintColor = .white
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isChecked.toggle()
        delegate?.valueDidChange(value: isChecked)
    }
    
    private func updateCheckBoxImage() {
        if isChecked {
            setImage(UIImage(named: "check"), for: .normal)
            backgroundColor = UIColor.btg_blue
        } else {
            setImage(nil, for: .normal)
            backgroundColor = .clear
        }
    }
    
}


