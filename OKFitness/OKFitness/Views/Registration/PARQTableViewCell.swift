//
//  PARQTableViewCell.swift
//  OKFitness
//
//  Created by Edgar Allan Fojas on 19/03/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

class PARQTableViewCell: UITableViewCell {
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var checkIcon: UIImageView!
    @IBOutlet weak var questionContainerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var noButton: GradientButtonView!
    @IBOutlet weak var yesButton: GradientButtonView!
    @IBOutlet weak var roundedContainerView: UIView!
    @IBOutlet weak var questionContainerZeroHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var roundedContainerBottomConstraint: NSLayoutConstraint!
    var isCollapsed: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        roundedContainerView.layer.cornerRadius = 5.0
        roundedContainerView.layer.borderColor = UIColor.black.cgColor
        roundedContainerView.layer.borderWidth = 0.5
        contentView.backgroundColor = UIColor.lightGray
        collapse()
    }
    
    func toggleCollapse() {
        if isCollapsed {
            expand()
        }
        else {
            collapse()
        }
        isCollapsed = !isCollapsed
    }
    
    func collapse() {
        roundedContainerView.layer.masksToBounds = false
        roundedContainerView.clipsToBounds = false
        roundedContainerBottomConstraint.constant = 0
        contentView.addConstraint(questionContainerZeroHeightConstraint)
    }
    
    func expand() {
        roundedContainerView.layer.masksToBounds = true
        roundedContainerView.clipsToBounds = false
        roundedContainerBottomConstraint.constant = 15.0
        contentView.removeConstraint(questionContainerZeroHeightConstraint)
    }
}
