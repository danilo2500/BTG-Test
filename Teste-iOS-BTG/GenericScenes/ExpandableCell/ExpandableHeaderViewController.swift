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
    
    weak var delegate: ExpandableHeaderDelegate?
    
    var detailIsHidden = true
    static let openedCellHeight: CGFloat = 299.5
    static let closedCellHeight: CGFloat = 130
    
    @IBAction func expandButton(_ sender: Any) {
        
        if detailIsHidden {
            showExpandableDetail()
        } else {
            hideExpandableDetail()
        }
        setNeedsLayout()
        delegate?.didPressExpandButton(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        hideExpandableDetail()
    }
    
    func hideExpandableDetail() {
        detailIsHidden = true
        expandableDetailView.isHidden = true
    }
    
    func showExpandableDetail() {
        detailIsHidden = false
        expandableDetailView.isHidden = false
    }
    
}
