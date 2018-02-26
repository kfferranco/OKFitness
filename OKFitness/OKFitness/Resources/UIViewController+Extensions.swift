//
//  UIViewController+Extensions.swift
//  Takatack
//
//  Created by Edgar Allan Fojas on 07/03/2017.
//  Copyright © 2017 Voyager Innovation, Inc. All rights reserved.
//

import UIKit

extension UIViewController {
    @objc func dismissKeyboard() {
        _ = self.view.endEditing(true)
    }
        
//    func shouldShowLoadingView(inView: UIView, shouldShow: Bool, transparent: Bool) {
//        if shouldShow {
//            self.showLoadingView(inView: inView, transparent: transparent)
//        }
//        else {
//            self.removeLoadingView(inView: inView)
//        }
//    }
//    
//    func showLoadingView(inView: UIView, transparent: Bool) {
//        if let _ = inView.viewWithTag(666) {
//            return
//        }
//
//        let loadingView = LoadingView(frame: .zero)
//        loadingView.translatesAutoresizingMaskIntoConstraints = false
//        loadingView.backgroundColor = transparent ? UIColor.clear : UIColor.tiBackground
//        loadingView.tag = 666
//        inView.addSubview(loadingView)
//
//        inView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[loadingView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["loadingView": loadingView]))
//        inView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[loadingView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["loadingView": loadingView]))
//
//        loadingView.load(load: true)
//    }
//
//    func removeLoadingView(inView: UIView) {
//        guard let loadingView = inView.viewWithTag(666) as? LoadingView else {return}
//        loadingView.load(load: false)
//        loadingView.removeFromSuperview()
//    }
//
//    func errorViewIn(view: UIView) -> ErrorView? {
//        return view.viewWithTag(667) as? ErrorView
//    }
//
//    func showErrorView(title: String? = nil, subtitle: String? = nil, image: UIImage? = nil, actionTitle: String? = nil, inView: UIView, handler: ((ErrorView) -> Swift.Void)? = nil) {
//        if let currentErrorView = self.errorViewIn(view: inView) {
//            currentErrorView.bindWith(image: image, title: title, subtitle: subtitle, actionTitle: actionTitle, handler: handler)
//            return
//        }
//
//        let errorView = ErrorView(frame: .zero)
//        errorView.tag = 667
//        errorView.translatesAutoresizingMaskIntoConstraints = false
//        errorView.bindWith(image: image, title: title, subtitle: subtitle, actionTitle: actionTitle, handler: handler)
//        inView.addSubview(errorView)
//
//        inView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[errorView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["errorView": errorView]))
//        inView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[errorView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["errorView": errorView]))
//    }
//
//    func removeErrorView(inView: UIView) {
//        guard let errorView = inView.viewWithTag(667) else {return}
//        errorView.removeFromSuperview()
//    }
//
//    func showErrorBannerView(title: String? = nil, closeButton: Bool = false, inView: UIView, animated: Bool = false) {
//        if let currentErrorBanner: ErrorBannerView = inView.viewWithTag(668) as? ErrorBannerView {
//            currentErrorBanner.bindWithError(title: title, closeButton: closeButton)
//            return
//        }
//
//        let errorBannerView = ErrorBannerView(frame: .zero)
//        errorBannerView.translatesAutoresizingMaskIntoConstraints = false
//        errorBannerView.tag = 668
//        errorBannerView.bindWithError(title: title, closeButton: closeButton)
//        inView.addSubview(errorBannerView)
//
//        inView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[errorBannerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["errorBannerView": errorBannerView]))
//        inView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[errorBannerView(25)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["errorBannerView": errorBannerView]))
//    }
//
//    func removeErrorBannerView(inView: UIView, animated: Bool = false) {
//        guard let errorBannerView = inView.viewWithTag(668) else {return}
//        errorBannerView.removeFromSuperview()
//    }
//
//    func popMultipleViewControllers(count: Int) {
//        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
//        if count < viewControllers.count - 1 {
//           _ = self.navigationController?.popToViewController(viewControllers[viewControllers.count - (count + 1)], animated: true)
//        }
//        else {
//           _ = self.navigationController?.popToRootViewController(animated: true)
//        }
//    }
//
//    func isSearchAlreadyInNavigationStack() -> Bool {
//        if let viewControllers = self.navigationController?.viewControllers {
//            for viewController in viewControllers {
//                if viewController is SearchViewController {
//                    return true
//                }
//            }
//        }
//        return false
//    }
    
    func relayoutView() {
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }
    
    func relayoutViewAnimated(duration: TimeInterval) {
        UIView.animate(withDuration: duration) { 
            self.relayoutView()
        }
    }
    
    func addSectionChildViewController(viewController: UIViewController) {
        viewController.willMove(toParentViewController: self)
        self.addChildViewController(viewController)
        viewController.didMove(toParentViewController: self)
    }
    
    func removeChildViewController(viewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        viewController.removeFromParentViewController()
        viewController.didMove(toParentViewController: nil)
    }
}
