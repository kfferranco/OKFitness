//
//  PresentableProtocol.swift
//  OKFitness
//
//  Created by Kristhoffer Ferranco on 18/08/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

protocol Presentable {
    func toPresentable() -> UIViewController
}

extension UIViewController: Presentable {
    public func toPresentable() -> UIViewController {
        return self
    }
}
