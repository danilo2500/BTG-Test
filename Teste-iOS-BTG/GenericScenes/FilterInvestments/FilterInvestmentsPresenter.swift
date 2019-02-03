//
//  FilterInvestmentsPresenter.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 02/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

protocol FilterInvestmentsPresentationLogic
{
    func presentFilterOptions(response: FilterInvestmentsModels.Components.Response)
}

class FilterInvestmentsPresenter: FilterInvestmentsPresentationLogic {
    weak var viewController: FilterInvestmentsDisplayLogic?
    
    // MARK: Do something

    func presentFilterOptions(response: FilterInvestmentsModels.Components.Response) {
        var risks: [RiskModel] = []
        var filters: [FilterType] = []
        
        for filterType in response.filterTypes {
            switch filterType {
            case .risk(let types):
                for type in types {
                    risks.append(type)
                }
            default:
                filters.append(filterType)
            }
        }
        let viewModel = FilterInvestmentsModels.Components.ViewModel(risks: risks, filters: filters)
        viewController?.displayFilters(viewModel: viewModel)
    }
}
