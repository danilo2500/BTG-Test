//
//  FundsInvestmentsViewController.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 30/01/19.
//  Copyright (c) © 2019 BTG Pactual. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FundsInvestmentsDisplayLogic: class {
    func displayFetchedFunds(viewModel: FundsInvestments.Funds.ViewModel)
    func errorFetchingFunds(message: String)
}

class FundsInvestmentsViewController: UIViewController, FundsInvestmentsDisplayLogic {
    var interactor: FundsInvestmentsBusinessLogic?
    var router: (NSObjectProtocol & FundsInvestmentsRoutingLogic & FundsInvestmentsDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = FundsInvestmentsInteractor()
        let presenter = FundsInvestmentsPresenter()
        let router = FundsInvestmentsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        if let scene = segue.identifier {
//            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
//            if let router = router, router.responds(to: selector) {
//                router.perform(selector, with: segue)
//            }
//        }
//    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFunds()
    }
    
    func fetchFunds() {
        let request = FundsInvestments.Funds.Request()
        interactor?.fetchFunds(request: request)
    }
    
    func displayFetchedFunds(viewModel: FundsInvestments.Funds.ViewModel) {
        //nameTextField.text = viewModel.name
    }
    
    func errorFetchingFunds(message: String) {
        
    }
}
