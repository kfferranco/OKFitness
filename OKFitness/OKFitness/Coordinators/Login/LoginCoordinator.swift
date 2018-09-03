//
//  LoginCoordinator.swift
//  OKFitness
//
//  Created by Kristhoffer Ferranco on 18/08/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import Foundation

class LoginCoordinator: Coordinator {
    
    override func start() {
        let viewController = StoryboardScene.Login.loginViewController.instantiate()
        viewController.delegate = self
        router.setRootModule(viewController, hideBar: false, animated: true)
        presenter?.present(router.toPresentable(), animated: true, completion: nil)
    }
}

extension LoginCoordinator {
    func startDashboardFlow() {
        let homeRouter = Router(hiddenNavBar: false)
        let coordinator = HomeCoordinator(router: homeRouter, presenter: router)
        coordinator.start()
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func didAuthenticate(_ viewController: LoginViewController) {
        startDashboardFlow()
    }
    
    func didTapSignUp(_ viewController: LoginViewController) {
        //Registration flow
    }
}


