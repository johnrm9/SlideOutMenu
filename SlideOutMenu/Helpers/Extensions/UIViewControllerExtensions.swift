//
//  UIViewControllerExtensions.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/8/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension UIViewController {
    func addChildren(_ children: UIViewController...) {
        children.forEach { addChild($0) }
    }
}

extension UIViewController {
    func performCleanup() {
        view.removeFromSuperview()
        removeFromParent()
    }
}
