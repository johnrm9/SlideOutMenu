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

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .red
        setupNavigationItems()
    }

    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain) {_ in
            (UIApplication.shared.keyWindow?.rootViewController as? BaseSlidingController)?.openMenu()
        }
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

