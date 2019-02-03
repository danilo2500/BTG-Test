//
//  OptionCell.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 02/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit
import AMTextFieldPickerExtension

protocol OptionCellDelegate: class {
    func didChoose(response: Any, forType type: FilterType)
}

class OptionCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UnderlineTextField!
    
    let pickerView = UIPickerView()
    
    weak var delegate: OptionCellDelegate?
    
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
            textField.pickerView = nil
        case .minimumApplication:
            placeholder = "Todos(as)"
            textField.keyboardType = .decimalPad
            textField.pickerView = nil
        case .rescue:
            placeholder = "Todos(as)"
            textField.keyboardType = .numberPad
            textField.pickerView = nil
        case .manager:
            placeholder = "Todos(as)"
            textField.keyboardType = .asciiCapable
            textField.pickerView = nil
        case .orderBy:
            placeholder = "Nenhum"
            textField.pickerView = pickerView
        default: break
        }
        textField.placeholder = placeholder
        textField.text = ""
        titleLabel.text = viewModel.filterType.description.uppercased()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupPickerView()
        textField.delegate = self
    }
    
    func setupPickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
}

extension OptionCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let viewModel = viewModel,
            let response = textField.text,
            !response.isEmpty else { return }
        
        switch viewModel.filterType {
        case .category:
            delegate?.didChoose(response: response, forType: viewModel.filterType)
        case .minimumApplication:
            delegate?.didChoose(response: Double(response)!, forType: viewModel.filterType)
        case .rescue:
            delegate?.didChoose(response: Int(response)!, forType: viewModel.filterType)
        case .manager:
            delegate?.didChoose(response: response, forType: viewModel.filterType)
        default: break
        }
    }
}

extension OptionCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        
        switch viewModel.filterType {
        case .orderBy(let types):
            return types.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        guard let viewModel = viewModel else { return nil }
        
        switch viewModel.filterType {
        case .orderBy(let types):
            return NSAttributedString(string: types[row].description)
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let viewModel = viewModel else { return }
        
        switch viewModel.filterType {
        case .orderBy(let types):
            textField.text = types[row].description
            delegate?.didChoose(response: types[row], forType: viewModel.filterType)
        default: break
        }
    }
}
