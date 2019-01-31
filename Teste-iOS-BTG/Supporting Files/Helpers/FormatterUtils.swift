//
//  DateUtils.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 30/01/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import Foundation

class FormatterUtils {
    
    static func formatDate(dateString: String? ) -> String? {
        guard let dateString = dateString else { return nil }
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
    
    static func formatNumberToReal(value: Double?) -> String? {
        guard let value = value else { return nil }
        
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt-BR")
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: value))
    }
    
    static func formatPercentage(value: Double?) -> String? {
        guard let value = value else { return nil }
        let decimal = NSNumber(value: value / 100 )
        
        let numberFormatter = NumberFormatter()
        numberFormatter.decimalSeparator = Locale.current.decimalSeparator
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.roundingMode = .halfUp
        numberFormatter.numberStyle = .percent
        
        return numberFormatter.string(from: decimal)
    }
    
}
