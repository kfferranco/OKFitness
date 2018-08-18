//
//  Router.swift
//  OKFitness
//
//  Created by Kristhoffer Ferranco on 18/08/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

class Router: NSObject, RouterProtocol {
    var navigationController: UINavigationController
    var rootViewController: UIViewController? {
        return navigationController.viewControllers.first
    }
    
    private var popCompletions: [UIViewController : () -> Void]
    
    public init(navigationController: UINavigationController = UINavigationController(), hiddenNavBar: Bool = true) {
        navigationController.isNavigationBarHidden = hiddenNavBar
        self.navigationController = navigationController
        
        popCompletions = [:]
        super.init()
        
        self.navigationController.delegate = self
    }
    
    func present(_ module: Presentable, animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.present(module.toPresentable(), animated: animated, completion: completion)
    }
    
    func dismissModule(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
    func push(_ module: Presentable, animated: Bool, popCompletion: (() -> Void)?) {
        let viewController = module.toPresentable()
        
        guard viewController is UINavigationController == false else {
            return
        }
        
        if let popCompletion = popCompletion {
            popCompletions[viewController] = popCompletion
        }
        
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func popModule(animated: Bool) {
        if let viewController = navigationController.popViewController(animated: animated) {
            runCompletion(for: viewController)
        }
    }
    
    func setRootModule(_ module: Presentable, hideBar: Bool, animated: Bool = false) {
        popCompletions.forEach { $0.value() }
        navigationController.setViewControllers([module.toPresentable()], animated: animated)
        navigationController.isNavigationBarHidden = hideBar
    }
}

// MARK: Presentable
extension Router: Presentable {
    public func toPresentable() -> UIViewController {
        return navigationController
    }
}

// MARK: UINavigationControllerDelegate
extension Router: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        // Popping
        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(poppedViewController) else {
                return
        }
        
        runCompletion(for: poppedViewController)
    }
}

// MARK: Private Methods
extension Router {
    fileprivate func runCompletion(for controller: UIViewController) {
        guard let completion = popCompletions[controller] else { return }
        completion()
        popCompletions.removeValue(forKey: controller)
    }
}
