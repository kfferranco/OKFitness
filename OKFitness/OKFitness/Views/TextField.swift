//
//  TextField.swift
//  Takatack
//
//  Created by Patrick J. D. Medina on 30/01/2017.
//  Copyright © 2017 Voyager Innovation, Inc. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

@IBDesignable

class TextField: UITextField {

    private let disposeBag = DisposeBag()

    // MARK: - Public Properties
    var validator: ((String?) -> Bool) = {_ in true}
    var isValid: Bool {
        return validator(text)
    }
    
    // MARK: - Interface Builder Inspectables
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var selectedBorderColor: UIColor?
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
          layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
          layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var placeHolderColor: UIColor = UIColor.lightGray {
        didSet {
          setValue(placeHolderColor, forKeyPath: "_placeholderLabel.textColor")
        }
    }
    @IBInspectable var paddingTop: CGFloat = 0
    @IBInspectable var paddingLeft: CGFloat = 0
    @IBInspectable var paddingRight: CGFloat = 0
    @IBInspectable var paddingBottom: CGFloat = 0
    @IBInspectable var menuActionEnabled: Bool = true

    // MARK: - Overrides
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupReactive()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupReactive()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + paddingLeft, y: bounds.origin.y + paddingTop,
                  width: bounds.size.width - paddingLeft - paddingRight, height: bounds.size.height - paddingTop - paddingBottom);
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return menuActionEnabled
    }
  
    func setupReactive() {
        self.rx.controlEvent(.editingDidBegin).subscribe(onNext: {
            self.setSelected(selected: true)
        }).disposed(by: disposeBag)
        self.rx.controlEvent(.editingDidEnd).subscribe(onNext: {
            self.setSelected(selected: false)
        }).disposed(by: disposeBag)
    }
    
    func setSelected(selected : Bool) {
        self.isSelected = selected
        if let selectedBorderColor = selectedBorderColor {
            layer.borderColor = selected ? selectedBorderColor.cgColor : borderColor.cgColor
        }
    }
    
    func hightlightBorderWithError() {
//        layer.borderColor = UIColor.tiTomato.cgColor
    }
    
    func resetBorderColor() {
        layer.borderColor = borderColor.cgColor
    }
}
