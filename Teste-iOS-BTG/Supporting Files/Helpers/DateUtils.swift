//
//  DateUtils.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 30/01/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import Foundation

class DateUtils {
    
    static func formatDate(dateString: String ) -> String? {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
}
