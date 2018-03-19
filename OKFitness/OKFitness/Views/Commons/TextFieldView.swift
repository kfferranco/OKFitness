//
//  TextFieldView.swift
//  Takatack
//
//  Created by Edgar Allan Fojas on 26/04/2017.
//  Copyright © 2017 Voyager Innovation, Inc. All rights reserved.
//

import UIKit

@IBDesignable

class TextFieldView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var textField: TextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBInspectable var image: UIImage? {
        didSet {
            imageView.image = image
            imageView.isHidden = image == nil ? true : false
        }
    }
    @IBInspectable var placeholder: String? {
        didSet {
            self.textField.placeholder = placeholder
        }
    }
    @IBInspectable var text: String? {
        didSet {
            self.textField.text = text
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.textField.borderColor = borderColor
        }
    }
    @IBInspectable var selectedBorderColor: UIColor? {
        didSet {
            self.textField.selectedBorderColor = selectedBorderColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.textField.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.textField.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var placeHolderColor: UIColor = UIColor.lightGray {
        didSet {
            self.textField.placeHolderColor = placeHolderColor
        }
    }
    @IBInspectable var paddingTop: CGFloat = 0  {
        didSet {
            self.textField.paddingTop = paddingTop
        }
    }
    @IBInspectable var paddingLeft: CGFloat = 0 {
        didSet {
            self.textField.paddingLeft = paddingLeft
        }
    }
    @IBInspectable var paddingRight: CGFloat = 0 {
        didSet {
            self.textField.paddingRight = paddingRight
        }
    }
    @IBInspectable var paddingBottom: CGFloat = 0 {
        didSet {
            self.textField.paddingBottom = paddingBottom
        }
    }
    @IBInspectable var menuActionEnabled: Bool = true {
        didSet {
            self.textField.menuActionEnabled = menuActionEnabled
        }
    }
    @IBInspectable var font: UIFont = UIFont.systemFont(ofSize: 13.0) {
        didSet {
            self.textField.font = font
        }
    }
    @IBInspectable var textFieldTintColor: UIColor = UIColor.blue {
        didSet {
            self.textField.tintColor = textFieldTintColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
    }
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "TextFieldView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
