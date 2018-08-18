//
//  CoordinatorProtocol.swift
//  OKFitness
//
//  Created by Kristhoffer Ferranco on 18/08/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol: Presentable {
    var childCoordinators: [Coordinator] { get set }
    var router: RouterProtocol { get set }
    
    func start()
}

extension CoordinatorProtocol {
    func toPresentable() -> UIViewController {
        return router.toPresentable()
    }
}
