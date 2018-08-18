//
//  Coordinator.swift
//  OKFitness
//
//  Created by Kristhoffer Ferranco on 18/08/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import Foundation

protocol BackActionDelegate: class {
    func didTapBack(_ coordinator: Coordinator)
}

class Coordinator: NSObject, CoordinatorProtocol, BackActionDelegate, ViewControllerBackActionDelegate {
    weak var presenter: RouterProtocol?
    var childCoordinators = [Coordinator]()
    var router: RouterProtocol
    weak var backActionDelegate: BackActionDelegate?
    
    init(router: RouterProtocol = Router(), presenter: RouterProtocol? = nil) {
        self.router = router
        self.presenter = presenter
    }
    
    func start() {}
    
    public func addChild(_ coordinator: Coordinator) {
        if childCoordinators.contains(where: { $0 === coordinator }) {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    public func removeChild(_ coordinator: Coordinator) {
        if let index = childCoordinators.index(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
    
    func dispatchToMain(withDelay delay: DispatchTime = .now(), _ closure:@escaping (() -> Void)) {
        DispatchQueue.main.asyncAfter(deadline: delay) {
            closure()
        }
    }
    
    func didTapBack(_ coordinator: Coordinator) {
        router.dismissModule(animated: true, completion: { [weak self] in
            guard let `self` = self else { return }
            self.removeChild(coordinator)
        })
    }
    
    func didTapBack(_ viewController: ViewController) {
        backActionDelegate?.didTapBack(self)
    }

}
