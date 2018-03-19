//
//  LoginNavigationController.swift
//  OKFitness
//
//  Created by Edgar Allan Fojas on 26/02/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

class LoginNavigationController: GradientNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func setBarHidden() {
        self.navigationBar.isHidden = true
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    func setBarVisible() {
        self.navigationBar.isHidden = false
        navigationBar.setGradientBackground(colors: [UIColor.greenishTealTwo, UIColor.lightSage])
    }
}

extension LoginNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController is LoginViewController {
            setBarHidden()
        }
        else {
            setBarVisible()
        }
    }
}
