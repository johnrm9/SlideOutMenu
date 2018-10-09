//
//  UIViewExtensions.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/8/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            if $0 is UIStackView {
                ($0 as! UIStackView).isLayoutMarginsRelativeArrangement = true
            }
        }
    }
}

extension UIView {
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            topAnchor.constraint(equalTo: superview.topAnchor, constant: padding.top).isActive = true
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding.left).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding.bottom).isActive = true
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding.right).isActive = true

        }
    }
}
