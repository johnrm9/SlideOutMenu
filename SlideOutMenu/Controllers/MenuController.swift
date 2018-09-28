//
//  MenuController.swift
//  SlideOutMenu
//
//  Created by John Martin on 9/26/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {
    let cellId: String = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
}
