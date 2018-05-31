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
    @IBOutlet weak var parqTableView: UITableView!
    @IBOutlet weak var parqTableViewHeightConstraint: NSLayoutConstraint!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.rx.tap.subscribe { [weak self] (_) in
            guard let `self` = self else { return }
            self.navigationController?.popViewController(animated: true)
            }.disposed(by: disposeBag)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        parqTableViewHeightConstraint.constant = parqTableView.contentSize.height
    }
}

extension PARQViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PARQTableViewCell", for: indexPath) as? PARQTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

extension PARQViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? PARQTableViewCell
        cell?.toggleCollapse()
    }
}
