//
//  FormLayoutViewController.swift
//  Takatack
//
//  Created by Edgar Allan Fojas on 01/03/2017.
//  Copyright © 2017 Voyager Innovation, Inc. All rights reserved.
//

import UIKit
import RxSwift

class FormLayoutViewController: UIViewController {
    var scrollView : UIScrollView? = nil
    var keyboardDismissTapGestureRecognizer: UITapGestureRecognizer?
    var doesKeyboardCancelAllTouches: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        tap.delegate = self
        self.keyboardDismissTapGestureRecognizer = tap
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        _ = NotificationCenter.default.rx
            .notification(NSNotification.Name.UIKeyboardWillShow)
            .takeUntil(rx.methodInvoked(#selector(viewWillDisappear(_:))))
            .subscribe(onNext: { [weak self] notification in
                guard let `self` = self else { return }
                self.keyboardWillShow(notification)
            });
        
        _ = NotificationCenter.default.rx
            .notification(NSNotification.Name.UIKeyboardWillHide)
            .takeUntil(rx.methodInvoked(#selector(viewWillDisappear(_:))))
            .subscribe(onNext: { [weak self] notification in
                guard let `self` = self else { return }
                self.keyboardWillHide(notification)
            });
    }
    
    func keyboardWillShow(_ notification:Notification) {
        if let tapGR = self.keyboardDismissTapGestureRecognizer {
            self.view.addGestureRecognizer(tapGR)
        }
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView?.contentInset = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0)
        }
    }
    
    func keyboardWillHide(_ notification:Notification) {
        if let tapGR = self.keyboardDismissTapGestureRecognizer {
            self.view.removeGestureRecognizer(tapGR)
        }
        scrollView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }
}

extension FormLayoutViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if self.doesKeyboardCancelAllTouches {
            return true
        }
        
        if touch.view is UIControl && ((touch.view as? UITextInput) == nil) {
            return false
        }
        
        return true
    }
}
