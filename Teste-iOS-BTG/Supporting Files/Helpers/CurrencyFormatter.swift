//
//  CurrencyFormatter.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 30/01/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import Foundation

class CurrencyFormatter {
    
    static func formatNumberToReal(value: NSNumber) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt-BR")
        formatter.numberStyle = .currency
        return formatter.string(from: value)
    }
}
