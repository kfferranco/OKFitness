//
//  DrawerViewController.swift
//  OKFitness
//
//  Created by Kristhoffer Ferranco on 03/09/2018.
//  Copyright © 2018 okfitness. All rights reserved.
//

import UIKit

protocol DrawerViewControllerDelegate {
    func didTapMenu(_ viewController: DrawerViewController, menu: MenuItem)
}

class DrawerViewController: ViewController {
    fileprivate let menus: [MenuItem] = [.payment, .history, .appointment, .help]
    
    var delegate: DrawerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

extension DrawerViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier) as? MenuTableViewCell {
            cell.titleLabel.text = menus[indexPath.row].title
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didTapMenu(self, menu: menus[indexPath.row])
    }
}
