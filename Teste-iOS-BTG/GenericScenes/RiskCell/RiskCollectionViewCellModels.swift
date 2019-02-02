//
//  RiskCellModels.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 02/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

class RiskCollectionViewCellModels {
    
    struct RiskCell {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {
            static let height = 80
            static let width = 80
            static let reuseIdentifier = "RiskCollectionViewCell"
        }
    }
    
    struct Risk {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {
            let color: UIColor
            let title: String
        }
    }
}
