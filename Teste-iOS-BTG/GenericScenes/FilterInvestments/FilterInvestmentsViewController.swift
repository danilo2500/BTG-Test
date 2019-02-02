//
//  FilterInvestmentsViewController.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 01/02/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import UIKit

class FilterInvestmentsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var risks: [RiskModel] = [.conservative, .moderate, .sophisticated]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibFiles()
    }
    
    private func registerNibFiles() {
        let riskCell = UINib(nibName: "RiskCollectionViewCell", bundle: nil)
        collectionView.register(riskCell, forCellWithReuseIdentifier: RiskCollectionViewCellModels.RiskCell.ViewModel.reuseIdentifier)
    
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
