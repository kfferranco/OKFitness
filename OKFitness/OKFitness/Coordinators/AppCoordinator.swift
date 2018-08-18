//
//  AppCoordinator.swift
//  OKFitness
//
//  Created by Kristhoffer Ferranco on 18/08/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import Foundation

class AppCoordinator: Coordinator {
    
    override func start() {
        let viewController = StoryboardScene.Main.initialScene.instantiate()
        router.setRootModule(viewController, hideBar: true, animated: true)
        startLoginFlow()
    }
}

extension AppCoordinator {
    func startLoginFlow() {
        let loginNavigationController = LoginNavigationController()
        let loginRouter = Router(navigationController: loginNavigationController)
        let coordinator = LoginCoordinator(router: loginRouter, presenter: router)
        coordinator.start()
    }
}
