//
//  UIColorExtensions.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/8/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension UIColor {
    static let chatrromsBackgroundColor = UIColor(named: Constants.chatrromsBackgroundColor) ?? .rgb(r: 78, g: 56, b: 73)
    static let chatroomCellColor = UIColor(named: Constants.chatroomCellColor) ?? .rgb(r: 75, g: 153, b: 138)
    static let chatroomTextColor = UIColor(named: Constants.chatroomTextColor) ?? .rgb(r: 121, g: 104, b: 119)
}

extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
