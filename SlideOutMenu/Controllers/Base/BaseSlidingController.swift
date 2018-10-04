//
//  BaseSlidingController.swift
//  SlideOutMenu
//
//  Created by John Martin on 9/30/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension CGFloat {
    public init(_ value: Bool) {
        self = value ? 1 : 0
    }
}
extension UIViewController {
    func addChildren(_ children: UIViewController...) {
        children.forEach { addChild($0) }
    }
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            if $0 is UIStackView {
                ($0 as! UIStackView).isLayoutMarginsRelativeArrangement = true
            }
        }
    }
}

class BaseSlidingController: UIViewController {
    var redViewLeadingConstraint: NSLayoutConstraint!

    fileprivate let menuWidth: CGFloat = 300
    fileprivate let velocityThreshold: CGFloat = 500

    fileprivate var isMenuOpened = false {
        didSet {
            redViewLeadingConstraint.constant = isMenuOpened ? menuWidth : 0
            performAnimations()
        }
    }

    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    let darkCoverView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        view.alpha = 0
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        setupViews()

        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:))))
    }

    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: view)

        let translationX = isMenuOpened ? translation.x + menuWidth : translation.x
        let x = max(0, min(menuWidth, translationX))

        redViewLeadingConstraint.constant = x
        darkCoverView.alpha = x / menuWidth

        if gestureRecognizer.state == .ended {
            handleEnded(gestureRecognizer)
        }
    }

    enum MenuStatus {
        case isOpening
        case isClosing
    }

    fileprivate func handleEnded(_ gestureRecognizer: UIPanGestureRecognizer) {

        let translation = gestureRecognizer.translation(in: view)
        let velocity = gestureRecognizer.velocity(in: view)

        let velocityX = abs(velocity.x)
        let translationX = isMenuOpened ? abs(translation.x) : translation.x

        let isOverVelocityThreshold = velocityX > velocityThreshold

        let menuStatus: MenuStatus = isMenuOpened ?
                        isOverVelocityThreshold ? .isClosing :
                            translationX < menuWidth / 2 ? .isOpening : .isClosing :
                        isOverVelocityThreshold ? .isOpening :
                            translationX < menuWidth / 2 ? .isClosing : .isOpening

        switch menuStatus {
        case .isOpening: openMenu()
        case .isClosing: closeMenu()
        }
    }

    fileprivate func openMenu() {
        isMenuOpened = true
//        redViewLeadingConstraint.constant = menuWidth
//        performAnimations()
    }

    fileprivate func closeMenu() {
        isMenuOpened = false
//        redViewLeadingConstraint.constant = 0
//        performAnimations()
    }

    fileprivate func performAnimations() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.darkCoverView.alpha = self.isMenuOpened ? 1 : 0
        })
    }

    fileprivate func setupViews() {
        view.addSubviews(redView, blueView)

        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor),
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            blueView.topAnchor.constraint(equalTo: view.topAnchor),
            blueView.trailingAnchor.constraint(equalTo: redView.safeAreaLayoutGuide.leadingAnchor),
            blueView.widthAnchor.constraint(equalToConstant: menuWidth),
            blueView.bottomAnchor.constraint(equalTo: redView.bottomAnchor)
            ])

        self.redViewLeadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        redViewLeadingConstraint.isActive = true

        setupViewControllers()
    }

    fileprivate func setupViewControllers() {
        let homeController = HomeController()
        let menuController = MenuController()

        let homeView = homeController.view!
        let menuView = menuController.view!

        redView.addSubviews(homeView, darkCoverView)
        blueView.addSubviews(menuView)

        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: redView.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            homeView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            homeView.trailingAnchor.constraint(equalTo: redView.trailingAnchor),

            menuView.topAnchor.constraint(equalTo: blueView.topAnchor),
            menuView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor),
            menuView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor),
            menuView.trailingAnchor.constraint(equalTo: blueView.trailingAnchor),

            darkCoverView.topAnchor.constraint(equalTo: redView.topAnchor),
            darkCoverView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            darkCoverView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            darkCoverView.trailingAnchor.constraint(equalTo: redView.trailingAnchor)
            ])

        addChildren(homeController, menuController)
    }
}

