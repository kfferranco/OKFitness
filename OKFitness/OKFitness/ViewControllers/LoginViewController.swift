//
//  LoginViewController.swift
//  OKFitness
//
//  Created by Edgar Allan Fojas on 25/02/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

class LoginViewController: FormLayoutViewController {
    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var userNameTextField: TextFieldView!
    @IBOutlet weak var passwordTextField: TextFieldView!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var signInButton: GradientButtonView!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = loginScrollView
        passwordTextField.textField.isSecureTextEntry = true
    }
}
