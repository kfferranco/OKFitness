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
    @IBInspectable public var startColor: UIColor? {
        didSet {
            configureView()
        }
    }
    @IBInspectable public var endColor: UIColor? {
        didSet {
            configureView()
        }
    }
    
//    override public class func layerClass() -> AnyClass {
//        return CAGradientLayer.self
//    }
//
//    public override init() {
//        super.init()
//    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    public override func tintColorDidChange() {
        super.tintColorDidChange()
        configureView()
    }
    
    func configureView() {
//        let layer = self.layer as CAGradientLayer
//        layer.startLocation = CGPoint(x: 0.0, y:0.5)
//        layer.endLocation = CGPoint(x:1.0, y:0.5)
//        var color1 = startColor ?? self.tintColor as UIColor
//        var color2 = endColor ?? UIColor.blackColor() as UIColor
//        let colors: Array <AnyObject> = [ color1.CGColor, color2.CGColor ]
//        layer.colors = colors
    }
}
