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
        }
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                padding: UIEdgeInsets = .zero, size: CGSize = .zero) {

        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }

        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }

        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }

        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }

        if size.width != 0 {
            self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }

        if size.height != 0 {
            self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
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

extension UIView {
    func centerInSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
            centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
            if constant != 0 {
                widthAnchor.constraint(equalTo: superview.widthAnchor, constant: constant).isActive = true
            }
        }
    }
}
