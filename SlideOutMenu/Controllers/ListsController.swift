//
//  ListsController.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/4/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

//class ListLabel: UILabel {
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 140, height: 80)
//    }
//}

class ListsController: UIViewController {

    let listsLabel: UILabel = {
        let label = UILabel()
        label.text = "Lists"
        label.font = .boldSystemFont(ofSize: 64)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Lists"
        navigationController?.navigationBar.prefersLargeTitles = true

        listsLabel.frame = view.frame
        view.addSubview(listsLabel)
//        listsLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        listsLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
}
