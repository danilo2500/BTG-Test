//
//  OptionCellModels.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 02/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

class OptionCellModels {
    
    struct OptionCell {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {
            static let height: CGFloat = 65
            static let reuseIdentifier = "OptionCell"
        }
    }
    
    struct Option {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {
            let filterType: FilterType
        }
    }
}
