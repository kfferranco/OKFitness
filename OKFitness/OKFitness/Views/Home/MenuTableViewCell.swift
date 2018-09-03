//
//  MenuTableViewCell.swift
//  OKFitness
//
//  Created by Kristhoffer Ferranco on 03/09/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    static let identifier = "MenuTableViewCellIdentifier"

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
