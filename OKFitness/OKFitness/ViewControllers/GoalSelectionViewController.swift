//
//  GoalSelectionViewController.swift
//  OKFitness
//
//  Created by Edgar Allan Fojas on 12/03/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

struct FitnessGoal {
    let title: String
    let image: String
}

enum Goals {
    case StrengthAndConditioning
    case BodyBuilding
    case WeightLoss
    case BodyWeightTraining
    case FunctionalTraining
    case Pilates
    case Rehab
    case PostRehab
    
    func fitnessValue() -> FitnessGoal {
        switch self {
        case .StrengthAndConditioning:
            return FitnessGoal(title: "Strength and Conditioning", image: "strength")
        case .BodyBuilding:
            return FitnessGoal(title: "Body building", image: "bodyBuilding")
        case .WeightLoss:
            return FitnessGoal(title: "Weight Loss", image: "weightLoss")
        case .BodyWeightTraining:
            return FitnessGoal(title: "Body Weight Training", image: "bodyWeightTraining")
        case .FunctionalTraining:
            return FitnessGoal(title: "Functional Training", image: "group2")
        case .Pilates:
            return FitnessGoal(title: "Pilates", image: "pilates")
        case .Rehab:
            return FitnessGoal(title: "Rehab", image: "rehab")
        case .PostRehab:
            return FitnessGoal(title: "Post Rehab", image: "postRehab")
        }
    }
}

class GoalSelectionViewController: UIViewController {
    @IBOutlet weak var goalsCollectionView: UICollectionView!
    @IBOutlet weak var goalsCollectionViewHeightConstraint: NSLayoutConstraint!
    
    let goals: [Goals] = [Goals.StrengthAndConditioning, Goals.BodyBuilding, Goals.WeightLoss, Goals.BodyWeightTraining, Goals.FunctionalTraining, Goals.Pilates, Goals.Rehab, Goals.PostRehab]
    
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
        return goals.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FitnessGoalCollectionViewCell", for: indexPath) as? FitnessGoalCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let goal = goals[indexPath.item]
        cell.bindWith(goal: goal.fitnessValue())
        return cell
    }
}

extension GoalSelectionViewController: UICollectionViewDelegate {
    
    
}
