//
//  FilterInvestmentsInteractor.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 02/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

protocol FilterInvestmentsBusinessLogic {
    func fetchFilterOptions()
}

protocol FilterInvestmentsDataStore
{
    var filterComponents: FilterInvestmentsModels.Components.Response? { get set }
}

class FilterInvestmentsInteractor: FilterInvestmentsBusinessLogic, FilterInvestmentsDataStore {
    
    var filterComponents: FilterInvestmentsModels.Components.Response?
    var presenter: FilterInvestmentsPresentationLogic?

    func fetchFilterOptions() {
        if let filterComponents = filterComponents {
            presenter?.presentFilterOptions(response: filterComponents)
        }
    }
}
