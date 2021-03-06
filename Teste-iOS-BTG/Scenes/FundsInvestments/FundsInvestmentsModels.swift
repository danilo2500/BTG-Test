//
//  FundsInvestmentsModels.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 30/01/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

enum FundsInvestments {
    
    enum FetchFunds {
        struct Request {
            var product: String? = nil
            var filter: FilterInvestmentsModels.Response? = nil
        }
        
        struct Response {
            let funds: [FundModel]?
            let error: Bool
            let message: String?
        }
        
        struct ViewModel {
            
            struct DisplayViewModel {
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
                let riskLevel: RiskModel?
                var isShowingDetail: Bool
            }
            
            var displayFunds: [DisplayViewModel] = []
        }
    }
}
