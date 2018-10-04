//
//  BaseView.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/2/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
        setupViews()
    }

    func setupViews() {

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
