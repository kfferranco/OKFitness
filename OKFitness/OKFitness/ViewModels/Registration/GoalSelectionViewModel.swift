//
//  GoalSelectionViewModel.swift
//  OKFitness
//
//  Created by Edgar Allan Fojas on 19/03/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import Foundation

struct GoalSelectionViewModel {
    private let goals: [Goals] = [Goals.StrengthAndConditioning, Goals.BodyBuilding, Goals.WeightLoss, Goals.BodyWeightTraining, Goals.FunctionalTraining, Goals.Pilates, Goals.Rehab, Goals.PostRehab]
    
    func numberOfGoals() -> Int {
        return goals.count
    }
    
    func goalAt(index: Int) -> FitnessGoal {
        return goals[index].fitnessValue()
    }
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
