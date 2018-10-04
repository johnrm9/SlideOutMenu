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

    private let velocityOpenThreshold: CGFloat = 500
    private let menuWidth: CGFloat = 300
    private var isMenuOpened: Bool = false

    private let darkCoverView: UIView = {
        let view = UIView()
        view.alpha = 0
        view.backgroundColor = UIColor(white: 0, alpha: 0.8)
        view.isUserInteractionEnabled = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .red
        setupNavigationItems()

        setupMenuController()

       // setupPanGesture()

        setupDarkCoverView()
    }

    fileprivate func setupPanGesture() {
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:))))
    }

    fileprivate func setupDarkCoverView() {
        UIApplication.shared.keyWindow?.addSubview(darkCoverView)
        darkCoverView.frame = UIApplication.shared.keyWindow?.frame ?? .zero
    }

    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: view)

        if gestureRecognizer.state == .changed {
            let translationX = isMenuOpened ? translation.x + menuWidth : translation.x
            let x = max(0, min(menuWidth, translationX))

            let transform = CGAffineTransform(translationX: x, y: 0)

            menuController.view.transform = transform
            navigationController?.view.transform = transform
            darkCoverView.transform = transform

            darkCoverView.alpha = x / menuWidth

        } else if gestureRecognizer.state == .ended {
            handleEnded(gestureRecognizer)
        }
    }

    enum MenuStatus {
        case isOpening
        case isHiding
    }

    fileprivate func handleEnded(_ gestureRecognizer: UIPanGestureRecognizer) {
        let menuStatus: MenuStatus

        let translation = gestureRecognizer.translation(in: view)
        let velocity = gestureRecognizer.velocity(in: view)

        let velocityX = isMenuOpened ? abs(velocity.x) : velocity.x
        let translationX = isMenuOpened ? abs(translation.x) : translation.x

        let isOverVelocityOpenThreshold = velocityX > velocityOpenThreshold

        if isMenuOpened {
            menuStatus = isOverVelocityOpenThreshold ? .isHiding :
                translationX < menuWidth / 2 ? .isOpening : .isHiding

        } else {
            menuStatus = isOverVelocityOpenThreshold ? .isOpening :
                translationX < menuWidth / 2 ? .isHiding : .isOpening
        }

        switch menuStatus {
        case .isOpening: handleOpen()
        case .isHiding:  handleHide()
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

            self.darkCoverView.transform = tranform
            self.darkCoverView.alpha = tranform == .identity ? 0 : 1
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
        isMenuOpened = true
        performAnimations(tranform: CGAffineTransform(translationX: menuWidth, y: 0))
    }

    @objc func handleHide() {
        isMenuOpened = false
        performAnimations(tranform: .identity)
    }
}

