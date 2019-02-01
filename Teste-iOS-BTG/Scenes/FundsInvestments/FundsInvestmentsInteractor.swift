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
    
    func fetchFunds(request: FundsInvestments.FetchFunds.Request)
    func filterFunds(request: FundsInvestments.FetchFunds.Request)
}

protocol FundsInvestmentsDataStore {
    
    var fundsResponse: FundsInvestments.FetchFunds.Response? { get }

}

class FundsInvestmentsInteractor: FundsInvestmentsBusinessLogic, FundsInvestmentsDataStore {
    
    var presenter: FundsInvestmentsPresentationLogic?
    var worker: FundsInvestmentsWorker?
    var fundsResponse: FundsInvestments.FetchFunds.Response?
    
    // MARK: Fetch Funds
    
    func fetchFunds(request: FundsInvestments.FetchFunds.Request) {
        worker = FundsInvestmentsWorker()
        worker?.fetchFunds(request: request, completion: { [weak self] (response) in
            self?.fundsResponse = response
            self?.presenter?.presentFunds(response: response)
        })
    }
    
    func searchFunds(request: FundsInvestments.FetchFunds.Request) {
        if request.product?.isEmpty ?? true {
            if let fundsResponse = fundsResponse {
                self.presenter?.presentFunds(response: fundsResponse)
            }
        } else {
            guard let funds = fundsResponse?.funds else { return }
            worker = FundsInvestmentsWorker()
            let filtered = worker!.searchFunds(request: request, funds: funds)
            presenter?.presentFunds(response: filtered )
        }
    }
    
    func filterFunds(request: FundsInvestments.FetchFunds.Request) {
 
        guard let funds = fundsResponse?.funds else { return }
        worker = FundsInvestmentsWorker()
        let filtered = worker!.filterFunds(request: request, funds: funds)
        presenter?.presentFunds(response: filtered )
        
    }
}
