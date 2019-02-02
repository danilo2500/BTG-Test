//
//  OptionCell.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 02/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

class OptionCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UnderlineTextField!
    
    var viewModel: OptionCellModels.Option.ViewModel? {
        didSet{
            didSetViewModel()
        }
    }
    
    private func didSetViewModel() {
        guard let viewModel = viewModel else { return }
        
        titleLabel.text = viewModel.title.uppercased()
        textField.placeholder = viewModel.placeholder
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    func setupLayout() {
        
    }
    
}
