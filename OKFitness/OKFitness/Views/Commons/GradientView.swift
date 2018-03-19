//
//  GradientView.swift
//  OKFitness
//
//  Created by Edgar Allan Fojas on 25/02/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

@IBDesignable

public class GradientView: UIView {
    @IBInspectable public var isHorizontal: Bool = true {
        didSet {
            setupGradient()
        }
    }
    
    @IBInspectable public var startColor: UIColor? {
        didSet {
            setupGradient()
        }
    }
    @IBInspectable public var endColor: UIColor? {
        didSet {
            setupGradient()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGradient()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    public override func tintColorDidChange() {
        super.tintColorDidChange()
        setupGradient()
    }
    
    override public class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    public func setupGradient() {
        let gradientLayer = layer as! CAGradientLayer
        let defaultColor = backgroundColor ?? UIColor.white
        let startColor = self.startColor ?? defaultColor
        let endColor = self.endColor ?? defaultColor
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        if isHorizontal {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        else {
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        }
        
    }
}
