//
//  SpacerView.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/2/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class SpacerView: UIView {
    private let space: CGFloat

    override var intrinsicContentSize: CGSize {
        return CGSize(width: space, height: space)
    }

    init(space: CGFloat) {
        self.space = space
        super.init(frame: .zero)
    }

    convenience init() {
        self.init(space: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
