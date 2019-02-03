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
            let risks: [RiskModel]
            let filters: [FilterType]
        }
    }
    
    class Response {
        var risks: [RiskModel: Bool] = [:] 
        var category: String?
        var minimumApplication: Double?
        var rescue: Int?
        var manager: String?
        var orderBy: OrderByType?
    }
}
