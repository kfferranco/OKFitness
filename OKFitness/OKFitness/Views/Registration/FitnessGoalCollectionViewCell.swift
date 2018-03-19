//
//  FitnessGoalCollectionViewCell.swift
//  OKFitness
//
//  Created by Edgar Allan Fojas on 19/03/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

class FitnessGoalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var customContentView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var fitnessGoalTitleLabel: UILabel!
    @IBOutlet weak var gradientView: GradientView!
    
    override var isSelected: Bool {
        willSet {
            gradientView.isHidden = !newValue
            customContentView.layer.borderWidth = newValue ? 0 : 1.0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customContentView.layer.cornerRadius = 5.0
        customContentView.layer.borderColor = UIColor.paleGrey.cgColor
        customContentView.layer.masksToBounds = true
        customContentView.layer.borderWidth = 1.0
    }
    
    func bindWith(goal: FitnessGoal) {
        iconImageView.image = UIImage(named: goal.image)
        fitnessGoalTitleLabel.text = goal.title
    }
}
