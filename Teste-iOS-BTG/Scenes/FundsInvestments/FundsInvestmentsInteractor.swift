//
//  FundsInvestmentsInteractor.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 30/01/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FundsInvestmentsBusinessLogic {
    
    func fetchFunds(request: FundsInvestments.Funds.Request)
    
}

protocol FundsInvestmentsDataStore {

    var funds: [Fund]? { get }

}

class FundsInvestmentsInteractor: FundsInvestmentsBusinessLogic, FundsInvestmentsDataStore {
    
    var presenter: FundsInvestmentsPresentationLogic?
    var worker: FundsInvestmentsWorker?
    var funds: [Fund]?
    
    // MARK: Fetch Funds
    
    func fetchFunds(request: FundsInvestments.Funds.Request) {
        worker = FundsInvestmentsWorker()
        worker?.fetchFunds(request: request, completion: { [weak self] (response) in
            self?.presenter?.presentFunds(response: response)
        })
    }
    
}
