//
//  FilterModel.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 02/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import Foundation

enum FilterType{
    case risk(types: [RiskModel])
    case category
    case minimumApplication
    case rescue
    case manager
    case orderBy(types: [OrderByType])
    
    var description: String {
        switch self {
        case .category:
            return "Categoria"
        case .minimumApplication:
            return "Aplicação Mínima"
        case .rescue:
            return "Resgate em até"
        case .manager:
            return "Gestor"
        case .orderBy:
            return "Ordenar por"
        case .risk:
            return "Risco"
        }
    }
}

extension FilterType {
    enum OrderByType {
        case maxRescue
        case minRescue
        
        var description: String {
            switch self {
            case .maxRescue:
                return "Maior Resgate"
            case .minRescue:
                return "Menor Resgate"
            }
        }
    }
}

