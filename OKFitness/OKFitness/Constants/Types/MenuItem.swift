//
//  MenuItem.swift
//  OKFitness
//
//  Created by Kristhoffer Ferranco on 03/09/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

enum MenuItem {
    case payment
    case history
    case appointment
    case help
    
    var title: String {
        switch self {
        case .payment:
            return L10n.Menu.payment
        case .history:
            return L10n.Menu.history
        case .appointment:
            return L10n.Menu.appointment
        case .help:
            return L10n.Menu.help
        }
    }
}
