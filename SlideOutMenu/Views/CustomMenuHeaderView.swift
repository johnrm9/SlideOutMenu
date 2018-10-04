//
//  CustomMenuHeaderView.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/2/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class CustomMenuHeaderView: BaseView {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Brian Voong"
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        return label
    }()

    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@buildthatapp"
        label.textColor = .lightGray
        return label
    }()

    private let statsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.text = "42 Following 7091 Followers"
        return label
    }()

    private let profileImageView: ProfileImageView = {
        let imageView = ProfileImageView()
        imageView.contentMode = .scaleAspectFit
        let width = imageView.intrinsicContentSize.width
        imageView.layer.cornerRadius = width / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()

    override func setupViews() {
        super.setupViews()

        setupComponents()
        setupStackView()
    }

    fileprivate func setupStackView() {
        let rightSpacerView = UIView()
        let arrangedSubviews = [
            UIView(),
            UIStackView(arrangedSubviews: [profileImageView, rightSpacerView]),
            nameLabel,
            usernameLabel,
            SpacerView(space: 16),
            statsLabel
        ]
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.spacing = 4

        addSubviews(stackView)

        stackView.fillSuperview()

        stackView.layoutMargins = UIEdgeInsets(all: 24)
    }

    fileprivate func setupComponents() {
        profileImageView.image = #imageLiteral(resourceName: "girl_profile") /* girl_profile */
        setupStatsAttributedText()
    }

    fileprivate func setupStatsAttributedText() {
        let following: NSNumber = 42
        let followers: NSNumber = 7091

        let attributedText = NSMutableAttributedString(string: "\(following) ",
            attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .medium)])
        attributedText.append(NSAttributedString(string: "Following  ", attributes: [.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: "\(followers) ",
            attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .medium)]))
        attributedText.append(NSAttributedString(string: "Followers", attributes: [.foregroundColor: UIColor.black]))
        statsLabel.attributedText = attributedText
    }
}
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
extension UIView {
    func fillSuperview() {
        if let superview = superview {
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
            trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        }
    }
}
