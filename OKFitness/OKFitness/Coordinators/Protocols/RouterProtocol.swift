//
//  RouterProtocol.swift
//  OKFitness
//
//  Created by Kristhoffer Ferranco on 18/08/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

protocol RouterProtocol: class, Presentable {
    var navigationController: UINavigationController { get }
    var rootViewController: UIViewController? { get }
    func present(_ module: Presentable, animated: Bool, completion: (() -> Void)?)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func push(_ module: Presentable, animated: Bool, popCompletion: (() -> Void)?)
    func popModule(animated: Bool)
    func setRootModule(_ module: Presentable, hideBar: Bool, animated: Bool)
}

