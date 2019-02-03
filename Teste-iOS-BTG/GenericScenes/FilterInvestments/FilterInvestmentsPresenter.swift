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

class FilterInvestmentsPresenter: FilterInvestmentsPresentationLogic
{
    weak var viewController: FilterInvestmentsDisplayLogic?
    
    // MARK: Do something
//
    func presentFilterOptions(response: FilterInvestmentsModels.Components.Response) {
        var riskOptions: [FilterInvestmentsModels.Components.ViewModel.RiskOption] = []
        var filterOptions: [FilterInvestmentsModels.Components.ViewModel.FilterOption] = []
        
        for filterType in response.filterTypes {
            switch filterType {
            case .risk(let types):
                for type in types {
                    riskOptions.append(FilterInvestmentsModels.Components.ViewModel.RiskOption(
                        risk: type,
                        isChecked: true
                    ))
                }
            case .category:
                filterOptions.append(FilterInvestmentsModels.Components.ViewModel.FilterOption(
                    filterType: filterType,
                    placeholder: "Todos(as)"
                ))
            case .minimumApplication:
                filterOptions.append(FilterInvestmentsModels.Components.ViewModel.FilterOption(
                    filterType: filterType,
                    placeholder: "Todos(as)"
                ))
            case .rescue:
                filterOptions.append(FilterInvestmentsModels.Components.ViewModel.FilterOption(
                    filterType: filterType,
                    placeholder: "Todos(as)"
                ))
            case .manager:
                filterOptions.append(FilterInvestmentsModels.Components.ViewModel.FilterOption(
                    filterType: filterType,
                    placeholder: "Todos(as)"
                ))
            case .orderBy(let types):
                filterOptions.append(FilterInvestmentsModels.Components.ViewModel.FilterOption(
                    filterType: filterType,
                    placeholder: "Nenhum"
                ))
            }
        }
        let viewModel = FilterInvestmentsModels.Components.ViewModel(riskOptions: riskOptions, filterOptions: filterOptions)
        viewController?.displayFilters(viewModel: viewModel)
    }
}
