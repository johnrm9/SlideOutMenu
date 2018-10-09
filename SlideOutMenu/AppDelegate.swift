//
//  AppDelegate.swift
//  SlideOutMenu
//
//  Created by John Martin on 9/25/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

struct Constants {
    static let chatrromsBackgroundColor = "ChatrromsBackgroundColor"
    static let chatroomCellColor = "ChatroomCellColor"
    static let chatroomTextColor = "ChatroomTextColor"
    static let chatroomsSeachBackgroudColor = "ChatroomsSeachBackgroudColor"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = BaseSlidingController()
        //window?.rootViewController = UINavigationController(rootViewController: HomeController())
        return true
    }
}

