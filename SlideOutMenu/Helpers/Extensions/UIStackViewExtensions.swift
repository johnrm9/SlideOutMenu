//
//  UIStackViewExtensions.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/8/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView],
                     axis: NSLayoutConstraint.Axis = .horizontal,
                     spacing: CGFloat = UIStackView.spacingUseDefault, margins: UIEdgeInsets = .zero) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        setMargins(margins)
    }
}

extension UIStackView {
    func setMargins(_ margins: UIEdgeInsets) {
        guard margins != .zero else { return }
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = margins
    }
}
