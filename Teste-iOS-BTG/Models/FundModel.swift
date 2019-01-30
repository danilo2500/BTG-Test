//
//  Funds.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 30/01/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import Foundation

struct FundModel: Codable {
    
    let product: String?
    let categoryDescription: String?
    let profitability: FundProfitability?
    let minimumInitialInvestment: Float?
    let detail: FundDetail?
    let begin: String?
    let netEquity: Double?
    
}

class FundProfitability: Codable {
    
    let month: Double?
    let year: Double?
    let twelveMonths: Double?
    
}

class FundDetail: Codable {
    
    let manager: String?
    let investimentQuota: String?
    
}
