import UIKit

enum MenuItemType: String, CaseIterable {
    case profile   = "Profile"
    case lists     = "Lists"
    case bookmarks = "Bookmarks"
    case moments   = "Moments"
    subscript(row: Int) -> MenuItemType {
        return MenuItemType.allCases[row]
    }
}
let menuItem: MenuItemType
for item in MenuItemType.allCases {
    print(item)
}
