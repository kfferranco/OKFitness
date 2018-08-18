//
//  ViewController.swift
//  OKFitness
//
//  Created by Kristhoffer Ferranco on 18/08/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

protocol ViewControllerBackActionDelegate: class {
    func didTapBack(_ viewController: ViewController)
}

class ViewController: UIViewController {
    
    weak var backActionDelegate: ViewControllerBackActionDelegate?
    
    @IBAction func didTapBack(_ sender: Any) {
        backActionDelegate?.didTapBack(self)
    }
    
}
