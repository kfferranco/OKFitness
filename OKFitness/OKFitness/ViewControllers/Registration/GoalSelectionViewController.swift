//
//  GoalSelectionViewController.swift
//  OKFitness
//
//  Created by Edgar Allan Fojas on 12/03/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

class GoalSelectionViewController: UIViewController {
    @IBOutlet weak var goalsCollectionView: UICollectionView!
    @IBOutlet weak var goalsCollectionViewHeightConstraint: NSLayoutConstraint!
    let viewModel = GoalSelectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalsCollectionView.allowsMultipleSelection = true

        let layout = self.goalsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let width = (view.bounds.size.width - 45) * 0.5
        let height = layout?.itemSize.height
        let cellSize =  CGSize(width: width, height: height ?? 90)
        layout?.itemSize = cellSize
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        goalsCollectionViewHeightConstraint.constant = goalsCollectionView.contentSize.height
    }
}

extension GoalSelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfGoals()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FitnessGoalCollectionViewCell", for: indexPath) as? FitnessGoalCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let goal = viewModel.goalAt(index: indexPath.item)
        cell.bindWith(goal: goal)
        return cell
    }
}

extension GoalSelectionViewController: UICollectionViewDelegate {
    
    
}
