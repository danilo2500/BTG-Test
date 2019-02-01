//
//  ExpandableHeaderViewModels.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 31/01/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

class ExpandableHeaderViewModels {
    
    struct Fund {
        
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {
            let product: String
            let categoryDescription: String
            let monthProfitability: String
            let yearProfitability: String
            let twelveMonthsProfitability: String
            let minimumInitialInvestment: String
            let manager: String
            let begin: String
            let netEquity: String
            let investimentQuota: String
            let riskColor: UIColor?
            var isShowingDetail: Bool
        }
    }
}
