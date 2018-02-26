//
//  GradientView.swift
//  OKFitness
//
//  Created by Edgar Allan Fojas on 25/02/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

@IBDesignable

public class GradientButtonView: UIButton {
    @IBInspectable var startColor: UIColor = .blue {
        didSet {
            setupGradient()
        }
    }
    
    @IBInspectable var endColor: UIColor = .green {
        didSet {
            setupGradient()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            setupGradient()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGradient()
    }
    
    override public class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    public func setupGradient() {
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.cornerRadius = cornerRadius
    }
}

