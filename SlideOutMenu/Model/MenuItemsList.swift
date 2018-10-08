//
//  MenuItemsList.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/3/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

struct MenuItem {
    let icon: UIImage
    let title: String

    init(icon: UIImage, title: MenuItemType) {
        self.icon = icon
        self.title = title.rawValue
    }
}

enum MenuItemType: String, CaseIterable {
    case profile   = "Home"
    case lists     = "Lists"
    case bookmarks = "Bookmarks"
    case moments   = "Moments"
}

class MenuItemsList {
    private let menuItems: [MenuItem] = [
        MenuItem(icon: #imageLiteral(resourceName: "profile"), title: .profile),
        MenuItem(icon: #imageLiteral(resourceName: "lists"), title: .lists),
        MenuItem(icon: #imageLiteral(resourceName: "bookmarks"), title: .bookmarks),
        MenuItem(icon: #imageLiteral(resourceName: "moments"), title: .moments)
    ]

    subscript(row: Int) -> MenuItem { return menuItems[row] }
    var count: Int { return menuItems.count }
}
