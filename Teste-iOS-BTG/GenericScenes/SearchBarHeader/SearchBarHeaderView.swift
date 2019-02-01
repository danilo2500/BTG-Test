//
//  SearchBarHeaderView.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 01/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

class SearchBarHeaderView: UITableViewHeaderFooterView {
 
    @IBOutlet weak var searchBar: UISearchBar!
    
    weak var delegate: UISearchBarDelegate? {
        didSet{
            didSetDelegate()
        }
    }
    
    private func didSetDelegate() {
        searchBar.delegate = delegate
    }
    
}

