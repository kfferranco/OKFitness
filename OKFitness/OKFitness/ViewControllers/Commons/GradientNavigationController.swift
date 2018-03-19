//
//  GradientNavigationController.swift
//  OKFitness
//
//  Created by Edgar Allan Fojas on 19/03/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

class GradientNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.shadowImage = UIImage()
        self.view.backgroundColor = UIColor.white
        navigationBar.setGradientBackground(colors: [UIColor.greenishTealTwo, UIColor.lightSage])
    }
}

extension UINavigationBar {
    func setGradientBackground(colors: [UIColor]) {
        let defaultNavigationBarFrame = layer.frame
        let gradientLayer = CAGradientLayer(frame: defaultNavigationBarFrame, colors: colors)
        setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
    }
}

extension CAGradientLayer {
    convenience init(frame: CGRect, colors: [UIColor]) {
        self.init()
        self.frame = frame
        self.colors = []
        for color in colors {
            self.colors?.append(color.cgColor)
        }
        startPoint = CGPoint(x: 0.0, y: 0.5)
        endPoint = CGPoint(x: 1.0, y: 0.5)
    }
    
    func createGradientImage() -> UIImage? {
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
}
