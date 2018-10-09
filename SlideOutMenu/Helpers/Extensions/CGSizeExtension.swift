//
//  CGSizeExtension.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/9/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension CGSize {
    public init(all: CGFloat = 0) {
        self.init()
        if all != 0 { (width, height) = (all, all) }
    }
}
