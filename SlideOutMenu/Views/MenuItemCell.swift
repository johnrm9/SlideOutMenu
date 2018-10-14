//
//  MenuItemCell.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/3/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class MenuItemCell: BaseCell {

    var menuItem: MenuItem? {
        didSet {
            guard let menuItem = menuItem else { return }
            titleLabel.text = menuItem.title
            iconImageView.image = menuItem.icon
        }
    }

    private let iconImageView: IconImageView = {
        let imageView = IconImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "profile")
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.text = "Profile"
        return label
    }()

    override func setupViews() {
        super.setupViews()
        setupStackView()
    }

    fileprivate func setupStackView() {
        let arrangedSubviews = [
            iconImageView,
            titleLabel,
            UIView()
        ]
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews, spacing: 12, margins: .init(vertical: 8, horizontal: 12))

        addSubview(stackView)
        stackView.fillSuperview()
    }

    fileprivate class IconImageView: UIImageView {
        override var intrinsicContentSize: CGSize { return CGSize(all: 44) }
    }
}
