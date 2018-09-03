//
//  LoginViewController.swift
//  OKFitness
//
//  Created by Edgar Allan Fojas on 25/02/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol LoginViewControllerDelegate {
    func didAuthenticate(_ viewController: LoginViewController)
    func didTapSignUp(_ viewController: LoginViewController)
}

class LoginViewController: FormLayoutViewController {
    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var userNameTextField: TextFieldView!
    @IBOutlet weak var passwordTextField: TextFieldView!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var signInButton: GradientButtonView!
    @IBOutlet weak var signUpButton: UIButton!
    
    var delegate: LoginViewControllerDelegate?
    
    fileprivate let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = loginScrollView
        passwordTextField.textField.isSecureTextEntry = true
        
//        signInButton.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] (_) in
//            guard let `self` = self else {return}
//            self.performSegue(withIdentifier: "gotoRegistration", sender: nil)
//        }).disposed(by: disposeBag)
    }
    
    @IBAction func didTapSignIn(_ sender: Any) {
        delegate?.didAuthenticate(self)
    }
    
}
