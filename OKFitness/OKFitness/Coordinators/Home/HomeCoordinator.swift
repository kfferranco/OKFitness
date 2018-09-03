//
//  HomeCoordinator.swift
//  OKFitness
//
//  Created by Kristhoffer Ferranco on 03/09/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import Foundation
import SlideMenuControllerSwift

class HomeCoordinator: Coordinator {
    
    var slideMenuController: SlideMenuController?
    
    override func start() {
        let drawerViewController = StoryboardScene.Home.drawerViewController.instantiate()
        drawerViewController.delegate = self
        
        let scheduleRouter = Router(hiddenNavBar: false)
        let scheduleViewController = StoryboardScene.Home.scheduleViewController.instantiate()
        scheduleRouter.setRootModule(scheduleViewController, hideBar: false)
        
        slideMenuController = SlideMenuController(mainViewController: scheduleRouter.toPresentable(), leftMenuViewController: drawerViewController)
        router.setRootModule(slideMenuController!, hideBar: true, animated: true)
        presenter?.present(router.toPresentable(), animated: true, completion: nil)
    }
}

extension HomeCoordinator: DrawerViewControllerDelegate {
    func didTapMenu(_ viewController: DrawerViewController, menu: MenuItem) {
        //TODO: Change MainViewController base on selected Menu
        print(menu.title)
    }
}
