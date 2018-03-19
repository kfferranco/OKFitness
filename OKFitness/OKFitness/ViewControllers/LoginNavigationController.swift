//
//  LoginNavigationController.swift
//  OKFitness
//
//  Created by Edgar Allan Fojas on 26/02/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

class LoginNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.backgroundColor = UIColor.blue
        self.view.backgroundColor = UIColor.white
        self.delegate = self
    }
}

extension LoginNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController is LoginViewController {
            self.navigationBar.isHidden = true
        }
        else {
            self.navigationBar.isHidden = false
        }
    }
}
