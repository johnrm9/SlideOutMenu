//
//  ChatroomsMenuContainerController.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/9/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class ChatroomsMenuContainerController: UIViewController {

    private let chatroomsMenuController = ChatroomsMenuController()

    private let searchContainer = SearchContainerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .chatrromsBackgroundColor

        searchContainer.searchBar.delegate = chatroomsMenuController

        let chatroomsView = chatroomsMenuController.view!
        view.addSubview(chatroomsView)

        view.addSubview(searchContainer)
        searchContainer.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        searchContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64).isActive = true

        chatroomsView.anchor(top: searchContainer.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}

class SearchContainerView: BaseView {

    public let searchBar: UISearchBar = make { (sb) in
        sb.searchBarStyle = .minimal
        sb.autocapitalizationType = .none
        sb.placeholder = "Jump to…"
    }

    private let rocketImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "rocket") /* rocket */)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()

    override func setupViews() {
        super.setupViews()
        backgroundColor = .chatroomsSeachBackgroudColor

        addSubviews(searchBar, rocketImageView)
        rocketImageView.anchor(leading: safeAreaLayoutGuide.leadingAnchor, bottom: bottomAnchor, padding: .init(top: 0, left: 10, bottom: 10, right: 0), size: .init(all: 44))
        searchBar.anchor(leading: rocketImageView.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(bottom: 4))
    }
}
