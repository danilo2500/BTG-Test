//
//  RiskCellView.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 02/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

class RiskCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var checkBox: CheckBox!
    @IBOutlet weak var riskLabel: UILabel!
    @IBOutlet weak var riskLine: UIView!
    
    var viewModel: RiskCollectionViewCellModels.Risk.ViewModel? {
        didSet{
            didSetViewModel()
        }
    }
    
    func didSetViewModel() {
        guard let viewModel = viewModel else { return }
        riskLine.backgroundColor = viewModel.color
        riskLabel.text = viewModel.title.uppercased()
    }
    
}
