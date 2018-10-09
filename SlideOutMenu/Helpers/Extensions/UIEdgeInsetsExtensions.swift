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
}
