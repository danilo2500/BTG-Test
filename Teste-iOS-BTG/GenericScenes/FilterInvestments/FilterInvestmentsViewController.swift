//
//  FilterInvestmentsViewController.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 01/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

protocol FilterInvestmentsDisplayLogic: class {
    func displayFilters(viewModel: FilterInvestmentsModels.Components.ViewModel)
}

class FilterInvestmentsViewController: UIViewController, FilterInvestmentsDisplayLogic {
    
    var interactor: FilterInvestmentsBusinessLogic?
    var router: (NSObjectProtocol & FilterInvestmentsRoutingLogic & FilterInvestmentsDataPassing)?

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var displayedFilters: FilterInvestmentsModels.Components.ViewModel?
    var responses = FilterInvestmentsModels.Response()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = FilterInvestmentsInteractor()
        let presenter = FilterInvestmentsPresenter()
        let router = FilterInvestmentsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibFiles()
        setupTableView()
        interactor?.fetchFilterOptions()
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
    }
    
    private func registerNibFiles() {
        let riskCell = UINib(nibName: "RiskCollectionViewCell", bundle: nil)
        collectionView.register(riskCell, forCellWithReuseIdentifier: RiskCollectionViewCellModels.RiskCell.ViewModel.reuseIdentifier)
    
    }
    
    func displayFilters(viewModel: FilterInvestmentsModels.Components.ViewModel) {
        displayedFilters = viewModel
        collectionView.reloadData()
        tableView.reloadData()
    }
}

extension FilterInvestmentsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedFilters?.filters.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OptionCellModels.OptionCell.ViewModel.reuseIdentifier, for: indexPath) as! OptionCell
        cell.delegate = self
        
        if let displayFilter = displayedFilters?.filters[indexPath.row] {
            cell.viewModel = OptionCellModels.Option.ViewModel(filterType: displayFilter)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return OptionCellModels.OptionCell.ViewModel.height
    }
}

extension FilterInvestmentsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedFilters?.risks.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RiskCollectionViewCellModels.RiskCell.ViewModel.reuseIdentifier, for: indexPath) as! RiskCollectionViewCell
        cell.delegate = self
        if let displayRisk = displayedFilters?.risks[indexPath.row] {
            cell.viewModel = RiskCollectionViewCellModels.Risk.ViewModel(color: displayRisk.representativeColor, title: displayRisk.titleDescription)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: RiskCollectionViewCellModels.RiskCell.ViewModel.width,
            height: RiskCollectionViewCellModels.RiskCell.ViewModel.height
        )
    }
    
}

extension FilterInvestmentsViewController: OptionCellDelegate {
    func didChoose(response: Any, forType type: FilterType) {
        
        switch type {
        case .category:
            responses.category = response as? String
        case .minimumApplication:
            responses.minimumApplication = response as? Double
        case .rescue:
            responses.rescue = response as? Int
        case .manager:
            responses.manager = response as? String
        case .orderBy:
            responses.orderBy = response as? OrderByType
        default: break
        }
    }
}

extension FilterInvestmentsViewController: RiskCollectionViewCellDelegate {
    func didChoose(value: Bool, _ cell: RiskCollectionViewCell) {
        if let indexPath = collectionView.indexPath(for: cell),
            let riskType = displayedFilters?.risks[indexPath.row] {
            responses.risks[riskType] = value
        }
        
    }
}
