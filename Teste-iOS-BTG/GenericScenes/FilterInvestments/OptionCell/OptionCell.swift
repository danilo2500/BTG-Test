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
        
        var placeholder: String!
        switch viewModel.filterType {
        case .category:
            placeholder = "Todos(as)"
            textField.keyboardType = .asciiCapable
        case .minimumApplication:
            placeholder = "Todos(as)"
            textField.keyboardType = .decimalPad
        case .rescue:
            placeholder = "Todos(as)"
            textField.keyboardType = .numberPad
        case .manager:
            placeholder = "Todos(as)"
            textField.keyboardType = .asciiCapable
        case .orderBy(let types):
            placeholder = "Nenhum"
        default: break
        }
        textField.placeholder = placeholder
        titleLabel.text = viewModel.filterType.description.uppercased()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    func setupLayout() {
        
    }
    
}
