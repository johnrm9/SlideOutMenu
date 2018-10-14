//
//  HomeController.swift
//  SlideOutMenu
//
//  Created by John Martin on 9/25/18.
//  Copyright © 2018 John Martin. All rights reserved.
//
import GestureRecognizerClosures
import UIKit

class HomeController: UITableViewController {
    private let cellId: String = "cellId"

    private let leftBarButtonItem: UIBarButtonItem = {
        let customView = UIButton(type: .system)
        customView.setImage(#imageLiteral(resourceName: "girl_profile").withRenderingMode(.alwaysOriginal), for: .normal)
        customView.imageView?.contentMode = .scaleAspectFit
        let width: CGFloat = 40
        customView.layer.cornerRadius = width / 2
        customView.layer.masksToBounds = true
        customView.anchor(size: .init(width: width, height: width))
        customView.onTap {_ in (UIApplication.shared.keyWindow?.rootViewController as? BaseSlidingController)?.openMenu() }
        return UIBarButtonItem(customView: customView)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .red
        setupNavigationItems()
    }

    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: .default, reuseIdentifier: cellId)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
}

