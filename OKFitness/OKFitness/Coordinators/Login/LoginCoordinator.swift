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
        router.setRootModule(viewController, hideBar: false, animated: true)
        presenter?.present(router.toPresentable(), animated: true, completion: nil)
    }
}
