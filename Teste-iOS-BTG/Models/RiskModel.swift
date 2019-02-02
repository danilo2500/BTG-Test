//
//  RiskModel.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 31/01/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

enum RiskModel: Int {
    case conservative = 1
    case moderate = 2
    case sophisticated = 5
    
    var titleDescription: String {
        switch self {
        case .conservative:
            return "Conservador"
        case .moderate:
            return "Moderado"
        case .sophisticated:
            return "Sofisticado"
        }
    }
    
    var representativeColor: UIColor {
        switch self {
        case .conservative:
            return UIColor.btg_blue
        case .moderate:
            return UIColor.btg_orange
        case .sophisticated:
            return UIColor.btg_brown
        }
    }
}
