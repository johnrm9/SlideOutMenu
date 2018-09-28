//
//  HomeController.swift
//  SlideOutMenu
//
//  Created by John Martin on 9/25/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    private let cellId: String = "cellId"

    private let menuController = MenuController()
    private let menuWidth: CGFloat = 300

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .red
        setupNavigationItems()
        setupMenuController()

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        view.addGestureRecognizer(panGesture)
    }

    @objc func handlePan(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: view)

        if recognizer.state == .changed {
            let x = max(0, min(menuWidth, translation.x))

            let transform = CGAffineTransform(translationX: x, y: 0)

            menuController.view.transform = transform
            navigationController?.view.transform = transform
        } else if recognizer.state == .ended {
            handleOpen()
        }
    }

    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self,
                                                    action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self,
                                                    action: #selector(handleHide))

    }

    fileprivate func setupMenuController() {
        let height = self.view.frame.height
        menuController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: height)
        UIApplication.shared.keyWindow?.addSubview(menuController.view)
        addChild(menuController)
    }

    fileprivate func performAnimations(tranform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {
            self.menuController.view.transform = tranform
            //            self.view.transform = tranform
            // I'll let you think about this on your own
            self.navigationController?.view.transform = tranform
        })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: .default, reuseIdentifier: cellId)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }

    @objc func handleOpen() {
        performAnimations(tranform: CGAffineTransform(translationX: menuWidth, y: 0))
    }

    @objc func handleHide() {
        performAnimations(tranform: .identity)
    }
}

