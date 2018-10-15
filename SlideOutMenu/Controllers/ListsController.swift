//
//  ListsController.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/4/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

func make<T>(_ setup: ((T) -> Void)) -> T where T: NSObject {
    let obj = T()
    setup(obj)
    return obj
}

class ListsController: UIViewController {

    let listsLabel: UILabel = make { (label) in
        label.text = "Lists"
        label.font = .boldSystemFont(ofSize: 64)
        label.textAlignment = .center
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Lists"
        navigationController?.navigationBar.prefersLargeTitles = true

        view.addSubview(listsLabel)
        listsLabel.centerInSuperview()
    }
}
