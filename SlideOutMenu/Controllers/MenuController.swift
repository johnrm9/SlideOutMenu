//
//  MenuController.swift
//  SlideOutMenu
//
//  Created by John Martin on 9/26/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

protocol BaseSlidingControllerDelegate: class {
    func didSelectMenuItem(with item: MenuItemType)
}

extension MenuController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let slidingController = UIApplication.shared.keyWindow?.rootViewController as? BaseSlidingController
        slidingController?.didSelectMenuItem(with: MenuItemType.allCases[indexPath.row])
    }
}

class MenuController: UITableViewController {
    private let cellId: String = "cellId"

    private let menuItemslist = MenuItemsList()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return CustomMenuHeaderView()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItemslist.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuItemCell(style: .default, reuseIdentifier: cellId)

        let menuItem = menuItemslist[indexPath.row]
        cell.menuItem = menuItem
        return cell
    }
}
