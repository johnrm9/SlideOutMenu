//
//  UIEdgeInsetsExtensions.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/8/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    public init(all: CGFloat = 0) {
        self.init()
        if all != 0 { (top, bottom, left, right) = (all, all, all, all) }
    }
    public init(vertical: CGFloat = 0, horizontal: CGFloat = 0) {
        self.init()
        if vertical != 0 { (top, bottom) = (vertical, vertical) }
        if horizontal != 0 { (left, right) = (horizontal, horizontal) }
    }
    public init(bottom: CGFloat) {
        self.init()
        (top, self.bottom, left, right) = (0, bottom, 0, 0)
    }
}
extension UIEdgeInsets {
    public func insetBy(bottom: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left, bottom: self.bottom + bottom, right: right)
    }
    public func insetBy(left: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: self.left + left, bottom: bottom, right: right)
    }
}
