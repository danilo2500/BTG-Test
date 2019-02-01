//
//  ExpandableHeaderViewController.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 31/01/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

protocol ExpandableHeaderDelegate: class {
    func didPressExpandButton(_ cell: UITableViewCell)
}

class ExpandableHeaderViewController: UITableViewCell {
    
    @IBOutlet weak var expandableDetailView: UIView!
    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var collapseButton: UIButton!
    
    @IBOutlet weak var riskView: UIView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var twelveMonthsLabel: UILabel!
    @IBOutlet weak var minimumInitialInvestmentLabel: UILabel!
    @IBOutlet weak var investmentQuotaLabel: UILabel!
    @IBOutlet weak var monthProfitabilityLabel: UILabel!
    @IBOutlet weak var yearProfitabilityLabel: UILabel!
    @IBOutlet weak var beginLabel: UILabel!
    @IBOutlet weak var netEquityLabel: UILabel!

    weak var delegate: ExpandableHeaderDelegate?
    
    static let openedCellHeight: CGFloat = 349.5
    static let closedCellHeight: CGFloat = 180
    
    var viewModel: ExpandableHeaderViewModels.Fund.ViewModel? {
        didSet {
            didSetViewModel()
        }
    }
    
    func didSetViewModel() {
        guard let viewModel = viewModel else { return }
        
        productLabel.text = viewModel.product
        categoryLabel.text = viewModel.categoryDescription
        twelveMonthsLabel.text = viewModel.twelveMonthsProfitability
        minimumInitialInvestmentLabel.text = viewModel.minimumInitialInvestment
        investmentQuotaLabel.text = viewModel.investimentQuota
        monthProfitabilityLabel.text = viewModel.monthProfitability
        yearProfitabilityLabel.text = viewModel.yearProfitability
        beginLabel.text = viewModel.begin
        netEquityLabel.text = viewModel.netEquity
        riskView.backgroundColor = viewModel.riskColor ?? UIColor.clear
        if viewModel.isShowingDetail {
            showExpandableDetail()
        } else {
            hideExpandableDetail()
        }
    }
    
    @IBAction func didPressExpandButton(_ sender: Any) {
        showExpandableDetail()
        setNeedsLayout()
        delegate?.didPressExpandButton(self)
    }
    
    @IBAction func didPressCollapseButton(_ sender: Any) {
        hideExpandableDetail()
        setNeedsLayout()
        delegate?.didPressExpandButton(self)
    }
    
    func hideExpandableDetail() {
        expandButton.isHidden = false
        collapseButton.isHidden = true
        expandableDetailView.isHidden = true
    }
    
    func showExpandableDetail() {
        expandButton.isHidden = true
        collapseButton.isHidden = false
        expandableDetailView.isHidden = false
    }
    
}
