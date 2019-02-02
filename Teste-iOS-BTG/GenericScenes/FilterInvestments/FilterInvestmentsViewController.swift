//
//  FilterInvestmentsViewController.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 01/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

protocol FilterInvestmentsDisplayLogic: class {
//    func displaySomething(viewModel: FilterInvestments.Something.ViewModel)
}

class FilterInvestmentsViewController: UIViewController, FilterInvestmentsDisplayLogic {
    
    var interactor: FilterInvestmentsBusinessLogic?
    var router: (NSObjectProtocol & FilterInvestmentsRoutingLogic & FilterInvestmentsDataPassing)?

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var risks: [RiskModel] = [.conservative, .moderate, .sophisticated]
    
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
    
    private func setup()
    {
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
        setupLayout()
        interactor?.fetchFilterOptions()
    }
    
    private func setupLayout() {
        tableView.tableFooterView = UIView()
    }
    
    private func registerNibFiles() {
        let riskCell = UINib(nibName: "RiskCollectionViewCell", bundle: nil)
        collectionView.register(riskCell, forCellWithReuseIdentifier: RiskCollectionViewCellModels.RiskCell.ViewModel.reuseIdentifier)
    
    }
}

extension FilterInvestmentsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OptionCellModels.OptionCell.ViewModel.reuseIdentifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return OptionCellModels.OptionCell.ViewModel.height
    }
}

extension FilterInvestmentsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return risks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RiskCollectionViewCellModels.RiskCell.ViewModel.reuseIdentifier, for: indexPath) as! RiskCollectionViewCell
        let risk = risks[indexPath.row]
        cell.viewModel = RiskCollectionViewCellModels.Risk.ViewModel(color: risk.representativeColor, title: risk.titleDescription)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: RiskCollectionViewCellModels.RiskCell.ViewModel.width,
            height: RiskCollectionViewCellModels.RiskCell.ViewModel.height
        )
    }
    
}
