//
//  BookmarksController.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/6/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class BookmarksController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "Bookmark: \(indexPath.row)"
        return cell
    }

}
