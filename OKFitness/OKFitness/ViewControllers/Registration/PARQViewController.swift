//
//  PARQViewController.swift
//  OKFitness
//
//  Created by Edgar Allan Fojas on 12/03/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PARQViewController: UIViewController {
    @IBOutlet weak var backButton: UIBarButtonItem!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.rx.tap.subscribe { [weak self] (_) in
            guard let `self` = self else { return }
            self.navigationController?.popViewController(animated: true)
            }.disposed(by: disposeBag)
    }
}
