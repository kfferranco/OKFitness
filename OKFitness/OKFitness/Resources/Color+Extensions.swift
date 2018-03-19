//
//  Color+Extensions.swift
//  OKFitness
//
//  Created by Edgar Allan Fojas on 25/02/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import Foundation
import UIKit

// Color palette

extension UIColor {
    
    @nonobjc class var paleGrey: UIColor {
        return UIColor(red: 236.0 / 255.0, green: 240.0 / 255.0, blue: 241.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var white: UIColor {
        return UIColor(white: 1.0, alpha: 1.0)
    }
    
    @nonobjc class var greenyBlue: UIColor {
        return UIColor(red: 77.0 / 255.0, green: 201.0 / 255.0, blue: 155.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var blueGrey: UIColor {
        return UIColor(red: 120.0 / 255.0, green: 145.0 / 255.0, blue: 165.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var lightMustard: UIColor {
        return UIColor(red: 250.0 / 255.0, green: 217.0 / 255.0, blue: 97.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var orange: UIColor {
        return UIColor(red: 247.0 / 255.0, green: 107.0 / 255.0, blue: 28.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var whiteTwo: UIColor {
        return UIColor(white: 250.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var slateGrey: UIColor {
        return UIColor(red: 90.0 / 255.0, green: 100.0 / 255.0, blue: 115.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var greenishTeal: UIColor {
        return UIColor(red: 47.0 / 255.0, green: 190.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var cloudyBlue: UIColor {
        return UIColor(red: 180.0 / 255.0, green: 190.0 / 255.0, blue: 205.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var greenishTealTwo: UIColor {
        return UIColor(red: 48.0 / 255.0, green: 194.0 / 255.0, blue: 153.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var lightSage: UIColor {
        return UIColor(red: 179.0 / 255.0, green: 240.0 / 255.0, blue: 172.0 / 255.0, alpha: 1.0)
    }
    
}

// Text styles

extension UIFont {
    
    class var textStyle: UIFont {
        return UIFont(name: "Avenir-Light", size: 12.0)!
    }
    
}
