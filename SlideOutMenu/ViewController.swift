//
//  ViewController.swift
//  SlideOutMenu
//
//  Created by John Martin on 9/25/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let cellId: String = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .red
        setupNavigationItems()
    }

    func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self,
                                                    action: #selector(handleOpen(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self,
                                                    action: #selector(handleHide(_:)))

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: .default, reuseIdentifier: cellId)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }

    @objc func handleOpen(_ sender: UIBarButtonItem) {
        print(#function)
    }
    @objc func handleHide(_ sender: UIBarButtonItem) {
        print(#function)
    }
}

