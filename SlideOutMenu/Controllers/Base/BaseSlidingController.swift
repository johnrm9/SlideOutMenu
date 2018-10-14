//
//  BaseSlidingController.swift
//  SlideOutMenu
//
//  Created by John Martin on 9/30/18.
//  Copyright © 2018 John Martin. All rights reserved.
//
import GestureRecognizerClosures
import UIKit

extension BaseSlidingController: BaseSlidingControllerDelegate {
    func didSelectMenuItem(with item: MenuItemType) {
        performRightViewCleanUp()
        closeMenu()
        switch item {
        case .profile:
            rightViewController = UINavigationController(rootViewController: HomeController())
        case .lists:
            rightViewController = UINavigationController(rootViewController: ListsController())
        case .bookmarks:
            rightViewController = BookmarksController()
        case .moments:
            let tabBarController = UITabBarController()
            let momentsController = UIViewController()
            momentsController.view.backgroundColor = .orange
            momentsController.navigationItem.title = "Moments"
            let navigationController = UINavigationController(rootViewController: momentsController)
            navigationController.tabBarItem.title = "Moments"
            tabBarController.viewControllers = [navigationController]
            rightViewController = tabBarController
        }

        redView.addSubview(rightViewController.view)
        addChild(rightViewController)

        redView.bringSubviewToFront(darkCoverView)
    }
}

class RightContainerView: UIView {}
class MenuContainerView: UIView {}
class DarkCoverView: UIView {}

class BaseSlidingController: UIViewController {
    //private let menuController = MenuController()
    private let menuController = ChatroomsMenuContainerController()

    private var redViewLeadingConstraint: NSLayoutConstraint!
    private var redViewTrailingConstraint: NSLayoutConstraint!

    private var rightViewController: UIViewController = UINavigationController(rootViewController: HomeController())

    fileprivate let menuWidth: CGFloat = 300
    fileprivate let velocityThreshold: CGFloat = 500

    fileprivate var isMenuOpened = false {
        didSet {
            let x: CGFloat = isMenuOpened ? menuWidth : 0
            (redViewLeadingConstraint.constant, redViewTrailingConstraint.constant) = (x, x)
            performAnimations()
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    private let redView: RightContainerView = {
        let view = RightContainerView()
        return view
    }()

    private let blueView: MenuContainerView = {
        let view = MenuContainerView()
        view.backgroundColor = .blue
        return view
    }()

    private lazy var darkCoverView: DarkCoverView = {
        let view = DarkCoverView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        view.alpha = 0
        view.onTap {_ in self.closeMenu() }
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupViews()

        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:))))
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isMenuOpened ? .lightContent : .default
    }

    fileprivate func performRightViewCleanUp() {
        rightViewController.performCleanup()
    }

    @objc private func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: view)

        let translationX = isMenuOpened ? translation.x + menuWidth : translation.x
        let x = max(0, min(menuWidth, translationX))

        (redViewLeadingConstraint.constant, redViewTrailingConstraint.constant) = (x, x)

        darkCoverView.alpha = x / menuWidth

        if gestureRecognizer.state == .ended {
            handleEnded(gestureRecognizer)
        }
    }

    fileprivate enum MenuStatus {
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

    public func openMenu() { isMenuOpened = true }

    public func closeMenu() { isMenuOpened = false }

    fileprivate func performAnimations() {
        let alpha = CGFloat(isMenuOpened)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1,
                       options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.darkCoverView.alpha = alpha
        })
    }

    fileprivate func setupViews() {
        view.addSubviews(redView, blueView)

        redViewTrailingConstraint = redView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        redViewLeadingConstraint  = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor)

        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor),
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            redViewLeadingConstraint,
            redViewTrailingConstraint,

            blueView.topAnchor.constraint(equalTo: view.topAnchor),
            blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor),
            blueView.widthAnchor.constraint(equalToConstant: menuWidth),
            blueView.bottomAnchor.constraint(equalTo: redView.bottomAnchor)
            ])

        setupViewControllers()
    }

    fileprivate func setupViewControllers() {
        let homeView = rightViewController.view!
        let menuView = menuController.view!

        redView.addSubviews(homeView, darkCoverView); blueView.addSubview(menuView)

        [homeView, menuView, darkCoverView].forEach { $0.fillSuperview() }

        addChildren(rightViewController, menuController)
    }
}
