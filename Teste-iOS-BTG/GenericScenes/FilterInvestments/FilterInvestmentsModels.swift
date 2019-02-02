//
//  FilterInvestmentsModels.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 02/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import Foundation

class FilterInvestmentsModels {
    
    struct Components {
        struct Request {}
        
        struct Response {
            var filterTypes: [FilterType]
        }
        
        struct ViewModel {
            struct RiskOption {
                let risk: RiskModel
                var isChecked: Bool
            }
            
            struct FilterOption {
                let filterType: FilterType
                let placeholder: String
            }
            
            let riskOptions: [RiskOption]
            let filterOptions: [FilterOption]
        }
    }
}
