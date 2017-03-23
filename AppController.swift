//
//  AppController.swift
//  AlarmClockSecondTry
//
//  Created by Sabina Buruiana on 3/23/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import Foundation
import UIKit

class AppController {
    
    static func lauchMainView (_ window: UIWindow) {
        createTabBar(window: window)
        window.makeKeyAndVisible()
    }
    
    
    static func createTabBar (window: UIWindow?) {
        let tabBarController = DashboardTabBar(nibName: "DashboardTabBar", bundle: nil)
        let first = FirstViewController(nibName: "FirstViewController", bundle: nil)
        let second = SecondViewController(nibName: "SecondViewController", bundle: nil)
        let firstNavVC = UINavigationController(rootViewController: first)
        let secondNavVC = UINavigationController(rootViewController: second)
        tabBarController.viewControllers = [firstNavVC, secondNavVC]
        window?.rootViewController = tabBarController
        let firstImage = UIImage(named: "alarm")
        let secondImage = UIImage(named: "timer")
        first.tabBarItem = UITabBarItem(title: firstTabBarButton, image: firstImage, tag: 1)
        second.tabBarItem = UITabBarItem(
            title: secondTabBarButton,
            image: secondImage,
            tag:2)
    }
    
}
