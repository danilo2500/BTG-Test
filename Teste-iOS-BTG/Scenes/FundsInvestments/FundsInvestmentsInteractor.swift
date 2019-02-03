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
    func searchFunds(request: FundsInvestments.FetchFunds.Request)
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
            guard let fundsStored = fundsResponse?.funds else { return }
            worker = FundsInvestmentsWorker()
            worker?.searchFunds(request: request, funds: fundsStored, completion: { [weak self] (response) in
                self?.presenter?.presentFunds(response: response)
            })
        }
    }
    
    func filterFunds(request: FundsInvestments.FetchFunds.Request) {
 
        if request.filter == nil,
            let fundsResponse = fundsResponse {
            presenter?.presentFunds(response: fundsResponse)
        }
        
        guard let fundsStored = fundsResponse?.funds else { return }
        worker = FundsInvestmentsWorker()
        worker?.filterFunds(request: request, funds: fundsStored, completion: { [weak self] (response) in
            self?.presenter?.presentFunds(response: response)
        })
    }
}
