//
//  SegueIdentifier.swift
//  OKFitness
//
//  Created by Kristhoffer Ferranco on 03/09/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

protocol StoryboardSegueHandler {
    associatedtype SegueIdentifier: RawRepresentable
}

extension StoryboardSegueHandler where Self: UIViewController, SegueIdentifier.RawValue == String {
    func performSegueWithIdentifier(_ segueIdentifier: SegueIdentifier,
                                    sender: Any?) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: sender)
    }
    
    func segueIdentifierForSegue(_ segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            preconditionFailure("Invalid segue identifier \(String(describing: segue.identifier)).")
        }
        return segueIdentifier
    }
}
