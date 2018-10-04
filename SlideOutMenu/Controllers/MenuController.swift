//
//  MenuController.swift
//  SlideOutMenu
//
//  Created by John Martin on 9/26/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

struct MenuItem {
    let icon: UIImage
    let title: String
}
class MenuItemsList {

    private let menuItems: [MenuItem] = [
        MenuItem(icon: #imageLiteral(resourceName: "profile"), title: "Profile"),
        MenuItem(icon: #imageLiteral(resourceName: "lists"), title: "Lists"),
        MenuItem(icon: #imageLiteral(resourceName: "bookmarks"), title: "Bookmarks"),
        MenuItem(icon: #imageLiteral(resourceName: "moments"), title: "Moments")
    ]

    subscript(row: Int) -> MenuItem {
        return menuItems[row]
    }

    var count: Int {
        return menuItems.count
    }
}

class MenuController: UITableViewController {
    private let cellId: String = "cellId"

    private let menuItemslist = MenuItemsList()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = false
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return CustomMenuHeaderView()
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
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
