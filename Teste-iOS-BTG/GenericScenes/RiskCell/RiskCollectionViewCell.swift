//
//  RiskCellView.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 02/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

protocol RiskCollectionViewCellDelegate: class {
    func didChoose(value: Bool, _ cell: RiskCollectionViewCell)
}

class RiskCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var checkBox: CheckBox!
    @IBOutlet weak var riskLabel: UILabel!
    @IBOutlet weak var riskLine: UIView!
    
    weak var delegate: RiskCollectionViewCellDelegate?
    
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkBox.delegate = self
    }
    
}

extension RiskCollectionViewCell: CheckBoxDelegate {
    func valueDidChange(value: Bool) {
        delegate?.didChoose(value: value, self)
    }
    
}
