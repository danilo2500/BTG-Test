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
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: FundsInvestmentsBusinessLogic?
    var router: (NSObjectProtocol & FundsInvestmentsRoutingLogic & FundsInvestmentsDataPassing)?
    var displayedFunds: [FundsInvestments.Funds.ViewModel.DisplayViewModel] = []
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
        configureLayout()
        fetchFunds()
    }
    
    private func configureLayout() {
        registerNibFiles()
        configureTableView()
    }
    
    private func registerNibFiles() {
        let expandableHeader = UINib(nibName: "ExpandableHeader", bundle: nil)
        tableView.register(
            expandableHeader,
            forCellReuseIdentifier: ExpandableHeaderViewModels.ExpandableHeader.ViewModel.reuseIdentifier
        )
        
        let riskHeader = UINib(nibName: "RiskHeader", bundle: nil)
        tableView.register(
            riskHeader,
            forCellReuseIdentifier: RiskHeaderModels.RiskHeader.ViewModel.reuseIdentifier
        )
    }
    
    private func configureTableView() {
        tableView.estimatedRowHeight = ExpandableHeaderViewModels.ExpandableHeader.ViewModel.closedCellHeight
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func fetchFunds() {
        let request = FundsInvestments.Funds.Request()
        interactor?.fetchFunds(request: request)
    }
    
    func displayFetchedFunds(viewModel: FundsInvestments.Funds.ViewModel) {
        displayedFunds = viewModel.displayFunds
        tableView.reloadData()
    }
    
    func errorFetchingFunds(message: String) {
        
    }
}

extension FundsInvestmentsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 0
        case 1:
            return 0
        case 2:
            return displayedFunds.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ExpandableHeaderViewModels.ExpandableHeader.ViewModel.reuseIdentifier,
                for: indexPath) as! ExpandableHeaderViewController
            cell.delegate = self
            
            let displayFund = displayedFunds[indexPath.row]
            cell.viewModel = ExpandableHeaderViewModels.Fund.ViewModel(
                product: displayFund.product,
                categoryDescription: displayFund.categoryDescription,
                monthProfitability: displayFund.monthProfitability,
                yearProfitability: displayFund.yearProfitability,
                twelveMonthsProfitability: displayFund.twelveMonthsProfitability,
                minimumInitialInvestment: displayFund.minimumInitialInvestment,
                manager: displayFund.manager,
                begin: displayFund.begin,
                netEquity: displayFund.netEquity,
                investimentQuota: displayFund.investimentQuota,
                riskColor: displayFund.riskLevel?.representativeColor,
                isShowingDetail: displayFund.isShowingDetail
            )
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 2 {
            if displayedFunds[indexPath.row].isShowingDetail {
                return ExpandableHeaderViewModels.ExpandableHeader.ViewModel.openedCellHeight
            } else {
                return ExpandableHeaderViewModels.ExpandableHeader.ViewModel.closedCellHeight
            }
        }
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
             return tableView.dequeueReusableCell(withIdentifier: "SearchCell")!
        case 1:
            return tableView.dequeueReusableCell(withIdentifier: RiskHeaderModels.RiskHeader.ViewModel.reuseIdentifier)!
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 44
        case 1:
            return 44
        default:
            return 0
        }
    }
    
}

extension FundsInvestmentsViewController: ExpandableHeaderDelegate {
    func didPressExpandCollapseButton(_ cell: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        displayedFunds[indexPath.row].isShowingDetail.toggle()
        tableView.reloadData()
    }
}
