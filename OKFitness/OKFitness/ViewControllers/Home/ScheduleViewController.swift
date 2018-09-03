//
//  ScheduleViewController.swift
//  OKFitness
//
//  Created by Kristhoffer Ferranco on 03/09/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

class ScheduleViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapMenu(_ sender: Any) {
        self.slideMenuController()?.openLeft()
    }
    
}
